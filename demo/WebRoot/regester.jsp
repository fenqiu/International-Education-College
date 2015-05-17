<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	<meta http-equiv="description" content="天津工业大学排课管理系统">
	<link rel="shortcut icon" href="images/icon.ico"/>
    <link rel="stylesheet" type="text/css" href="css/login.css" />
    <script type="text/javascript" src="js/jquery.validate.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="js/jquery.metadata.js" charset="utf-8"></script>
    <script type="text/javascript" src="js/messages_cn.js" charset="utf-8"></script>
    <script src="<%=basePath%>js/jquery-1.6.min.js"type="text/javascript"></script>
	<script src="<%=basePath%>js/base.js" type="text/javascript"></script>
	<script src="<%=basePath%>js/lib/ligerUI/js/plugins/ligerForm.js" type="text/javascript"></script>
	<script src="<%=basePath%>js/lib/ligerUI/js/plugins/ligerDateEditor.js"type="text/javascript"></script>
	<script src="<%=basePath%>js/lib/ligerUI/js/plugins/ligerComboBox.js" type="text/javascript"></script>
	<script src="<%=basePath%>js/lib/ligerUI/js/plugins/ligerSpinner.js" type="text/javascript"></script>
	<script src="<%=basePath%>js/lib/ligerUI/js/plugins/ligerTextBox.js" type="text/javascript"></script>
	<script src="<%=basePath%>js/lib/ligerUI/js/plugins/ligerRadio.js" type="text/javascript"></script>
	<script src="<%=basePath%>js/lib/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
	<script src="<%=basePath%>js/lib/ligerUI/js/plugins/ligerDrag.js" type="text/javascript"></script>
	<script src="<%=basePath%>js/lib/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script>
	<script src="<%=basePath %>js/lib/ligerUI/js/plugins/ligerCheckBox.js" type="text/javascript"></script>
	<script src="<%=basePath %>js/lib/ligerUI/js/plugins/ligerResizable.js" type="text/javascript"></script>
  </head>
<script type="text/javascript">
$(function() {
		$.metadata.setType("attr", "validate");
		var v = $("form").validate({
			debug : true,
			errorPlacement : function(lable, element) {
				if (element.hasClass("l-textarea")) {
					element.ligerTip({
						content : lable.html(),
						target : element[0]
					});
				} else if (element.hasClass("l-text-field")) {
					element.parent().ligerTip({
						content : lable.html(),
						target : element[0]
					});
				} else {
					lable.appendTo(element.parents("td:first").next("td"));
				}
			},
			success : function(lable) {
				lable.ligerHideTip();
				lable.remove();
			},
			submitHandler : function() {
				$("form .l-text,.l-textarea").ligerHideTip();
			}
		});
		$("form").ligerForm();
		$(".l-button-test").click(function() {
			alert(v.element($("#txtName")));
		});

	});
	var flag=false;
	function check() { 	       
		$.post("${pageContext.request.contextPath}/system/User_usercheck.action?user.username="
						+ $("#username").val(), null, function(data) {
					if (data == "fail") {
						$("#result").html("该用户名已经存在，请修改!");
						$("#result").show();
						flag=false;
						}
						else{
						$("#result").hide();
						flag=true;
						}
					});
	}
	
	function checkpwd(){
		var str1 = document.getElementById("password").value;
		var str2 = document.getElementById("password1").value;
		if (str1 == str2) {
			if (str1.length >= 6) {
				$("#result1").hide();
			} else {
				$("#result1").html("密码长度不足六位，请重新输入！");
				$("#result1").show();
			}
		} else {
			$("#result1").html("两次输入密码不一致，请重新输入！");
			$("#result1").show();
		}
	}
	function checkemail(){
		var email = document.getElementById("email").value;
		var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
        ismail= reg.test(email);
        if (!ismail ) {
          $("#result2").html("邮箱格式不正确，请重新输入！");
		  $("#result2").show();
        }else{
          $("#result2").hide();
        }
	}
	function regester(){
	$.post("${pageContext.request.contextPath}/system/User_useradd.action?user.username="+ encodeURI(encodeURI($("#username").val()))
		+"&user.password="+ encodeURI(encodeURI($("#password").val()))
		+"&user.realname="+ encodeURI(encodeURI($("#realname").val()))
		+"&user.sex="+ encodeURI(encodeURI($("#sex").val()))
		+"&user.role="+ encodeURI(encodeURI($("#role").val()))
		+"&user.telephone="+ encodeURI(encodeURI($("#telephone").val()))
		+"&user.email="+ encodeURI(encodeURI($("#email").val()))					
		,null,function(){
		alert('添加成功!');
		window.location.href='login.jsp';
		});
	}
</script>
<body style="background: #eeeeee;">
  <div class="main">
		<div class="top">
			<div class="header hide"></div>
			<div class="headtitle"><font size="6" face="华文新魏" color="#ffffff">天津工业大学排课管理系统 </font></div>
		</div>
		
	<div class="container">	
	 <h2 align="center"style="margin-top:30px;"><font color="#400040">用户注册</font></h2>	
			<form name="form"  action="" method="post" ">
				<div style="margin-top: 20px;"><table style="margin:10px auto; width: 300px;">
				   <tr>
				       <td><label >用户类型：</label></td>
				       <td><select id="role"   name="selectrole"style="width:155px;" ltype="select"ligeruiid="select2" >                                 
                              <option value="1">任课教师</option>       
                              <option value="2">学生</option>  
                    </select></td>
				       <td></td>
				   </tr>
				   <tr>
				       <td><label for="username" class="control-label">用户名：</label></td>
				       <td><input type="text"  id="username" onblur="check()"placeholder="用户名" /><font color="red">*</font></td>
				       <td></td>
				   </tr>
				   <tr><th colspan="3"><div id="result" style="color: red ;font-size: 10px;"></div></th></tr>
				   <tr>
				       <td><label for="password" >密码：</label></td>
				       <td> <input type="password"  id="password" placeholder="密码长度不得少于六位"><font color="red">*</font></td>
				       <td></td>
				   </tr>
				   <tr>
				       <td><label for="password1" >再次输入密码：</label></td>
				       <td> <input type="password" id="password1" onblur="checkpwd()"placeholder="再次输入密码"><font color="red">*</font>	</td>
				       <td></td>
				   </tr>
				   <tr><th colspan="3"><div id="result1" style="color: red ;font-size: 10px;"></div></th></tr>				   
				   <tr>
				       <td><label for="realname" >真实姓名：</label></td>
				       <td> <input type="text"  id="realname" ></td>
				       <td></td>
				   </tr>
				   <tr>
				       <td><label for="telephone" >联系方式：</label></td>
				       <td><input type="telephone"  id="telephone" " /></td>
				       <td></td>
				   </tr>
				   <tr>
				       <td><label for="email" >Email：</label></td>
				       <td><input type="email"  id="email" onblur="checkemail()" /><font color="red">*</font></td>
				       <td></td>
				   </tr>
				   <tr><th colspan="3"><div id="result2" style="color: red ;font-size: 10px;"></div></th></tr>				   
				   
				   <tr>
				       <td><label for="sex" class="control-label"style="float: left;">性别：</label></td></td>
				       <td><input type="radio" id="sex" id="optionsRadios1" value="男"> 男
		          		   <input type="radio" id="sex" id="optionsRadios2" value="女"> 女</td>
		          		<td></td>
				   </tr>		   
				   <tr><br>
				       <th colspan="2" style="float: center;"><br><a onclick="regester()"  >注册</a></th>
			           <td ><a href="login.jsp" style="float: right;"><br>登录</a></td>
			          
				   </tr>
				</table></div>
				
		 </form>		      
		</div>
	</div>
</div>
  </body>
</html>
