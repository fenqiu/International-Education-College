<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>天津工业大学排课管理系统</title>
<link href="<%=basePath%>js/ligerUI/skins/Gray/css/form.css" rel="stylesheet"type="text/css" />
<link href="<%=basePath%>js/ligerUI/skins/Gray/css/common.css" rel="stylesheet"type="text/css" />
<script src="<%=basePath%>js/jquery/jquery-1.6.min.js" type="text/javascript"></script>
<script src="<%=basePath%>js/ligerUI/core/base.js" type="text/javascript"></script>
<script src="<%=basePath%>js/ligerUI/plugins/ligerForm.js" type="text/javascript"></script>
<script src="<%=basePath%>js/ligerUI/plugins/ligerDateEditor.js" type="text/javascript"></script>
<script src="<%=basePath%>js/ligerUI/plugins/ligerComboBox.js" type="text/javascript"></script>
<script src="<%=basePath%>js/ligerUI/plugins/ligerSpinner.js" type="text/javascript"></script>
<script src="<%=basePath%>js/ligerUI/plugins/ligerTextBox.js" type="text/javascript"></script>
<%-- <script src="<%=basePath%>js/ligerUI/plugins/ligerRadio.js" type="text/javascript"></script> --%>
<script src="<%=basePath%>js/ligerUI/plugins/ligerTip.js" type="text/javascript"></script>
<script src="<%=basePath%>js/jquery-validation/jquery.validate.min.js"type="text/javascript"></script>
<script src="<%=basePath%>js/jquery-validation/jquery.metadata.js" type="text/javascript"></script>
<script src="<%=basePath%>js/jquery-validation/messages_cn.js" type="text/javascript"></script>
<script type="text/javascript">
	var eee;
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
				$.post("${pageContext.request.contextPath}/system/User_userchangepwd.action?user.id="+ $("#userid").val()		       
		        +"&user.password="+ encodeURI(encodeURI($("#newpwd").val())),null,function(){
		        alert('修改成功!');
		        parent.m.hide();
	            parent.g.loadData();
		       });
			 
			}
		});
		$("form").ligerForm();
		$(".l-button-test").click(function() {
			alert(v.element($("#txtName")));
		});

	});
	var flg = true;
	function check() {	    
		$.post("${pageContext.request.contextPath}/system/User_pwdcheck.action?user.id="+ $("#userid").val()
		      +"&user.password="+$("#oldpwd").val() , null, function(data) {
					if (data == "fail") {
						$("#result").html("输入的密码不正确!");
						$("#result").show();
						flg = false;
					} else {
						$("#result").hide();
					}
				});
				
	}
	function check1(){
	 var str1 = document.getElementById("newpwd").value;
	 var str2 = document.getElementById("newpwd1").value;
	 if(str1==str2){
	   $("#result").hide();
	 }else{
	   $("#result").html("两次输入密码不一致！");
	   $("#result").show();
	 }
	}	
</script>
<style type="text/css">
body {
	font-size: 12px;
}

.l-table-edit {
	
}

.l-table-edit-td {
	padding: 4px;
}

.s {
	width: 61px;
	height: 18px;
	display: inline-block;
	background-color: #eeeeee;
	text-align: center;
	font-size: 13px;
}

.l-button-submit,.l-button-test {
	width: 80px;
	float: left;
	margin-left: 10px;
	padding-bottom: 2px;
}

.l-verify-tip {
	left: 230px;
	top: 120px;
}
</style>

</head>

<body style="padding: 10px">

	<form name="form1" method="post" action="" id="form1">
		<div></div>
		<table cellpadding="0" cellspacing="0" class="l-table-edit">
			<tr><input id="userid" value="${userid }" type="hidden"/>
				<td align="right" class="l-table-edit-td">原密码:</td>
				<td align="left" class="l-table-edit-td"><input name="oldpwd"type="password" onblur="check()" id="oldpwd" ltype="text" placeholder="请输入原密码" validate="{required:true,minlength:1,maxlength:20}" /></td>
				<td align="left"></td>
			</tr>
			<tr>
				<td align="right" class="l-table-edit-td">新密码:</td>
				<td align="left" class="l-table-edit-td"><input name="newpwd"type="password" id="newpwd" ltype="text" placeholder="请输入新密码" validate="{required:true,minlength:1,maxlength:20}" /></td>
				<td align="left"></td>
			</tr>
			<tr>
				<td align="right" class="l-table-edit-td">确认密码:</td>
				<td align="left" class="l-table-edit-td"><input name="newpwd1"type="password" id="newpwd1" onblur="check1()"placeholder="请再次输入新密码" ltype="text"validate="{required:true,minlength:1,maxlength:20}" />
				</td>
			</tr>			 
			<tr>
				<td align="right" class="l-table-edit-td"></td>
				<td align="left"><div id="result2" style="color: red;"></div></td>
				<td align="left" class="l-table-edit-td"></td>
				
			</tr>
			<tr>
				<th align="center" class="l-table-edit-td"colspan="3"><div id="result" style="color: red;"></div></th>								
			</tr>
			<tr>
				<td align="right" class="l-table-edit-td"></td>
				<td align="left" class="l-table-edit-td"><br />
				<input type="submit" value="修&nbsp;&nbsp;改" id="Button1" class="l-button l-button-submit" />
				</td>
				<td align="left"></td>
			</tr>
		</table>
		<br />
	</form>
</body>
</html>