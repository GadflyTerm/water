<?php
/**
 * Created by PhpStorm.
 * User: gadfly
 * Date: 2016/11/11
 * Time: 下午5:36
 */
$username = "sa";
$pwd = "weA3#q7*";
try{
	$dbh = new PDO('sqlsrv:host=10.211.55.3;dbname=water',$username,$pwd);
	$sqlstri = "select * from dbo.onethink_action";
	foreach ($dbh->query($sqlstri) as $row){
		print_r($row);
	}
}catch (PDOException $e){
	print "Error:".$e->getMessage()."<br>";
}
