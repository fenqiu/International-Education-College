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
							
				$.post("${pageContext.request.contextPath}/system/Class_roomendadd.action?&room.num="+encodeURI(encodeURI($("#num").val()))
				+"&room.roomname="+encodeURI(encodeURI($("#roomname").val()))
				+"&room.roomplace="+encodeURI(encodeURI($("#roomplace").val()))
				+"&room.roomcapacity="+encodeURI(encodeURI($("#roomcapacity").val()))
				+"&room.realcapacity="+encodeURI(encodeURI($("#realcapacity").val()))
				+"&room.note="+encodeURI(encodeURI($("#note").val()))
				+"&room.roomtype="+encodeURI(encodeURI($("#roomtype").val())),null,function(){
		        alert('添加成功!');
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
		var str = document.getElementById("num").value;
		if(str.length==0){
		    $("#result").html("编号不能为空！");
			$("#result").show();
		}else{
		var reg = /^[\u4e00-\u9fa5]+$/gi;
		if (reg.test(str)) {
			$("#result").html("编号不能包含中文！");
			$("#result").show();
			flg = false;
			document.regFrm.username.focus();
			return false;
		} else {
			$("#result").hide();
		}$.post("${pageContext.request.contextPath}/system/Class_roomcheck.action?room.num="
						+ $("#num").val(), null, function(data) {
					if (data == "fail") {
						$("#result").html("该教室编号已经存在!");
						$("#result").show();
						flg = false;
					} else {
						$("#result").hide();
					}
				});	
			}			
	}	
	function check1(){
	  var str1 = document.getElementById("roomcapacity").value;
	  var str2 = document.getElementById("realcapacity").value;
	  if(parseInt(str2)>parseInt(str1)){
	     $("#result1").html("实际容量不能大于原本容量！");
	     $("#result1").show();
	  }else{
	  $("#result1").hide();
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
			<tr>
				<td align="right" class="l-table-edit-td">编号:</td>
				<td align="left" class="l-table-edit-td"><input name="num"type="text" onblur="check()" id="num" ltype="text" placeholder="请输入编号" validate="{required:true,minlength:1,maxlength:20}" /></td>
				<td align="left"></td>
			</tr>
			<tr>
				<td align="right" class="l-table-edit-td">教室名:</td>
				<td align="left" class="l-table-edit-td"><input name="roomname"type="text" id="roomname" ltype="text"validate="{required:true,minlength:1,maxlength:20}" /></td>
				<td align="left"></td>
			</tr>
			
			<tr>
				<td align="right" class="l-table-edit-td">教室位置:</td>
				<td align="left" class="l-table-edit-td">
				<input name="roomplace"type="text" id="roomplace" ltype="text" /></td>
			</tr>			 
			<tr>
				<td align="right" class="l-table-edit-td">教室类型:</td>
				<td align="left" class="l-table-edit-td">
				 <select id="roomtype">
				   <option value="多媒体教室">多媒体教室</option>
				   <option value="普通教室">普通教室</option>
				   <option value="实验室">实验室</option>
				   <option value="机房">机房</option>
				 </select>
                </td>
			</tr>
			<tr>
				<td align="right" class="l-table-edit-td">容量:</td>
				<td align="left" class="l-table-edit-td">
				<input name="stuname"type="text" id="roomcapacity" ltype="text" /></td>
			</tr>
			<tr>
				<td align="right" class="l-table-edit-td">实际容量:</td>
				<td align="left" class="l-table-edit-td">
				<input name="stuname"type="text" id="realcapacity" onblur="check1()" ltype="text" /></td>
			</tr>
			<tr>
				<td align="right" class="l-table-edit-td">备注:</td>
				<td align="left" class="l-table-edit-td">
				<input name="stuname"type="text" id="note" ltype="text" /></td>
			</tr>
			<tr>
				<td align="right" class="l-table-edit-td"></td>
				<td align="left"><div id="result" style="color: red;"></div><div id="result1" style="color: red;"></div></td>
				<td align="left" class="l-table-edit-td"></td>
				
			</tr>
			<tr>
				<th align="center" class="l-table-edit-td"colspan="3"><div id="result" style="color: red;"></div></th>								
			</tr>
			<tr>
				<td align="right" class="l-table-edit-td"></td>
				<td align="left" class="l-table-edit-td"><br /> <input type="submit" value="添&nbsp;&nbsp;加" id="Button1"
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