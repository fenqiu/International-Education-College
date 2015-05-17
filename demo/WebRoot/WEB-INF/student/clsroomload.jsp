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
	<link href="<%=basePath%>js/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet"type="text/css" />	
	<link href="<%=basePath %>js/ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css"/>	
    <script type="text/javascript" src="js/jquery-validation/jquery.validate.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="js/json.js" charset="utf-8"></script>
    <script type="text/javascript" src="js/jquery-validation/jquery.metadata.js" charset="utf-8"></script>
    <script type="text/javascript" src="js/jquery-validation/messages_cn.js" charset="utf-8"></script>
    <script src="js/jquery/jquery-1.3.2.min.js"type="text/javascript"></script>
	<script src="js/ligerUI/core/base.js" type="text/javascript"></script>
	<script src="js/ligerUI/ligerui.all.js" type="text/javascript"></script>
    <script type="text/javascript">			
		var flg= false;
		function search(){
			if ((document.all.roomname.value =="")&&(document.all.roomplace.value =="")){
				alert("对不起，请您先输入查询关键字!");
				return;
			}else{
			$.post("${pageContext.request.contextPath}/system/Class_roomsearch.action?room.roomname=" + encodeURI(encodeURI($("#roomname").val())
		+"&room.roomplace="+encodeURI(encodeURI($("#roomplace").val()))), null, function(data) {
					if (data == "fail") {
						$("#result").html("没有查询到满足的条件!");
						$("#result").show();
						$("#result1").hide();
						flg = false;
					} else {
					    $("#result1").html(data);
						$("#result1").show();
					}
				});
			}
			
		}
</script>
<style type="text/css">
h2{
margin-top: 20px;
}
#search{
  border-bottom: 1px solid; 
}
#resultlist{
  width: 800;
  border: 1px solid #DFDFDF;
  margin-top: 20px;
  margin-left: 100px;
}
#resultlist td{
text-align:center;
border: 1px solid #DFDFDF;
}

.resultlist_tr{
text-align:center;
background-color:#F1F1F1 ;
border-right: 1px solid #DFDFDF;
}

</style>
</head>
	<body style="font-size: 12px;">
	<div id="search">
	  <table  cellspacing="0" cellpadding="0"class="l-table-edit"style="margin-top: 10px;margin-left:50px;">
		 <tr height="40px">
			<td align="right" class="l-table-edit-td">教室名称:&nbsp;</td>
			<td align="left"class="l-table-edit-td" ><input name="clsroomname" type="text" id="roomname"value=""/></td>
		    <td><br></td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">教室位置:&nbsp;</td>
			<td align="left"class="l-table-edit-td"><input name="roomplace" type="text"  id="roomplace"/></td> 
		    <td><br></td>
		</tr>
         <tr height="40px">
			<th align="right"class="l-table-edit-td" colspan="2" >
			<button class="l-button" style="width:60px;float:center; " onclick="search()">查&nbsp;询</button></th>	
		 </tr>
		</table>	
	</div>
		
		<h2>查询结果显示：</h2>			  
		<div id="result1"></div>
		</table>
        
    </table>
	</body>
</html>

