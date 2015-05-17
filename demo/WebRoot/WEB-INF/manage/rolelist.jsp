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
    <script type="text/javascript" src="js/json2.js" charset="utf-8"></script>
    <script type="text/javascript" src="js/jquery-validation/jquery.metadata.js" charset="utf-8"></script>
    <script type="text/javascript" src="js/jquery-validation/messages_cn.js" charset="utf-8"></script>
    <script src="js/jquery/jquery-1.3.2.min.js"type="text/javascript"></script>
	<script src="js/ligerUI/core/base.js" type="text/javascript"></script>
	<script src="js/ligerUI/ligerui.all.js" type="text/javascript"></script>
<script type="text/javascript">
  var ClassData = { 
	Rows: [<%String s = (String) request.getAttribute("classlist");%> <%=s%>]};
    var ClassList = ClassData.Rows;
   $(f_initGrid);
	var manager, g;
	function f_initGrid() {
		g = manager = $("#maingrid").ligerGrid(
			{columns : [
			{   display : 'ID',  name : 'id',     width : 60,  type : 'int',hide:false
			}, {display : '名称', name : 'rolename',  width : 100, editor: { type: 'text'}
			} ,{display : '角色描述', name : 'roledescribe',width : 120,editor: { type: 'text'}
			}, {display : '等级', name : 'rolerank',width : 120,  type: 'text'
			}, {display : '创建时间', name : 'createdate',width : 100, editor: { type: 'text'}
			}],
					onSelectRow : function(rowdata, rowindex) {
						$("#txtrowindex").val(rowindex);
					},
					checkbox:true,
					enabledEdit : true,
					clickToEdit : false,
					isScroll : false,
					rownumbers:true, 
					pageSize:30,
					url :'${pageContext.request.contextPath}/system/User_rolelist.action',
					width : '100%'
				});
	}
	function beginEdit() {
            var row = manager.getSelectedRow();
            if (!row) { alert('请选择一个角色！'); return; }
            manager.beginEdit(row);
        }
	function cancelEdit(rowid) {
		manager.cancelEdit(rowid);
	}
	function endEdit(rowid) {
	 var row = manager.getSelectedRow();
	 manager.endEdit(row);
	 $.post("${pageContext.request.contextPath}/system/User_roleupdate.action?role.id="+ row.id
				+"&role.rolename="+encodeURI(encodeURI(row.rolename))
				+"&role.roledescribe="+encodeURI(encodeURI(row.roledescribe))
				+"&role.rolerank="+encodeURI(encodeURI(row.rolerank))
				+"&role.createdate="+encodeURI(encodeURI(row.createdate)));
	}

	function deleterow() {
	var row = manager.getSelectedRow();
		if (!row) {
			alert('请选择一个角色！');
			return;
		}
		if (confirm('确定删除?该角色对应的用户将删除！'))
            {
              var rows = g.getCheckedRows();
              var str = "";
              $(rows).each(function(){
              str += this.id +",";
              });
              $.post("${pageContext.request.contextPath}/system/User_roledelete.action?ids="+ str);
			  manager.deleteSelectedRow();	
            }
	}	 
	var m;
	function addrow(){
	var win1;
	if (win1) win1.show();
	else{
	var str = "${pageContext.request.contextPath}/system/User_rolebeginadd.action";
		m=$.ligerDialog.open({
			url : str,
			height : 330,
			width : 350,
			isDrag:true,
			title:'添加角色',
			showMax:true,
			showToggle:true,
			slide: false,			
			modal:false,
			left:300,
			allowClose:true,
		    isResize : false
		});}
	
		
	}
</script>
	</head>
	<body style="padding: 2px">
	 <a class="l-button" style="width:70px;float:left; margin:3px;" onclick="addrow()">添&nbsp;&nbsp;加</a>       
	 <a class="l-button" style="width:70px;float:left; margin:3px;" onclick="deleterow()">删&nbsp;&nbsp;除</a>
	 <a class="l-button" style="width:70px;float:left; margin:3px;" onclick="beginEdit()">修&nbsp;&nbsp;改</a>
	 <a class="l-button" style="width:80px;float:left; margin:3px;" onclick="cancelEdit()">取消修改</a>
	 <a class="l-button" style="width:70px;float:left; margin:3px;" onclick="endEdit()">保存</a>
		<div class="l-clear"></div>
		<div id="maingrid" ></div>
	</body>
</html>

