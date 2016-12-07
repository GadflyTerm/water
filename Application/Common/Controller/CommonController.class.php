<?php
/**
 * Created by PhpStorm.
 * User: gadfly
 * Date: 2016/11/15
 * Time: 上午10:20
 */
namespace Common\Controller;
use Think\Controller;

class CommonController extends Controller{
	protected $nav;

	public function __construct(){
		parent::__construct();
	}
	
	public function info(){
		phpinfo();
	}

	/**
	 * Import Excel 从Excel导入数据
	 * @param $file		Excel 文件
	 * @return array	返回数据
	 */
	protected function importExecl($file, $sh=0){
		if(!file_exists($file)) return array("error"=>0, 'message'=>'file not found!');
		Vendor("PHPExcel.IOFactory");
		$ext = pathinfo($file);
		switch (strtolower($ext["extension"])){
			case 'xlsx':
				$type = 'Excel2007';
				break;
			case 'cvs':
			default:
				$type = 'Excel5';
				break;
		}
		$reader = \PHPExcel_IOFactory::createReader($type);
		$PHPExcel = $reader->load($file);
		$sheet = $PHPExcel->getSheet($sh); // 读取第一個工作表
		$highestRow = $sheet->getHighestRow(); // 取得总行数
		$highestColumm = $sheet->getHighestColumn(); // 取得总列数
		/** 循环读取每个单元格的数据 */
		for ($row = 1; $row <= $highestRow; $row++){//行数是以第1行开始
			$flag = false;
			for ($column = 'A'; $column <= $highestColumm; $column++) {//列数是以A列开始
				$dataset[$row-1][] = $sheet->getCell($column.$row)->getValue();
				if(!is_null($sheet->getCell($column.$row)->getValue())) $flag = true;
			}
			if(!$flag) unset($dataset[$row-1]);
		}
		return $dataset;
	}

	public function upload(){
		header('Content-Type:application/json; charset=utf-8');
		if(empty($_FILES)){
			$this->ajaxReturn(array('error_code' => 99999999, 'type' => 'error', 'message' => 'No files found for upload.', 'file' => $_FILES));
		}else{
			$success = null;
			$paths= array();
			$response = array('error_code' => 0, 'result' => array());
			if($response['error_code'] == 0){
				$filePath = '/'.I('get.group', 'App').'/'.I('get.path', 'upload').date('/Y/md/');
				$targetPath = str_replace('//', '/', C('UPLOAD_PATH'));
				if(!file_exists($targetPath.$filePath)) mkdirs($targetPath.$filePath, 0755, true);
				foreach($_FILES AS $k => $upload){
					$newName = $filePath.uploadName($upload['name']);
					if(move_uploaded_file($upload['tmp_name'], $targetPath.$newName)){
						$success = true;
						$paths[] = $newName;
						$src[] = imgSrc($newName, I('get.width', '300'), I('get.height', '225'));
					}else{
						$success = false;
						break;
					}
				}
				if($success === true){
					$output = array('type' => 'success', 'reason' => '上传文件成功！', 'target' => $paths, 'src' => $src);
				}elseif($success === false){
					$output = array('type' => 'error', 'reason' => 'Error while uploading images. Contact the system administrator');
					foreach ($paths as $file) {
						unlink($file);
					}
				} else {
					$output = array('type' => 'error', 'reason' => 'No files were processed.');
				}
				$this->ajaxReturn((array_merge($output, $response)));
			}else{
				$this->ajaxReturn((array_merge($response, array('type' => 'error'))));
			}
		}
	}

	/**
	 * export Excel 数据导出至Excel
	 * @param $expFileName	 String		导出文件名字符串（不包含后缀）
	 * @param $expCellName	 Array		导出文件列名称列表
	 * @param $expTableData	 Array		需要导出的数据
	 */
	public function exportExcel($expFileName, $expCellName, $expTableData, $ext='xls'){
		$xlsFile = iconv('utf-8', 'gb2312', $expFileName);//文件名称
		$fileName = $_SESSION['loginAccount'].date('_YmdHis');//or $xlsTitle 文件名称可根据自己情况设定
		$cellNum = count($expCellName);
		$dataNum = count($expTableData);
		Vendor("PHPExcel");
		$objPHPExcel = new \PHPExcel();
		$cellName = array('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','AA','AB','AC','AD','AE','AF','AG','AH','AI','AJ','AK','AL','AM','AN','AO','AP','AQ','AR','AS','AT','AU','AV','AW','AX','AY','AZ');

		$objPHPExcel->getActiveSheet(0)->mergeCells('A1:'.$cellName[$cellNum-1].'1');						//合并单元格
		$objPHPExcel->setActiveSheetIndex(0)->setCellValue('A1', $expFileName.'  Export time:'.date('Y-m-d H:i:s'));
		for($i=0;$i<$cellNum;$i++){
			$objPHPExcel->setActiveSheetIndex(0)->setCellValue($cellName[$i].'2', $expCellName[$i][1]);
			$objPHPExcel->getActiveSheet()->getColumnDimension($cellName[$i])->setAutoSize(true);   		//内容自适应
			$objPHPExcel->getActiveSheet()->getColumnDimension($cellName[$i])->setWidth(30);         		//30宽
		}
		// Miscellaneous glyphs, UTF-8   
		for($i=0;$i<$dataNum;$i++){
			for($j=0;$j<$cellNum;$j++){
				$objPHPExcel->getActiveSheet(0)->setCellValue($cellName[$j].($i+3), $expTableData[$i][$expCellName[$j][0]]);
			}
		}
		switch ($ext){
			case 'xls':
				header('pragma:public');
				header('Content-type:application/vnd.ms-excel;charset=utf-8;name="'.$xlsFile.'.xls"');
				header("Content-Disposition:attachment;filename=$fileName.xls");//attachment新窗口打印inline本窗口打印
				$objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
				$objWriter->save('php://output');
				break;
			case 'xlsx':
				header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
				header('Content-Disposition: attachment;filename="'.$xlsFile.'.xlsx"');
				header('Cache-Control: max-age=0');
				$objWriter = PHPExcel_IOFactory:: createWriter($objPHPExcel, 'Excel2007');
				$objWriter->save( 'php://output');
				break;
			case 'pdf':
				header('Content-Type: application/pdf');
				header('Content-Disposition: attachment;filename="'.$xlsFile.'.pdf"');
				header('Cache-Control: max-age=0');
				$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'PDF');
				$objWriter->save('php://output');
				break;
			case 'cvs':
				$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'CSV');
				$objWriter->setDelimiter(',' );  		//设置分隔符
				$objWriter->setLineEnding("\r\n" );		//设置行分隔符
				$objWriter->save(str_replace('.php' , '.csv' , __FILE__));
				break;
			case 'htm':
				$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'HTML');       	//将$objPHPEcel对象转换成html格式的
				$objWriter->setSheetIndex(0);  												//设置活动表 //
				$objWriter->setImagesRoot('http://www.water.com');
				$objWriter->save(str_replace('.php', '.htm', __FILE__));     				//保存文件
		}
	}
}