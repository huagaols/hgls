<!-- update-start--Author:jg_renjie  Date:20160315 for：配合首页改造，引入portal引入portal组件 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<c:if test="${show == '1'}">
<t:base type="jquery,easyui"></t:base>
<script type="text/javascript" src="plug-in/easyui/portal/jquery.portal.js"></script>
<link rel="stylesheet" type="text/css" href="plug-in/easyui/portal/portal.css">
</c:if>
<!-- add-begin--Author:jg_renjie  Date:20150610 for：今天需要提醒的【系统信息】 -->	
<script type="text/javascript" src="plug-in/login/js/getMsgs.js"></script>
<!-- add-begin--Author:jg_renjie  Date:20150610 for：今天需要提醒的【系统信息】	 -->

<script type="text/javascript" src="plug-in/Highcharts-2.2.5/js/highcharts.src.js"></script>
<script type="text/javascript" src="plug-in/Highcharts-2.2.5/js/modules/exporting.src.js"></script>
</head>

<div id="main_portal" style="height:100%;">
<div></div>
<div></div>
</div>

<div style="display: none">
	<div id="p1" title="开运联合快速开发平台简介" collapsible="true">
		<div title="开运联合快速开发平台简介" collapsible="true" closable="flase" style="height:350px;" >
					<div style="margin-top: 14px;">
					<h3>简介</h3>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;北京开运联合信息技术股份有限公司（Creatunion）是一家专业的软件开发服务提供商。公司创立于2004年。总部在中国北京，同时建立上海、西安、宁波办事处联络机构。以软件技术为核心，通过软件与服务的结合，软件与行业的结合，技术与行业管理能力的结合，提供软件开发和行业解决方案以及相关软件产品、平台的开发与服务。 </p>
					<h3>涵盖的领域</h3>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;面向行业客户，我们提供高度个性化的行业解决方案，帮助客户实现信息化管理最佳实践，以满足客户需求。行业解决方案涵盖的领域包括：航天、军队、政府、铁路、大型企业、文物考古等领域在产品工程解决方案领域，开运联合（Creatunion）的开发理念是以“满足客户需求”为根本出发点，开发出“最恰到好处”的软件产品。</p>
					<h3>发展历程</h3>
					<ul>
						<li>2004年开运联合成立，专注软件开发领域.</li>
						<li>2005年开发服装行业软件.</li>
						<li>2006年服务专业领域，与北京市文物局、中国通号集团建立合作关系;</li>
						<li>2007年服务国家外交部视频传输项目;2007年6月申请“Sm@rtOA协同办公系统”软件著作权;2007年9月申请“EPaper电子报纸”软件著作权;</li>
						<li>2008年获得“亿康网健康管理系统”软件著作权;2008年3月进军健康领域，成立子公司"亿康网";2008年3月获得“软件企业认证”，并运营亿康网;</li>
						<li>2009年与北京信息中心建立合作，服务电子政务审批系统;</li>
						<li>2010年与航天测控合作，成为其软件外包外协单位之一;2010年3月与保利集团结为战略合作单位，成立上海办事处;</li>
						<li>2011年成立西安办事处;</li>
						<li>2012年3月9日开运联合与朗铭科技建立软件开发合作关系，正式登陆新三板（股票简称：朗铭科技︱股票代码：430107）;</li>
						<li>2012年5月开运联合与中国人寿签订项目开发合作协议;</li>
						<li>2012年12月公司与北京市科技条件平台军民融合中心签约仪式;</li>
						<li>2013年1月北京软件开发公司开运联合与金榜题名集团建立合作关系;</li>
						<li>2013年1月开运联合最新著作权认证资质;</li>
						<li>2013年3月北京开运联合软件公司与航天四院再次合作 ;</li>
						<li>2013年7月CreatEPM 工程项目管理系统成立 ;</li>
						<li>2013年12月北京开运联合软件开发公司与总装备部展开合作 ;</li>
						<li>2014年3月北京开运联合软件开发服务公司无线PDA点菜系统解决方案已经建成;</li>
						<li>2014年5月北京软件开发公司开运联合在线报表产品发布;</li>
						<li>2015年3月北京开运联合与一品糖签订合作项目 ;</li>
						<li>2015年4月北京开运联合与爱贷汇融洽谈合作;</li>
						<li>2015年5月北京开运联合承接了国际某禁核项目;</li>
						<li>2015年6月北京软件服务公司开运联合参与了国产航母跨软设施的研发工作</li>
					</ul>
					</div>
					<div style="margin-top: 20px;">
					<h3>IT信息化咨询服务   </h3>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;开运联合成立自2004年，8年来，我们一直致力于ＩＴ信息化的研究与建设，曾经为多个国家部委、地方政府、大型国企、和中小企业进行过细致的信息化战略建议，同时也参与其中部分的项目建设，开运联合以专业的IT经验与督导的技术见解得到了用户的认可，通过我们多年来的经验总结，我们再IT信息化咨询领域更擅长解决一下几种问题：</p>
					<ul>
						<li>IT战略规划IT治理</li>
						<li>评估IT实施监理甲方咨询</li>
						<li>服务外包人力资源外包IT外包</li>
						<li>IT信息化解决方案 </li>
						<li><a href="http://www.creatunion.com.cn" target="_blank" style="color: red"> 【 具体的业务工作，详细咨询请联系官方 】 </a></li>
					</ul>
					</div>
	</div>

	<div id="p2" title="系统提醒">
		<div class="easyui-layout" fit="true">
			  <div region="center" style="padding:0px;border:0px;">
			  <t:datagrid name="noticeList" title="common.notice" actionUrl="noticeController.do?datagrid" idField="id" fit="true" sortName="createTime" sortOrder="desc">
			   <t:dgCol title="编号" field="id" hidden="true"></t:dgCol>
			   <t:dgCol title="状态" field="isRead" width="40" replace="已读_1,未读_0"></t:dgCol>
			   <t:dgCol title="标题" field="noticeTitle" width="120"></t:dgCol>
			   <t:dgCol title="时间" field="createTime" formatter="YYYY-MM-dd" width="80"></t:dgCol>
			   <t:dgCol title="common.operation" field="opt" width="40"></t:dgCol>
			   <t:dgFunOpt funname="doRead(id,isRead)" title="common.read"></t:dgFunOpt>
			  </t:datagrid>
			  </div>
		</div>
	</div>

	<div id="p3">
	</div>
	<div id="p4">
	</div>
</div>
<script type="text/javascript">
$("#main_portal").css("height","100%");
<!--
var mainPortal;
$(function() {
	mainPanels =new Array();
	//if($("#p1").length==1){
		mainPanels.push({
			id : 'p1',
			title : '北京开运联合快速开发平台简介',
			height : 300,
			collapsible : true
		});
	//};
	//if($("#p2").length==1){
		mainPanels.push({
			id : 'p2',
			title : '系统提醒',
			height : 300,
			collapsible : true,
			tools:[{
			       iconCls:'icon-search',
			       handler:function(){
			         //MUI.openCenterTab('部门公告','affiche/dept/load/my.do?rel=gtpt_bmgg','gtpt_bmgg',false,true)
			       }
			    }
			  ]
		});
	//};
	
	//if($("#p3").length==1){
		mainPanels.push({
			id : 'p3',
			title : '用户分析',
			height : 290,
			collapsible : true,
			//href: 'logController.do?userBroswer&reportType=line',
			tools:[{
			       iconCls:'icon-search',
			       handler:function(){
			         //MUI.openCenterTab('我的会议','meeting/loadtome.do?rel=ggpt_hygl','ggpt_hygl',false,true)
			       }
			    }
			  ]
		});
	//};
	//if($("#p4").length==1){
		mainPanels.push({
			id : 'p4',
			title : '系统信息',
			height : 290,
			collapsible : true,
			//href: 'tSSmsController.do?getSysInfos',
			tools:[{
			       iconCls:'icon-search',
			       handler:function(){
			        // MUI.openCenterTab('新闻','news/load_news.do?rel=grbg_xw','grbg_xw',false,true)
			       }
			    }
			  ]
		});
	//};
	
	mainPortal = $('#main_portal').portal({
		border : false,
		fit : true,
		onStateChange : function() {
			$.cookie('portal-state', getPortalState(),{expires:7});
		}
	});
	var state = $.cookie('portal-state');
	if (!state) {
		state = 'p1,p3,:p2,p4';/*冒号代表列，逗号代表行*/
	}
	addPortalPanels(state);
	mainPortal.portal('resize');
	
 	$.post(
		'logController.do?userBroswer&reportType=line',
		function(data){
			$("#p3").html(data);
		}		
	);
	
	$.post(
		'tSSmsController.do?getSysInfos',
		function(data){
			var show = '${show}',html='';
			if(show == '0'){
				var REG_BODY = /<body[^>]*>([\s\S]*)<\/body>/,content='';
				var result = REG_BODY.exec(data);
				if(result && result.length === 2){
					content = result[1];
				}
				html = content;
			} else {
				html = data;
			}
			$("#p4").html(html);
			
		}		
	);
	
	
});

function getPanelOptions(id) {
	for ( var i = 0; i < mainPanels.length; i++) {
		if (mainPanels[i].id == id) {
			return mainPanels[i];
		}
	}
	return undefined;
}
function getPortalState() {
	var aa = [];
	for ( var columnIndex = 0; columnIndex < 2; columnIndex++) {
		var cc = [];
		var panels = mainPortal.portal('getPanels', columnIndex);
		for ( var i = 0; i < panels.length; i++) {
			cc.push(panels[i].attr('id'));
		}
		aa.push(cc.join(','));
	}
	return aa.join(':');
}
function addPortalPanels(portalState) {

	var columns = portalState.split(':');
	for ( var columnIndex = 0; columnIndex < columns.length; columnIndex++) {
		var cc = columns[columnIndex].split(',');
		for ( var j = 0; j < cc.length; j++) {
			var options = getPanelOptions(cc[j]);
			if (options) {
				var p=$("#"+options.id);
				 if(p.length>0){
					p.panel(options);
					mainPortal.portal('add', {
						panel : p,
						columnIndex : columnIndex
					});
				} 
			}
		}
	}
}
//-->
</script>
<!-- update-end--Author:jg_renjie  Date:20160315 for：配合首页改造，引入portal组件 -->