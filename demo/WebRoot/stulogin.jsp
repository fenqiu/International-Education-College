<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="排课,管理" />
<meta name="description" content="排课管理系统" />
<link rel="stylesheet" type="text/css" href="css/login.css" />
<link rel="shortcut icon" href="images/icon.ico"/>
<title>天津工业大学排课管理系统</title>
<script type="text/javascript" src="js/jquery/jquery-1.6.min.js"></script>

</head>

<body >
<div class="main">
 <div class="top">
   <div class="header hide"> </div>
   <div class="headtitle"><font size="6" face="华文新魏" color="#ffffff">天津工业大学排课管理系统 </font></div>
 </div>	
	<div class="content">
		<div class="title1 hide">学生登录</div>		
		<s:form name="form1" method="post" action="mains" id="form1" namespace="/">
			<fieldset>			  
				<div class="input">
					<input class="input_all name" name="student.stuid"  id="stuid" placeholder="学号" type="text" onFocus="this.className='input_all name_now';" onBlur="this.className='input_all name'" maxLength="24" />
				</div>
				<div class="input">
					<input class="input_all password" name="student.password" id="password" type="password" placeholder="密码" onFocus="this.className='input_all password_now';" onBlur="this.className='input_all password'" maxLength="24" />
				</div>
				<div class="checkbox">
					<input type="checkbox" name="remember" id="remember" /><label for="remember"><span>记住密码</span><span style="color: red; font-size: 10px;">${message }</span></label>
				</div>
				<div class="enter"><input class="button hide" name="submit" type="submit" value="登录" /></div>
			</fieldset>
		</s:form>
	</div>
</div>
<!-- <script type="text/javascript" src="js/placeholder.js"></script> -->			
</body>
</html>