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
				if(flg){
				var sexid=1;
				if(document.getElementById("r2").checked){
	                 sexid="女";
                }else{
                  sexid="男";
                }              
				$.post("${pageContext.request.contextPath}/system/User_userendadd.action?user.usernum="+ $("#usernum").val()
		        +"&user.sex="+ encodeURI(encodeURI(sexid))
		        +"&deid="+ $("#depid").val()
		        +"&role="+$("#role").val()	            
		        +"&user.username="+ encodeURI(encodeURI($("#username").val()))
		        +"&user.realname="+ encodeURI(encodeURI($("#realname").val()))
		        +"&user.telephone="+ encodeURI(encodeURI($("#telephone").val()))
		        +"&user.email="+ encodeURI(encodeURI($("#email").val())),null,function(){
		        alert('添加成功!');
		        parent.m.hide();
	            parent.g.loadData();
		       });
			 }
			}
		});
		$("form").ligerForm();
		$(".l-button-test").click(function() {
			alert(v.element($("#txtName")));
		});

	});
	<%-- function refresh() {
	window.document.getElementById("checkimg").src = "<%=basePath%>admin/validatecode.jsp?"+ Math.random();
	}
	
	function checkcode() {
		$.post(
				"${pageContext.request.contextPath}/system/User_checkcode.action?code="
						+ $("#yan").val(), null, function(data) {
					if (data == "fail") {
						$("#result2").html("验证码输入错误！");
						flg = false;
						$("#result2").show();
					} else {
						$("#result2").hide();
						flg = true;
					}
				});
	} --%>
	var flg = true;
	function check() {	    
		var str = document.getElementById("usernum").value;
		var str1 = document.getElementById("username").value;
		var reg = /^[\u4e00-\u9fa5]+$/gi;
		if (reg.test(str)) {
			$("#result").html("用户编号不能包含中文！");
			$("#result").show();
			flg = false;
			document.regFrm.username.focus();
			return false;
		} else {
			$("#result").hide();
		}$.post("${pageContext.request.contextPath}/system/User_usercheck1.action?user.usernum="
						+ $("#usernum").val(), null, function(data) {
					if (data == "fail") {
						$("#result").html("该用户名或编号已经存在!");
						$("#result").show();
						flg = false;
					} else {
						$("#result").hide();
					}
				});
				
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
			<tr>
				<td align="right" class="l-table-edit-td">用户编号:</td>
				<td align="left" class="l-table-edit-td"><input name="usernum"type="text"  id="usernum" onblur="check()" ltype="text" placeholder="请输入用户编号" validate="{required:true,minlength:1,maxlength:20}" /></td>
				<td align="left"></td>
			</tr>
			<tr>
				<td align="right" class="l-table-edit-td">用户名:</td>
				<td align="left" class="l-table-edit-td"><input name="username"type="text"  id="username" ltype="text" placeholder="请输入用户名" validate="{required:true,minlength:1,maxlength:20}" /></td>
				<td align="left"></td>
			</tr>
			<tr>
				<td align="right" class="l-table-edit-td">姓名:</td>
				<td align="left" class="l-table-edit-td"><input name="realname"type="text" id="realname" ltype="text"validate="{required:true,minlength:1,maxlength:20}" /></td>
				<td align="left"></td>
			</tr>
			<tr>
				<td align="right" class="l-table-edit-td" valign="top">性别:</td>
				<td align="left" class="l-table-edit-td"><input id="r1"
					type="radio" name="rbtnl" value="1" checked="checked" /><label
					for="rbtnl_0">男</label> <input id="r2" type="radio" name="rbtnl"
					value="2" /><label for="rbtnl_1">女</label></td>
				<td align="left"></td>
			</tr>
			<tr>
				<td align="right" class="l-table-edit-td">电话:</td>
				<td align="left" class="l-table-edit-td"><input name="telephone"type="text" id="telephone" ltype="text"validate="{required:true,minlength:1,maxlength:20}" /></td>
				<td align="left"></td>
			</tr>
			<tr>
				<td align="right" class="l-table-edit-td">E-mail:</td>
				<td align="left" class="l-table-edit-td"><input name="email"type="text" id="email" ltype="text"validate="{required:true,minlength:1,maxlength:20}" /></td>
				<td align="left"></td>
			</tr>
			<tr>
				<td align="right" class="l-table-edit-td">部门:</td>
				<td align="left" class="l-table-edit-td">
				<select name="depid" id="depid" ltype="select">
						<s:iterator value="#deptlist" id="gg">
							<option value="<s:property value="#gg.deptId"/>"><s:property value="#gg.deptname" /></option>
						</s:iterator>
				</select></td>
			</tr>
			<tr>
				<td align="right" class="l-table-edit-td">角色:</td>
				<td align="left" class="l-table-edit-td">
				<select  name="role" id="role">  
                              <option value="2">任课教师</option>       
                              <option value="3">学生</option>  
                    </select></td>
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
				<td align="left" class="l-table-edit-td"><br /> <input
					type="submit" value="添&nbsp;&nbsp;加" id="Button1"
					class="l-button l-button-submit" />
				</td>
				</td>
				<td align="left">
			</tr>
		</table>
		<br />
	</form>
</body>
</html>