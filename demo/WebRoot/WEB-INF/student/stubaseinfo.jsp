<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>天津工业大学排课管理系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
#container{
 padding: 10px 100px;
}
table td{ 
 text-align: center;
}
</style>
  </head>
 
  <body>
  <h2 align="center" style="font-family: 微软雅黑" >基本信息</h2>
    <div id="container">     
      <div style="color: red">${message }</div>     
         <table border="1" cellspacing="0" width="800px" align="center">
        <tr>
            <td  rowspan="2" width="80px" height="100px">照片</td><td>First Name：</td><td>${student.enname }</td><td>Family ：</td><td>${student.ensuiname }</td>
        </tr>
        <tr>
            <td>中文名：</td><td>${student.stuname }</td><td>性别：</td><td>${student.sex }</td>
        </tr>
        <tr>
            <td>来自：</td><td>${student.nation }</td><td>护照编号：</td><td>${student.passport }</td>
        </tr>
         <tr>
            <td>联系方式：</td><td>${student.telephone }</td><td>现住地址：</td><td>${student.roomplace }</td>
        </tr>
        <tr>
            <td>班级：</td><td>${student.classes.classname }</td><td>专业：</td><td>${student.classes.major }</td>
        </tr>
        <tr>
            <td>学院：</td><td></td><td>入学时间：</td><td></td>
        </tr>
      </table>           
      
    </div>
  </body>
</html>
