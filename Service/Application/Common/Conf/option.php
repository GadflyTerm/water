<?php
/**
 * Created by PhpStorm.
 * User: gadfly
 * Date: 2016/11/17
 * Time: 上午11:35
 */
return array(
	'STTP'	=> array(			// 测站类型
		array('value' => 'PP', 'lable' => '雨量站'),
		array('value' => 'ZQ', 'lable' => '河道水文站'),
		array('value' => 'ZZ', 'lable' => '河道水位站'),
		array('value' => 'RR', 'lable' => '水库水文站'),
		array('value' => 'DD', 'lable' => '堰闸水文站'),
		array('value' => 'SS', 'lable' => '墒情站'),
		array('value' => 'MM', 'lable' => '气象站'),
		array('value' => 'BB', 'lable' => '蒸发站'),
		array('value' => 'TT', 'lable' => '潮位站'),
		array('value' => 'DP', 'lable' => '泵站'),
		array('value' => 'ZG', 'lable' => '地下水站'),
		array('value' => 'ZB', 'lable' => '分洪水位站'),
	),
	'TASK'	=> array(
		array('value' => 'PFL', 'lable' => '报送降雨量'),
		array('value' => 'EFL', 'lable' => '报送蒸发量'),
		array('value' => 'ZFL', 'lable' => '报送水位'),
		array('value' => 'QFL', 'lable' => '报送流量'),
		array('value' => 'WFL', 'lable' => '报送蓄水量'),
		array('value' => 'INQFL', 'lable' => '报送入库流量'),
		array('value' => 'DAMFL', 'lable' => '报送闸门启闭'),
		array('value' => 'OTQFL', 'lable' => '报送出库流量'),
		array('value' => 'SOILFL', 'lable' => '报送土壤墒情'),
		array('value' => 'PPFL', 'lable' => '报送引水量'),
		array('value' => 'DRNFL', 'lable' => '报送排水量'),
		array('value' => 'WDWVFL', 'lable' => '报送风浪'),
		array('value' => 'SEDFL', 'lable' => '报送泥沙'),
		array('value' => 'ICEFL', 'lable' => '报送冰情'),
		array('value' => 'GRWFL', 'lable' => '报送地下水'),
		array('value' => 'STATFL', 'lable' => '报送旬月统计'),
	),
	'FRGRD'	=> array(			// 报汛等级
		array('value' => '', 'lable' => '请选择报汛等级', 'selected' => true),
		array('value' => 1, 'lable' => '中央报汛站'),
		array('value' => 2, 'lable' => '省级重点报汛站'),
		array('value' => 3, 'lable' => '省级一般报汛站'),
		array('value' => 4, 'lable' => '其它报汛站'),
	),
	'LOCALITY'	=> array(		// 交换管理单位
		array('id' => 0, 'value' => '', 'lable' => '请选择交换管理单位'),
		array('id' => 1, 'value' => '部水文局', 'lable' => '水利部水文局'),
		array('id' => 2, 'value' => '长江委水文', 'lable' => '长江水利委员会水文局'),
		array('id' => 3, 'value' => '黄委水文', 'lable' => '黄河水利委员会水文局'),
		array('id' => 4, 'value' => '淮委水文', 'lable' => '淮河水利委员会水文局'),
		array('id' => 5, 'value' => '松辽委水文', 'lable' => '松辽水利委员会水文局'),
		array('id' => 6, 'value' => '珠江委水文', 'lable' => '珠江水利委员会水文局'),
		array('id' => 7, 'value' => '海委水文', 'lable' => '海河水利委员会水文局'),
		array('id' => 8, 'value' => '太湖局水文', 'lable' => '太湖流域管理局水文局'),
		array('id' => 9, 'value' => '北京水文', 'lable' => '北京市水文总站'),
		array('id' => 10, 'value' => '天津水文', 'lable' => '天津市水文水资源勘测管理中心'),
		array('id' => 11, 'value' => '河北水文', 'lable' => '河北省水文水资源勘测局'),
		array('id' => 12, 'value' => '山西水文', 'lable' => '山西省水文水资源勘测局'),
		array('id' => 13, 'value' => '内蒙古水文', 'lable' => '内蒙古自治区水文总局'),
		array('id' => 14, 'value' => '辽宁水文', 'lable' => '辽宁省水文水资源勘测局'),
		array('id' => 15, 'value' => '吉林水文', 'lable' => '吉林省水文水资源局'),
		array('id' => 16, 'value' => '黑龙江水文', 'lable' => '黑龙江省水文局'),
		array('id' => 17, 'value' => '上海水文', 'lable' => '上海市防汛信息中心'),
		array('id' => 18, 'value' => '江苏水文', 'lable' => '江苏省水文水资源勘测局'),
		array('id' => 19, 'value' => '浙江水文', 'lable' => '浙江省水文局'),
		array('id' => 20, 'value' => '安徽水文', 'lable' => '安徽省水文局'),
		array('id' => 21, 'value' => '福建水文', 'lable' => '福建省水文水资源勘测局'),
		array('id' => 22, 'value' => '江西水文', 'lable' => '江西省水文局'),
		array('id' => 23, 'value' => '山东水文', 'lable' => '山东省水文水资源勘测局'),
		array('id' => 24, 'value' => '河南水文', 'lable' => '河南省水文水资源局'),
		array('id' => 25, 'value' => '湖北水文', 'lable' => '湖北省水文水资源局'),
		array('id' => 26, 'value' => '湖南水文', 'lable' => '湖南省水文水资源勘测局'),
		array('id' => 27, 'value' => '广东水文', 'lable' => '广东省水文局'),
		array('id' => 28, 'value' => '广西水文', 'lable' => '广西壮族自治区水文水资源局'),
		array('id' => 29, 'value' => '海南水文', 'lable' => '海南省水文水资源勘测局'),
		array('id' => 30, 'value' => '重庆水文', 'lable' => '重庆市水文水资源勘测局'),
		array('id' => 31, 'value' => '四川水文', 'lable' => '四川省水文水资源勘测局'),
		array('id' => 32, 'value' => '贵州水文', 'lable' => '贵州省水文水资源局'),
		array('id' => 33, 'value' => '云南水文', 'lable' => '云南省水文水资源局', 'selected' => true),
		array('id' => 34, 'value' => '西藏水文', 'lable' => '西藏自治区水文水资源勘测局'),
		array('id' => 35, 'value' => '陕西水文', 'lable' => '陕西省水文水资源勘测局'),
		array('id' => 36, 'value' => '甘肃水文', 'lable' => '甘肃省水文水资源局'),
		array('id' => 37, 'value' => '青海水文', 'lable' => '青海省水文水资源勘测局'),
		array('id' => 38, 'value' => '宁夏水文', 'lable' => '宁夏回族自治区水文水资源勘测局'),
		array('id' => 39, 'value' => '新疆水文', 'lable' => '新疆维吾尔自治区水文水资源局'),
		array('id' => 40, 'value' => '兵团水文', 'lable' => '新疆生产建设兵团水利局水文处'),
	),
	'STBK'	=> array(			// 测站岸别
		array('value' => '', 'lable' => '测站不在河流上', 'selected' => true),
		array('value' => 0, 'lable' => '位于河流的左岸'),
		array('value' => 1, 'lable' => '位于河流的右岸'),
	),
	'USFL'	=> array(			// 启用标志
		array('value' => 0, 'lable' => '停止该站报汛'),
		array('value' => 1, 'lable' => '启用该站报汛', 'selected' => true),
	),
	'IOMRK'	=> array(			// 库(湖)站关系表--入出库标志
		array('value' => '', 'lable' => '请选择入出库标志', 'selected' => true),
		array('value' => 'I', 'lable' => '测站的流量作为水库(湖)的入库流量'),
		array('value' => 'O', 'lable' => '测站的流量作为水库(湖)的出库流量'),
		array('value' => 'Z', 'lable' => '测站的水位用于计算湖泊的平均水位'),
	),
	'RLMRK'	=> array(			// 堰闸站关系表--关系标志
		array('value' => '', 'lable' => '请选择关系标志', 'selected' => true),
		array('value' => 'D', 'lable' => '测站为堰闸的闸下站'),
		array('value' => 'U', 'lable' => '测站为堰闸的闸上站'),
		array('value' => 'L', 'lable' => '测站与堰闸在同断面'),
	),
	'RSVRTP'	=> array(		// 水库类型
		array('value' => '', 'lable' => '请选择水库类型', 'selected' => true),
		array('value' => 1, 'lable' => '小(二)型(0.001~0.01亿立方米)'),
		array('value' => 2, 'lable' => '小(一)型(0.01~0.1亿立方米)'),
		array('value' => 3, 'lable' => '中型(0.1~1亿立方米)'),
		array('value' => 4, 'lable' => '大(二)型(1~10亿立方米)'),
		array('value' => 5, 'lable' => '大(一)型(10 以上亿立方米)'),
		array('value' => 9, 'lable' => '其它(0.001 以下亿立方米)'),
	),
	'FSTP'		=> array(		// 汛期类别
		array('value' => '', 'lable' => '请选择汛期类别', 'selected' => true),
		array('value' => 1, 'lable' => '主汛期'),
		array('value' => 2, 'lable' => '后汛期'),
		array('value' => 3, 'lable' => '过渡期'),
		array('value' => 4, 'lable' => '其它'),
	),
	'SLTP'		=> array(		// 土壤类别
		array('value' => 1, 'lable' => '沙土'),
		array('value' => 2, 'lable' => '壤土'),
		array('value' => 3, 'lable' => '粘土'),
		array('value' => 4, 'lable' => '壤砂土'),
		array('value' => 5, 'lable' => '砂壤土'),
		array('value' => 6, 'lable' => '粘壤土'),
		array('value' => 0, 'lable' => '其它'),
	),
	'SLTX'		=> array(		// 土壤质地
		array('value' => 11, 'lable' => '沙土-粗砂土'),
		array('value' => 12, 'lable' => '沙土-细砂土'),
		array('value' => 13, 'lable' => '沙土-细砂土'),
		array('value' => 21, 'lable' => '壤土-砂粉土'),
		array('value' => 22, 'lable' => '壤土-粉土'),
		array('value' => 23, 'lable' => '壤土-粉壤土'),
		array('value' => 24, 'lable' => '壤土-黏壤土'),
		array('value' => 25, 'lable' => '壤土-砂黏土'),
		array('value' => 31, 'lable' => '黏土-粉黏土'),
		array('value' => 32, 'lable' => '黏土-壤黏土'),
		array('value' => 33, 'lable' => '黏土-黏土'),
	),
	'VARTP'		=> array(		//洪水频率分析参数表--统计变量类别
		array('value' => '', 'lable' => '请选择统计变量类别', 'selected' => true),
		array('value' => 'Z', 'lable' => '水位'),
		array('value' => 'Q', 'lable' => '流量'),
		array('value' => 'W1', 'lable' => '最大1d洪量'),
		array('value' => 'W3', 'lable' => '最大3d洪量'),
		array('value' => 'W5', 'lable' => '最大5d洪量'),
		array('value' => 'W7', 'lable' => '最大7d洪量'),
		array('value' => 'W10', 'lable' => '最大10d洪量'),
		array('value' => 'W15', 'lable' => '最大15d洪量'),
		array('value' => 'W30', 'lable' => '最大30d洪量'),
		array('value' => 'W60', 'lable' => '最大60d洪量'),
	),
	'WTH'	=> array(5 => '雪', 6 => '雨夹雪', 7 => '雨', 8 => '阴', 9 => '晴'),		//天气状况
	'EPTP'	=> array(1 => 'E601B', 2 => 'Φ20', 3 => 'Φ80', 9 => '其它'),				//蒸发器类型
	'FLWCHRCD' => array(1 => '干涸', 2 => '断流', 3 => '流向不定', 4 => '逆流', 5 => '起涨', 6 => '洪峰', 'P' => '水电厂发电流量'),	// 河水特征
	'WPTN'	=> array(4 => '落', 5 => '涨', 6 => '平'),			// 水势代码
	'MSQMT' => array(1 => '水位流量关系曲线', 2 => '浮标及溶液测流法', 3 => '流速仪及量水建筑物', 4 => '估算法', 5 => 'ADCP', 6 => '电功率反推法', 9 => '其它方法'),	// 测流方法
	'MSAMT' => array(1 => '水位面积关系曲线', 2 => '测深杆或测深锤、铅鱼', 3 => '回声测深仪', 5 => 'ADCP', 9 => '其它方法'),	// 测积方法
	'MSVMT' => array(1 => '流速仪', 2 => '浮标法', 3 => '声学法', 5 => 'ADCP', 9 => '其它方法'),	// 测速方法
	'EQPTP'	=> array(	//闸门启闭--设备类别
		0 => '非常溢洪道',	1 => '正常溢洪道',	2 => '泄洪洞',	3 => '灌溉设备',	4 => '发电设备',
		5 => '供水设备',		6 => '排沙孔',		7 => '船闸',		8 => '调水',		9 => '其它设备',
	),
	'PDCHCD'	=> array(0 => '排水', 1=> '引水'),		// 泵站水情--引排特征代码
	'CRPTY'	=> array(1 => '小麦', 2 => '玉米', 3 => '棉花', 4 => '谷子', 5 => '大豆', 6 => '油菜', 7 => '烟草', 0 => '白地'),	// 土壤墒情--作物种类
	'CRPGRWPRD' => array(	// 土壤墒情--作物生长期
		1 => array(1 => '播种期', 2 => '播种期', 3 => '播种期', 4 => '播种期', 5 => '播种期', 6 => '播种期', 7 => '播种期'),
		2 => array(1 => '苗期', 2 => '苗期', 3 => '苗期', 4 => '苗期', 5 => '出苗期', 6 => '苗期', 7 => '苗期'),
		3 => array(1 => '返青期', 2 => '拔节期', 3 => '蕾期', 4 => '拔节期', 5 => '分枝期', 6 => '返青期', 7 => '团棵期'),
		4 => array(1 => '拔节期', 2 => '抽雄期', 3 => '花铃期', 4 => '抽穗期', 5 => '花荚期', 6 => '开花期', 7 => '现蕾期'),
		5 => array(1 => '孕穗 灌浆期', 2 => '灌浆期', 3 => '吐絮期', 4 => '灌浆期', 5 => '鼓粒期', 6 => '结荚期', 7 => '成熟期'),
		6 => array(1 => '成熟期', 2 => '成熟期', 3 => '', 4 => '成熟期', 5 => '成熟期', 6 => '', 7 => ''),
	),
	'HITRSN'	=> array(1 => '涝', 2=> '渍', 3 => '正常', 4 => '缺水', 5 => '萎蔫', 6 => '发黄', 7 => '枯死', 8 => '其它'),	// 土壤墒情--作物水分状态
	'SLMMMT'	=> array(1 => '烘干法', 2 => '张力计法', 3 => '中子水分仪法', 4 => '时域反射法', 5 => '频域法', 9 => '其它方法'),	// 土壤墒情--土壤含水量测法
	'GWBDRMK'	=> array('地面积水', '可疑', '井冻', '缺测', '插补', '加测', '日最高', '日最低', '日平均', '井干'),	// 地下水埋深注解
	'SPQMMT'	=> array('其它方法', '水表法', '堰槽法', '流速仪法', '水泵法', '定额法'),	// 泉涌水流量测法
	'STTDRCD'	=> array(1 => '一日', 2 => '三日', 3 => '一侯', 4 => '一旬', 5 => '一月', 6 => '一年'),		// 地下水开采量表--统计时段标志
	'PRDTP'	=> array(1 => '上旬', 2 => '中旬', 3 => '下旬', 4 => '全月'),		// 旬月降水量系列表--旬月标示
);