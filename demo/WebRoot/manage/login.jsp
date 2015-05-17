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
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/login.css" />
<link rel="shortcut icon" href="images/icon.ico"/>
<title>天津工业大学排课管理系统</title>
</head>

<body >
<div class="main">
 <div class="top">
   <div class="header hide"> </div>
   <div class="headtitle"><font size="6" face="华文新魏" color="#ffffff">天津工业大学排课管理系统 </font></div>
 </div>	
	<div class="content">
		<div class="title hide">管理登录</div>
		
		<s:form action="main" method="post" id="loginForm" namespace="/">
			<fieldset>
			   <div class="input" >
					<!-- <input class="input_all name" name="user.role"  id="name" placeholder="用户类型" type="text" onFocus="this.className='input_all name_now';" onBlur="this.className='input_all name'" maxLength="24" /> -->
					<div class="input_all name">
					<select  name="user.roles.id"style="height:41px;width:190px;margin-top:-5px;border: 1.1em;">  
                              <option selected="selected" value="1">超级管理员</option> 
                              <option value="2">管理员</option> 
                              <option value="3">任课教师</option> 
                              <option value="4">学生</option>        
                    </select>
                    </div>
				</div>
				<div class="input">
					<input class="input_all name" name="user.username"  id="name" placeholder="用户名" type="text" onFocus="this.className='input_all name_now';" onBlur="this.className='input_all name'" maxLength="24" />
				</div>
				<div class="input">
					<input class="input_all password" name="user.password" id="password" type="password" placeholder="密码" onFocus="this.className='input_all password_now';" onBlur="this.className='input_all password'" maxLength="24" />
				</div>
				<div class="checkbox">
					<input type="checkbox" name="remember" id="remember" /><label for="remember"><span>记住密码</span><span style="color: red; font-size: 10px;">${message }</span></label>
				</div>
				<div class="enter"><input class="button hide" name="submit" type="submit" value="登录" /></div>
				<!-- <s:token></s:token> -->
			</fieldset>
		</s:form>
	</div>
</div>
<!-- <script type="text/javascript" src="js/placeholder.js"></script> -->			
</body>
</html>