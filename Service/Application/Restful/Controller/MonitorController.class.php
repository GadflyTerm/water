<?php
namespace Restful\Controller;
use think\Controller;
class MonitorController extends Controller{

	public function _initialzie(){
		

	}
	public function get_sk_list(){

	}	
	public function get_yl_list(){
		
	}	
	public function get_zw_list(){
		
	}	
	public function get_ll_list(){
		$Sites = M('st_stbprp_b');

		$map['_string'] = "STTP = 'ZQ' OR STTP ='ZZ'";
		$result =  $Sites->where($map)->select();
		dump($result);
	}	
	public function get_sq_list(){
		
	}



}