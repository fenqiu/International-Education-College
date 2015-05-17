<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>系统消息</title>
<script src="<%=basePath%>easyui/jquery-1.6.min.js"
			type="text/javascript"></script>
<style type="text/css">
.regis{
	height: 220px;
	width: 390px;
	background-color: #FFF;
	border: #999 1px solid;
	box-shadow: 10px 10px 5px #888888;
	margin-top:100px;
}
.TAN_cb {
width: 263px;
height: 30px;
display: block;
background: url(<%=basePath%>images/11.png) 0 -30px no-repeat;
color: #fff;
font-size: 20px;
text-align: center;
padding-top: 12px;
margin: 10px 0 0 0;
text-decoration:none;
cursor:pointer;

}
.z{
	margin-top:45px;
	}
</style>

</head>

<body>

<script type="text/javascript">
function validate(){
	window.location.href="<%=basePath%>index.jsp";
	}
	
</script>

<div>
<center><div class="regis">
  <div style="margin-top:0px width:100%; height:40px;border-bottom: 1px solid #DADADA;">
<center><p style="font-size: 30px">系统消息</p></center></div>
       
    <center>
    <div class="z" name="login">
    <div align="center" style="font-size: 25px;color: red"><s:property value="#message" /></div>
    </div>
    <div>
  <div id="loginButton" class="TAN_cb" onclick="validate()" style="margin-top:20px">我知道了</div>
    </div>
    </center>
</div>
</center>

</div>
</body>
</html>