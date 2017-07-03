<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html >
<html>
<head>
<title>开运联合办公管理系统</title>
<t:base type="jquery,easyui,tools,DatePicker,autocomplete"></t:base>
<!-- add-start--Author:jg_renjie  Date:20160315 for：配合首页改造，引入portal依赖的js及css文件 -->
<script type="text/javascript" src="plug-in/easyui/portal/jquery.portal.js"></script>
<link rel="stylesheet" type="text/css" href="plug-in/easyui/portal/portal.css">
<!-- add-end--Author:jg_renjie  Date:20160315 for：配合首页改造，引入portal依赖的js及css文件 -->
<link rel="shortcut icon" href="images/favicon.ico">
<style type="text/css">
a {
	color: Black;
	text-decoration: none;
}

a:hover {
	color: black;
	text-decoration: none;
}
/*update-start--Author:zhangguoming  Date:20140622 for：左侧树调整：加大宽度、更换节点图标、修改选中颜色*/
.tree-node-selected{
    background: #eaf2ff;
}
/*update-end--Author:zhangguoming  Date:20140622 for：左侧树调整：加大宽度、更换节点图标、修改选中颜色*/
</style>
<SCRIPT type="text/javascript">

	$(function() {
		$('#layout_jeecg_onlineDatagrid').datagrid({
			url : 'systemController.do?datagridOnline&field=ip,logindatetime,user.userName,',
			title : '',
			iconCls : '',
			fit : true,
			fitColumns : true,
			pagination : true,
			pageSize : 10,
			pageList : [ 10 ],
			nowarp : false,
			border : false,
			idField : 'id',
			sortName : 'logindatetime',
			sortOrder : 'desc',
			frozenColumns : [ [ {
				title : '<t:mutiLang langKey="common.code"/>',
				field : 'id',
				width : 150,
				hidden : true
			} ] ],
			columns : [ [ {
				title : '<t:mutiLang langKey="common.login.name"/>',
				field : 'user.userName',
				width : 130,
				align : 'center',
				sortable : true,
				formatter : function(value, rowData, rowIndex) {
					return formatString('<span title="{0}">{1}</span>', value, value);
				}
			}, {
				title : 'IP',
				field : 'ip',
				width : 150,
				align : 'center',
				sortable : true,
				formatter : function(value, rowData, rowIndex) {
					return formatString('<span title="{0}">{1}</span>', value, value);
				}
			}, {
				title : '<t:mutiLang langKey="common.login.time"/>',
				field : 'logindatetime',
				width : 150,
				sortable : true,
				formatter : function(value, rowData, rowIndex) {
					return formatString('<span title="{0}">{1}</span>', value, value);
				},
				hidden : true
			} ] ],
			onClickRow : function(rowIndex, rowData) {
			},
			onLoadSuccess : function(data) {
				$('#layout_jeecg_onlinePanel').panel('setTitle', '( ' + data.total + ' )' + ' <t:mutiLang langKey="lang.user.online"/>');
			}
		}).datagrid('getPager').pagination({
			showPageList : false,
			showRefresh : false,
			beforePageText : '',
			afterPageText : '/{pages}',
			displayMsg : ''
		});		
		
		$('#layout_jeecg_onlinePanel').panel({
			tools : [ {
				iconCls : 'icon-reload',
				handler : function() {
					$('#layout_jeecg_onlineDatagrid').datagrid('load', {});
				}
			} ]
		});
		
		$('#layout_east_calendar').calendar({
			fit : true,
			current : new Date(),
			border : false,
			onSelect : function(date) {
				$(this).calendar('moveTo', new Date());
			}
		});
		$(".layout-expand").click(function(){
			$('#layout_east_calendar').css("width","auto");
			$('#layout_east_calendar').parent().css("width","auto");
			$("#layout_jeecg_onlinePanel").find(".datagrid-view").css("max-height","200px");
			$("#layout_jeecg_onlinePanel .datagrid-view .datagrid-view2 .datagrid-body").css("max-height","180px").css("overflow-y","auto");
		});
	});
	var onlineInterval;
	
	function easyPanelCollapase(){
		window.clearTimeout(onlineInterval);
	}
	function easyPanelExpand(){
		onlineInterval = window.setInterval(function() {
			$('#layout_jeecg_onlineDatagrid').datagrid('load', {});
		}, 1000 * 20);
	}

    function panelCollapase(){
        $(".easyui-layout").layout('collapse','north');
    }
	
	$(document).ready(function(){
		var url = "noticeController.do?getNoticeList";
		var roll = false;
		$.ajax({
    		url:url,
    		type:"GET",
    		dataType:"JSON",
    		async: false,
    		success:function(data){
    			if(data.success){
    				var noticeList = data.attributes.noticeList;
    				var noticehtml = "";
    				if(noticeList.length > 0){
    					noticehtml = noticehtml + "<marquee behavior='scroll'><a href='javascript:goNotice(1);'>";
        				for(var i=0;i<noticeList.length;i++){
        					noticehtml = noticehtml + noticeList[i].noticeTitle + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
        				}
        				noticehtml = noticehtml + "</a></marquee>";
        				$("#notice").html(noticehtml);
    					roll = true;
    					$("#noticeTitle").show();
    					$("#notice").show();
    				}else{
    					$("#noticeTitle").hide();
    					$("#notice").hide();
    				}
    			}
    		}
    	});
	});
    
    function goNotice(id){
    	var addurl = "noticeController.do?noticeList";
  		createdetailwindow("通知公告", addurl, 800, 400);
    }
</SCRIPT>
</head>
<body class="easyui-layout" style="overflow-y: hidden" scroll="no">
<!-- 顶部-->
<div region="north" border="false" title="" style="BACKGROUND: #A8D7E9; height: 100px; padding: 1px; overflow: hidden;">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr>
    <td align="left" style="vertical-align: text-bottom">
    <img src="plug-in/login/images/creatunion1.png">
    <!--
        <img src="plug-in/login/images/toplogo.png" width="550" height="52" alt="">-->
        <div style="position: absolute; top: 75px; left: 33px;">开运联合办公管理系统<span style="letter-spacing: -1px;"> <%-- <t:mutiLang langKey="system.version.number"/> --%></span></div>
    </td>
    <td align="right" nowrap>
        <table border="0" cellpadding="0" cellspacing="0">
            <tr style="height: 25px;" align="right">
                <td style="" colspan="2">
                    <div style="background: url(plug-in/login/images/top_bg.jpg) no-repeat right center; float: right;">
                    <div style="float: left; line-height: 25px; margin-left: 70px;">
                    	<div style="float: left; line-height: 25px; margin-left: 70px;">
							<div id="noticeTitle" style="display:none;float:left;text-align:center;color: rgb(255, 255, 255);width: 40px; background: rgb(90, 166, 40);">公告</div>
							<div id="notice" style="display:none;float:left;width: 240px; background: rgb(0, 160, 160);margin-right: 20px; height: 25px;">	
						</div>
                        <span style="color: #386780"><img src="${webRoot}/plug-in/login/images/user.png"></span> 
                        <span style="color: #FFFFFF">${userName }</span>&nbsp;&nbsp;&nbsp;&nbsp;
                        <span style="color: #386780"><t:mutiLang langKey="current.org"/>:</span>
                        <span style="color: #FFFFFF">${currentOrgName }</span>&nbsp;&nbsp;&nbsp;&nbsp;
                        <span style="color: #386780"><t:mutiLang langKey="common.role"/>:</span>
                        <span style="color: #FFFFFF">${roleName }</span>
                    </div>
                    <div style="float: left; margin-left: 18px;">
                        <div style="right: 0px; bottom: 0px;">
                            <a href="javascript:void(0);" class="easyui-menubutton" menu="#layout_north_kzmbMenu" iconCls="icon-comturn" style="color: #FFFFFF">
                                <t:mutiLang langKey="common.control.panel"/>
                            </a>&nbsp;&nbsp;
                            <a href="javascript:void(0);" class="easyui-menubutton" menu="#layout_north_zxMenu" iconCls="icon-exit" style="color: #FFFFFF">
                                <t:mutiLang langKey="common.logout"/>
                            </a>
                        </div>
                        <div id="layout_north_kzmbMenu" style="width: 100px; display: none;">
                            <div onclick="openwindow('<t:mutiLang langKey="common.profile"/>','userController.do?userinfo')">
                                <t:mutiLang langKey="common.profile"/>
                            </div>
                            <div class="menu-sep"></div>
                            <div onclick="add('<t:mutiLang langKey="common.change.password"/>','userController.do?changepassword','',550,200)">
                                <t:mutiLang langKey="common.change.password"/>
                            </div>
                            <div class="menu-sep"></div>
                            <div onclick="openwindow('<t:mutiLang langKey="common.ssms.getSysInfos"/>','tSSmsController.do?getSysInfos')">
                                <t:mutiLang langKey="common.ssms.getSysInfos"/>
                            </div>
                            <div class="menu-sep"></div>
                            <div onclick="add('<t:mutiLang langKey="common.change.style"/>','userController.do?changestyle','',550,200)">
                                <t:mutiLang langKey="common.change.style"/>
                            </div>
                             <div onclick="clearLocalstorage()">
                       		 	<t:mutiLang langKey="common.clear.localstorage"/>
                   			 </div>
                        </div>
                        <div id="layout_north_zxMenu" style="width: 100px; display: none;">
                            <div onclick="exit('loginController.do?logout','<t:mutiLang langKey="common.exit.confirm"/>',1);">
                                <t:mutiLang langKey="common.exit"/>
                            </div>
                        </div>
                    </div>
                    <%--update-begin--Author:JueYue  Date:20140616 for：首页上方可以折叠--%>
                    <div style="float: left; margin-left: 8px;margin-right: 5px; margin-top: 5px;">
                        <img src="plug-in/easyui/themes/default/images/layout_button_up.gif"
                             style="cursor:pointer" onclick="panelCollapase()" />
                    </div>
                    <%--update-end--Author:JueYue  Date:20140616 for：首页上方可以折叠--%>
                    </div>
                </td>
            </tr>
            <tr style="height: 80px;">
                <td colspan="2">
                    <ul class="shortcut">
                        <!-- 动态生成并赋值过来 -->
                    </ul>
                </td>
            </tr>
        </table>
    </td>
</tr>
</table>
</div>
<!-- 左侧-->
<div region="west" split="true" href="loginController.do?shortcut_top" title="<t:mutiLang langKey="common.navegation"/>" style="width: 200px; padding: 1px;"></div>
<!-- 中间-->
<div id="mainPanle" region="center" style="overflow: hidden;">
    <div id="maintabs" class="easyui-tabs" fit="true" border="false">
        <div class="easyui-tab" title="<t:mutiLang langKey="common.dash_board"/>" href="loginController.do?home" style="padding: 2px;"></div>
        <c:if test="${map=='1'}">
            <div class="easyui-tab" title="<t:mutiLang langKey="common.map"/>" style="padding: 1px; overflow: hidden;">
                <iframe name="myMap" id="myMap" scrolling="no" frameborder="0" src="mapController.do?map" style="width: 100%; height: 99.5%;"></iframe>
            </div>
        </c:if>
    </div>
</div>
<!-- 右侧 -->
<div collapsed="true" region="east" iconCls="icon-reload" title="<t:mutiLang langKey="common.assist.tools"/>" split="true" style="width: 190px;"
	data-options="onCollapse:function(){easyPanelCollapase()},onExpand:function(){easyPanelExpand()}">
	<!--
    <div id="tabs" class="easyui-tabs" border="false" style="height: 240px">
        <div title='<t:mutiLang langKey="common.calendar"/>' style="padding: 0px; overflow: hidden; color: red;">
            <div id="layout_east_calendar"></div>
        </div>
    </div>
    <div id="layout_jeecg_onlinePanel" data-options="fit:true,border:false" title=<t:mutiLang langKey="common.online.user"/>>
        <table id="layout_jeecg_onlineDatagrid"></table>
    </div>
    -->
    <div class="easyui-layout" fit="true" border="false">
		<div region="north" border="false" style="height:180px;overflow: hidden;">
			<div id="tabs" class="easyui-tabs" border="false" style="height: 240px">
				<div title='<t:mutiLang langKey="common.calendar"/>' style="padding: 0px; overflow: hidden; color: red;">
					<div id="layout_east_calendar"></div>
				</div>
			</div>
		</div>
		<div region="center" border="false" style="overflow: hidden;">
			<div id="layout_jeecg_onlinePanel" fit="true" border="false" title='<t:mutiLang langKey="common.online.user"/>'>
				<table id="layout_jeecg_onlineDatagrid"></table>
			</div>
		</div>
	</div>
</div>
<!-- 底部 -->
<div region="south" border="false" style="height: 25px; overflow: hidden;">
    <div align="center" style="color: #1fa3e5; padding-top: 2px">&copy;
       <%--  <t:mutiLang langKey="common.copyright"/> --%>
      	 版权所有:
        <span class="tip">
            <a href="http://http://www.creatunion.com.cn" title="Creatunion Framework <t:mutiLang langKey="system.version.number"/>">北京开运联合股份有限公司 <%--  <t:mutiLang langKey="system.version.number"/> --%></a>
            (推荐谷歌浏览器，获得更快响应速度) 技术支持:
            <a href="#" title="Creatunion Framework  <!-- <t:mutiLang langKey="system.version.number"/> -->">北京开运联合股份有限公司 <%--  <t:mutiLang langKey="system.version.number"/> --%></a>
        </span>
    </div>
</div>

<div id="mm" class="easyui-menu" style="width: 150px;">
    <div id="mm-tabupdate"><t:mutiLang langKey="common.refresh"/></div>
    <div id="mm-tabclose"><t:mutiLang langKey="common.close"/></div>
    <div id="mm-tabcloseall"><t:mutiLang langKey="common.close.all"/></div>
    <div id="mm-tabcloseother"><t:mutiLang langKey="common.close.all.but.this"/></div>
    <div class="menu-sep"></div>
    <div id="mm-tabcloseright"><t:mutiLang langKey="common.close.all.right"/></div>
    <div id="mm-tabcloseleft"><t:mutiLang langKey="common.close.all.left"/></div>
</div>
<script type="text/javascript">

</script>
</body>
</html>