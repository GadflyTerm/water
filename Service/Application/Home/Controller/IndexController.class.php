<?php
namespace Home\Controller;
use Common\Controller\CommonController;
class IndexController extends CommonController {
    public function index(){
        echo U('Index/info');
        $this->show('<style type="text/css">*{ padding: 0; margin: 0; } div{ padding: 4px 48px;} body{ background: #fff; font-family: "微软雅黑"; color: #333;font-size:24px} h1{ font-size: 100px; font-weight: normal; margin-bottom: 12px; } p{ line-height: 1.8em; font-size: 36px } a,a:hover{color:blue;}</style><div style="padding: 24px 48px;"> <h1>:)</h1><p>欢迎使用 <b>ThinkPHP</b>！</p><br/>版本 V{$Think.version}</div><script type="text/javascript" src="http://ad.topthink.com/Public/static/client.js"></script><thinkad id="ad_55e75dfae343f5a1"></thinkad><script type="text/javascript" src="http://tajs.qq.com/stats?sId=9347272" charset="UTF-8"></script>','utf-8');
    }

    public function base(){
        try{
            $test = D('Test', 'Logic');
            dump($test->ddd());
            dump($test->ddde());
            dump($test->base());
        }catch(Exception $e){
            print $e->getMessage();
        }
    }

    public function mssql(){
        $nav = array();
        try{
            dump($nav);
            dump(D('Test')->mssql());
        }catch(Exception $e){
            echo 'Connection failed: ' . $e->getMessage();
        }
    }

    public function ttt(){
        $link = mssql_connect('114.55.231.186', 'PYGQ', 'lonhwin@2011sql');
        mssql_select_db('Hydrology_pygq', $link);
        $result = mssql_query('SELECT * FROM dbo.ST_TABLE_D', $link);
        dump($result);
        dump($link);
    }
}