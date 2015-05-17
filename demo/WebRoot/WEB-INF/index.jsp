<%-- <%@page import="org.springframework.web.context.request.SessionScope"%>--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>天津工业大学排课管理系统</title>
<link href="<%=basePath %>js/ligerUI/skins/Aqua/css/ligerui-all.css"rel="stylesheet" type="text/css" />
<link href="<%=basePath %>js/ligerUI/skins/Gray/css/all.css"rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="<%=basePath %>css/menu-css.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>css/style.css"> 
<link rel="shortcut icon" href="<%=basePath %>images/icon.ico"/>
<script src="<%=basePath %>js/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>
<script src="<%=basePath %>js/ligerUI/ligerui.all.js" type="text/javascript"></script>
<!-- <script type="text/javascript" src="js/menu_min.js"></script> -->
<script type="text/javascript">
	var tab = null;
	var accordion = null;
	var tree = null;
	$(function(){
		//布局
		$("#layout1").ligerLayout({
			leftWidth : 230,
			isRightCollapse : true,
			height : '100%',
			heightDiff : -34,
			allowLeftCollapse:true,
			space : 4,
			onHeightChanged : f_heightChanged
		});
		var height = $(".l-layout-center").height();
		//Tab
		$("#framecenter").ligerTab({
			height : height
		});
		//面板
		$("#accordion1").ligerAccordion({
			height : height - 24,
			speed : 200
		});
		$(".l-link").hover(function(){
			$(this).addClass("l-link-over");
		}, function(){
			$(this).removeClass("l-link-over");
		});
		tab = $("#framecenter").ligerGetTabManager();
		accordion = $("#accordion1").ligerGetAccordionManager();
		tree = $("#tree1").ligerGetTreeManager();
		$("#pageloading").hide();
	});
	function f_heightChanged(options){
		if (tab)
			tab.addHeight(options.diff);
		if (accordion && options.middleHeight - 24 > 0)
			accordion.setHeight(options.middleHeight - 24);
	}
	 function f_addTab(tabid,text, url)
            { 
                tab.addTabItem({ tabid : tabid,text: text, url: url });
            } 
      
      var m;
	 function changepwd(){	
	 var roleid =${sessionScope.user.roles.id};
	 if(roleid==4){
	    var str = "${pageContext.request.contextPath}/system/Stu_changepwd.action?stu.id="+${sessionScope.user.id};
		m=$.ligerDialog.open({
			url : str,
			height : 300,
			width : 350,
			title:'修改密码',
			isDrag:true,
			showMax:true,
			showToggle:true,
			slide: false,			
			modal:false,
			left:500,
			allowClose:true,
		    isResize : false,
		});		
	 }else{
	    var str = "${pageContext.request.contextPath}/system/User_changepwd.action?user.id="+${sessionScope.user.id};
		m=$.ligerDialog.open({
			url : str,
			height : 300,
			width : 350,
			title:'修改密码',
			isDrag:true,
			showMax:true,
			showToggle:true,
			slide: false,			
			modal:false,
			left:500,
			allowClose:true,
		    isResize : false,
		});		
	 }
	
	} 
</script>

</head>
<body>
<!-- 顶部 -->
<div class="l-page-top">
    <div class="l-page-title"><font size="5" color="white" face="方正舒体"style="margin-top: 5px;">天津工业大学国际教育学院学生教师课务系统</font></div>
    <div class="userinfo">
    <a class="l-page-link2"  >
    <strong>${sessionScope.user.realname }</strong>&nbsp;(${sessionScope.user.roles.roledescribe })  
    </a>
        <span class="space">|</span>
        <!-- <a class="l-link2" onclick="deleteCache();" style="cursor: pointer;">清除缓存</a><span class="space">|</span> -->
        <a class="l-page-link2" onclick="changepwd()" style="cursor: pointer;">修改密码</a><span class="space">|</span>
        <a href="loginout" class="l-page-link2" target="_self">退出</a>
    </div>
</div>
<!-- 左侧导航 -->
	<div id="layout1" style="width:98%; margin:0 15px auto; margin-top:4px; "> 
		<div position="left" title="导航栏"  id="accordion1" > <!-- title="导航栏" -->
		<!-- class="menu" -->
	 <div title="学生管理">
                <a class="l-link" href="javascript:f_addTab('stubaseinfo','基本信息','system/Stu_stubaseinfo.action')">基本信息</a>
                <a class="l-link" href="javascript:f_addTab('stumanage','学生管理','system/Stu_stumanage.action')">学生管理</a>
                <a class="l-link" href="javascript:f_addTab('schoolroll','学生管理','system/Stu_schoolroll.action')">学籍管理</a>
                <a class="l-link" href="javascript:f_addTab('classmanage','班级管理','system/Class_classmanage.action')">班级管理</a>
                <a class="l-link" href="javascript:f_addTab('coursemanage','课程管理','system/Class_coursemanage.action')">课程管理</a>    
      </div>
      <div title="课程管理">
                <a class="l-link" href="javascript:f_addTab('teachtask','教学任务','system/teacher_teachtask.action')">教学任务</a>
                <a class="l-link" href="javascript:f_addTab('intelarranging','智能排课','system/teacher_intelarranging.action')">智能排课</a>
                <a class="l-link" href="javascript:f_addTab('courselist','课程库','system/teacher_courselist.action')">课程库</a>
                <a class="l-link" href="javascript:f_addTab('adjustschedule','调课申请审核','system/teacher_adjustschedule.action')">调课申请审核</a>
                <a class="l-link" href="javascript:f_addTab('ptplan','个人培养计划','system/teacher_ptplan.action')">个人培养计划</a>
                <a class="l-link" href="javascript:f_addTab('schedulesearch','课表查询','system/teacher_schedulesearch.action')">课表查询</a>
                <a class="l-link" href="javascript:f_addTab('selectcourse','选课','system/teacher_selectcoutse.action')">选课</a>
                
      </div> 
      <div title="教室管理">
                <a class="l-link" href="javascript:f_addTab('clsroommanage','教室管理','system/Class_clsroommanage.action')">教室管理</a>
                <a class="l-link" href="javascript:f_addTab('clsroomload','教室查询','system/Class_clsroomload.action')">教室查询</a>
      </div>
      
      <div title="教师管理">
                <a class="l-link" href="javascript:f_addTab('teachermanage','教师列表','system/teacher_teachermanage.action')">教师列表</a>
                <a class="l-link" href="javascript:f_addTab('evalutionmanage','评教系统','system/teacher_evalutionmanage.action')">评教系统</a>
                
      </div>
      <div title="成绩管理">
                <a class="l-link" href="javascript:f_addTab('scoremanage','成绩管理','system/teacher_scoremanage.action')">成绩管理</a>
                
      </div>
      <div title="奖学金管理">
                <a class="l-link" href="javascript:f_addTab('attendancemanage','奖学金管理','system/teacher_attendancemanag.action')">奖学金管理</a>               
      </div>   
      <div title="考勤管理">
                <a class="l-link" href="javascript:f_addTab('scholarmanage','考勤管理','system/teacher_scholarmanage.action')">考勤管理</a>
                
      </div>
      <div title="毕业/结业证管理">
                <a class="l-link" href="javascript:f_addTab('scholarmanage','毕业/结业证管理管理','system/teacher_scholarmanage.action')">毕业/结业证管理</a>
                
      </div>
      <div title="活动管理">
                <a class="l-link" href="javascript:f_addTab('scholarmanage','活动管理','system/teacher_scholarmanage.action')">活动管理</a>                
      </div>
      <div title="宿舍管理">
                <a class="l-link" href="javascript:f_addTab('scholarmanage','宿舍管理','system/teacher_scholarmanage.action')">宿舍管理</a>                
      </div>
      <div title="综合流程审批管理">
                <a class="l-link" href="javascript:f_addTab('scholarmanage','综合流程审批管理','system/teacher_scholarmanage.action')">综合流程审批管理</a>                
      </div>
      <div title="系统管理">
                <a class="l-link" href="javascript:f_addTab('usermanage','用户列表','system/User_usermanage.action')">用户列表</a>
                <a class="l-link" href="javascript:f_addTab('userpermissions','用户权限','system/User_userpermissions.action')">用户权限</a>
      </div>
         
		</div>
<!--中间内容显示  -->
		 <div position="center" id="framecenter"> 
			<div tabid="home" title="主页" style="height:300px" >
                <iframe frameborder="0" name="home" id="home" src="hello.jsp"></iframe>
            </div> 
		</div>				
		</div>	
		<div id="footer"align="center">版权所有© 天津工业大学计算机科学与软件学院<br>Copyright jsj.tjpu.edu.cn</div>	
</body>
</html>
