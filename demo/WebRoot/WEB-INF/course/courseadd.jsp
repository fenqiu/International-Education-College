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
		var m;
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
				
				$.post("${pageContext.request.contextPath}/system/Class_courseendadd.action?course.coursename="
				+  encodeURI(encodeURI($("#coursename").val()))
		        +"&course.teacher="+  encodeURI(encodeURI($("#teacher").val()))
		        +"&course.character="+  encodeURI(encodeURI($("#character").val()))
		        +"&course.checkway="+  encodeURI(encodeURI($("#checkway").val()))
		        +"&course.beginweeks="+ $("#beginweeks").val()
		        +"&course.endweeks="+ $("#endweeks").val()
		        +"&course.credits="+ $("#credit").val()
		        +"&course.num="+  encodeURI(encodeURI($("#num").val())),null,function(){
		        alert('添加成功！');
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
	function refresh() {
	window.document.getElementById("checkimg").src = "<%=basePath%>admin/validatecode.jsp?"
			+ Math.random();
}
	var flg=true;
function checkcode() {
	   $.post("${pageContext.request.contextPath}/system/User_checkcode.action?code="
	   + $("#yan").val(), null, function(data) {
		if (data == "fail") {
			$("#result2").html("验证码输入错误！");
			flg=false;
			$("#result2").show();
		}
		else{
	    $("#result2").hide();
		flg=true;
		} 
	});
}
	var flg = true;
	function check() {
	   var str = document.getElementById("coursename").value;
	   if(str.length==0){
	     $("#result").html("课程名不能为空！");
	     $("#result").show();
	   }else{
	   $.post("${pageContext.request.contextPath}/system/Class_coursecheck.action?course.coursename="
						+ $("#coursename").val(), null, function(data) {
					if (data == "fail") {
						$("#result").html("该课程名已经存在!");
						$("#result").show();
						flg = false;
					} else {
						$("#result").hide();
					}
				});
	   }		
	}
	function check1() {
		var str = document.getElementById("num").value;
		var reg = /^[\u4e00-\u9fa5]+$/gi;
		if(str.length==0){
		    $("#result1").html("课程编号不能为空！");
			$("#result1").show();
		}else{
		if (reg.test(str)) {
			$("#result1").html("课程编号不能包含中文！");
			$("#result1").show();
			flg = false;
			return false;
		} else {
			$("#result1").hide();
		}
		$.post("${pageContext.request.contextPath}/system/Class_coursecheck1.action?course.num="
						+ $("#num").val(), null, function(data) {
					if (data == "fail") {
						$("#result").html("该课程编号已经存在!");
						$("#result1").show();
						flg = false;
					} else {
						$("#result1").hide();
					}
				});
		}		
	}
	function check2(){
	  var str1 = document.getElementById("beginweeks").value;
	  var str2 = document.getElementById("endweeks").value;
	  if(parseInt(str1)>parseInt(str2)){
	    $("#result2").html("起始周不能大于结束周！");
	    $("#result2").show();
	  }else{
	    $("#result2").hide();
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
.l-text{
   width: 80px;

}
</style>

</head>

<body style="padding: 10px" onload="refresh()">

	<form name="form1" method="post" action="" id="form1">
		<div></div>
		<table cellpadding="0" cellspacing="0" class="l-table-edit">
			<tr>
				<td align="right" class="l-table-edit-td">课程编号:</td>
				<td align="left" class="l-table-edit-td"><input name="num"type="text" onblur="check1()" id="num" ltype="text"validate="{required:true,minlength:1,maxlength:20}" /></td>
				<td align="left"><div id="result1" style="margin-top:-10px;color: red;font-size: 10px;"></div></td>
			</tr>
			<tr>
				<td align="right" class="l-table-edit-td">课程名称:</td>
				<td align="left" class="l-table-edit-td"><input name="name" type="text" id="coursename"  ltype="text" onblur="check()"
					validate="{required:true,minlength:1,maxlength:20}" /></td>
				<td align="left"><div id="result" style="color: red;font-size: 10px;"></div></td>
			</tr>
			<tr >
				<td  align="right" class="l-table-edit-td">开课起始周:</td>				
				<td align="left" class="l-table-edit-td"><input name="beginweeks" width="30px" type="text" id="beginweeks"   /></td>
				<td align="left">				
			</tr>
			<tr >
				<td  align="right" class="l-table-edit-td">开课结束周:</td>								
				<td align="left" class="l-table-edit-td"><input name="endweeks" type="text" id="endweeks" onblur="check2()" validate="{required:true,minlength:1,maxlength:20}" /></td>
				<td align="left">
			</tr>
			<tr>
				<td align="right" class="l-table-edit-td">学分:</td>
				<td align="left" class="l-table-edit-td">
				<select type="select" id="credit">
				    <option value="1">1</option>
				    <option value="2">2</option>
				    <option value="3">3</option>
				    <option value="4">4</option>
				    <option value="5">5</option>
				    <option value="6">6</option>
				    <option value="7">7</option>
				</select>
				</td>
				<td align="left"></td>
			</tr>
            
			<tr>
					<td align="right" class="l-table-edit-td">课程性质:</td>
				<td align="left" style="padding-left: 4px">
				<select type="select" id="character">
				    <option value="必修">必修</option>
				    <option value="现选">现选</option>
				    <option value="选修">选修</option>
				</select>
					<!-- <input name="character" type="text"  id="character" ltype='text' value="必修" /> -->
				</td>
					 
				</tr>
				<tr>
					<td align="right" class="l-table-edit-td">考核方式:</td>
				<td align="left" style="padding-left: 4px">
					<select type="select" id="checkway">
				        <option value="集中式">集中式</option>
				        <option value="非集中式">非集中式</option>
				    </select>
					</td>
					 
				</tr><tr>
					<td align="right" class="l-table-edit-td">负责教师:</td>
				<td align="left" style="padding-left: 4px">
					<input name="teacher" type="text"  id="teacher" ltype='text' />
				</td>
					 
				</tr>			
			<tr>
				<td align="right" class="l-table-edit-td"></td>
				<td align="left"><div id="result2" style="color: red;"></div>
				<td align="left" class="l-table-edit-td"></td>
			</tr>
			<tr>
				<td align="right" class="l-table-edit-td"></td>
				<td align="left"><br /><input type="submit"value="添&nbsp;&nbsp;加" id="Button1"class="l-button l-button-submit" /></td>
				<td align="left" class="l-table-edit-td"></td>	
			</tr>
		</table>
		<br />
	</form>

</body>
</html>