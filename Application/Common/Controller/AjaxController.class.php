<?php
/**
 * Created by PhpStorm.
 * User: gadfly
 * Date: 2016/11/23
 * Time: 下午7:23
 */

namespace Common\Controller;
use Think\Controller\RestController;

class AjaxController extends RestController{
	
	public function angular($rsa=null){
		$param = I('param.');
		if(is_null($rsa)){
			$decrypt = json_decode($this->_privateKeyDecode($param['rsa'], $key), true);
			$module = (isset($decrypt['ac']))?$decrypt['ac'].'Ajax':'angular';
			$model = (isset($decrypt['mo']))?ucfirst($decrypt['mo']):ucfirst(MODULE_NAME);
			$op = ucfirst($decrypt['op']).'_'.$this->_method;
		}else{
			$module = (isset($param['ac']))?$param['ac'].'Ajax':'angular';
			$model = (isset($param['op']))?ucfirst($param['op']):ucfirst(MODULE_NAME);
			$op = ucfirst($param['op']).'_'.$this->_method;
		}
		if($module == 'angular'){
			$msg = '系统在'.$model.'模型中没有找到'.$decrypt['op'].'方法';
			if(method_exists(D($model), $decrypt['op']))
				$return = call_user_func(array(D($model), $op), $param);
			else
				$return = array('errcode' => 10001, 'msg' => $msg, 'public' => $key);
		}else{
			$msg = '系统在'.$model.'控制器中没有找到'.$module.'方法';
			if(method_exists($this, $module))
				$return = call_user_func(array(&$this, $module), $param);
			else
				$return = array('errcode' => 10002, 'msg' => $msg, 'public' => $key);
		}
		$this->response(is_array($return)?$return:array('errcode' => 10000, 'msg' => '', 'data' => $return));
	}

	protected function memcache($type, $key, $value=null, $expire=3600){
		$mem = new Memcache();
		$mem->connect('127.0.0.1', '11211');
		switch($type){
			case 'connect':
				$return = $mem;
				break;
			case 'add':
				$return = $mem->add($key, $value, MEMCACHE_COMPRESSED, $expire);
				$mem->close();
				break;
			case 'set':
				$return = $mem->set($key, $value, MEMCACHE_COMPRESSED, $expire);
				$mem->close();
				break;
			case 'replace':
				if($mem->replace($key, $value, MEMCACHE_COMPRESSED, $expire))
					$return = true;
				else
					$return = $this->memcache('set', $key, $value, $expire);
				$mem->close();
				break;
			case 'delect':
				$return = $mem->delete($key);
				$mem->close();
				break;
			case 'get':
				$return = $mem->get($key);
				$mem->close();
				break;
		}
		return $return;
	}

	/**
	 * 创建生成服务器和客户端RSA密钥
	 *
	 * @return array|mixed
	 */
	protected function createRsaKey(){
		if(strtoupper(substr(PHP_OS, 0, 3)) === 'WIN'){
			$config = array('config' => 'D:\xampp\php\extras\openssl\openssl.cnf');
		}else{
			$config = array(
				"digest_alg" => "sha512",
				"private_key_bits" => 1024,
				"private_key_type" => OPENSSL_KEYTYPE_RSA,
			);
		}
		$res1 = openssl_pkey_new($config);
		openssl_pkey_export($res1, $privateKeyService, null, $config);
		$publicKeyService = openssl_pkey_get_details($res1);
		$res2 = openssl_pkey_new($config);
		openssl_pkey_export($res2, $privateKeyClient, null, $config);
		$publicKeyClient = openssl_pkey_get_details($res2);
		return array(
			'service_public'    => $publicKeyService['key'],
			'service_private'   => $privateKeyService,
			'client_public'     => $publicKeyClient['key'],
			'client_private'    => $privateKeyClient,
			'create_key_dateline' => time(),
		);
	}
	
	protected function getRsaKey($change, $uuid){
		if(in_array($change, array('createRsaKey', 'changeRsaKey'))){
			$key = $this->createRsaKey();
			switch($change){
				case 'createRsaKey':
					$this->memcache('replace', $uuid.'-RsaKey', $key);
					break;
				case 'changeRsaKey':
					$this->memcache('replace', $uuid.'-RsaKey', $key);
					break;
			}
			return $this->memcache('get', $uuid.'-RsaKey');
		}else{
			return $this->memcache('delect', $uuid.'-RsaKey');
		}
	}

	/**
	 * 私钥加密
	 * @param $sourcestr    需加密的数据字符串
	 *
	 * @return string       加密后的字符串
	 */
	protected function _privateKeyEncode($sourcestr, $key, $tojs = FALSE){
		//$prikeyid = openssl_get_privatekey(file_get_contents(self::PRIVATE_KEY));
		$prikeyid = openssl_get_privatekey($key);
		$padding = $tojs?OPENSSL_NO_PADDING:OPENSSL_PKCS1_PADDING;
		if(openssl_private_encrypt($sourcestr, $crypttext, $prikeyid, $padding)){
			return base64_encode("".$crypttext);
		}
	}

	/**
	 * 公钥加密
	 *
	 * @param string 明文
	 * @param string 证书文件（.crt）
	 *
	 * @return string 密文（base64编码）
	 *
	 * //JS->PHP 测试
	 * $txt_en = $_POST['password'];
	 * $txt_en = base64_encode(pack("H*", $txt_en));
	 * $file = 'ssl/server.pem';
	 * $txt_de = $this->privateKeyDecode($txt_en, $file, TRUE);
	 * var_dump($txt_de);
	 * //PHP->PHP 测试
	$encrypt = $this->_publicKeyEncode('{"name":"公钥加密私钥解密测试","password":"dg123456"}');
	$decrypt = $this->_privateKeyDecode($encrypt);
	echo '<h2>公钥加密, 私钥解密</h2>';
	echo 'encode: <p>'.$encrypt.'</p><br>';
	echo 'dncode: '.$decrypt.'<br>';
	echo '<br><hr>';
	$encrypt = $this->_privateKeyEncode('{"name":"私钥加密公钥解密测试","password":"pw123456"}');
	$decrypt = $this->_publicKeyDecode($encrypt);
	echo '<h2>私钥加密, 公钥解密</h2>';
	echo 'encode: <p>'.$encrypt.'</p><br>';
	echo 'dncode: '.$decrypt.'<br>';
	echo '<br><hr>';
	 */
	protected function _publicKeyEncode($sourcestr, $key, $tojs = FALSE){
		//$pubkeyid = openssl_get_publickey(file_get_contents(self::PUBLIC_KEY));
		$pubkeyid = openssl_get_publickey($key);
		$padding = $tojs?OPENSSL_NO_PADDING:OPENSSL_PKCS1_PADDING;
		if(openssl_public_encrypt($sourcestr, $crypttext, $pubkeyid, $padding)){
			return base64_encode("".$crypttext);
		}
	}

	/**
	 * 私钥解密
	 *
	 * @param string    $crypttext 密文（二进制格式且base64编码）
	 * @param bool      $fromjs    密文是否来源于JS的RSA加密
	 *
	 * @return string 明文
	 */
	protected function _privateKeyDecode($crypttext, $key, $fromjs = FALSE){
		//$prikeyid = openssl_get_privatekey(file_get_contents(self::PRIVATE_KEY));
		$prikeyid = openssl_get_privatekey($key);
		$padding = $fromjs ? OPENSSL_NO_PADDING : OPENSSL_PKCS1_PADDING;
		if(openssl_private_decrypt(base64_decode($crypttext), $sourcestr, $prikeyid, $padding)){
			return $fromjs ? rtrim(strrev($sourcestr), "/0") : "".$sourcestr;
		}
		return ;
	}

	/**
	 * 公钥解密
	 * @param string    $crypttext   需解密的字符串
	 * @param bool      $fromjs      密文是否来源于JS的RSA加密
	 *
	 * @return string|void      解密后的字符串
	 */
	protected function _publicKeyDecode($crypttext, $key, $fromjs = FALSE){
		//$pubkeyid = openssl_get_publickey(file_get_contents(self::PUBLIC_KEY));
		$pubkeyid = openssl_get_publickey($key);
		$padding = $fromjs ? OPENSSL_NO_PADDING : OPENSSL_PKCS1_PADDING;
		if(openssl_public_decrypt(base64_decode($crypttext), $sourcestr, $pubkeyid, $padding)){
			return $fromjs ? rtrim(strrev($sourcestr), "/0") : "".$sourcestr;
		}
		return ;
	}
}