<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>班级列表</title>
	<link href="<%=basePath%>js/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet"type="text/css" />	
	<link href="<%=basePath %>js/ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css"/>	
    <script type="text/javascript" src="<%=basePath %>js/jquery-validation/jquery.validate.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="<%=basePath %>js/json2.js" charset="utf-8"></script>
    <script type="text/javascript" src="<%=basePath %>js/jquery-validation/jquery.metadata.js" charset="utf-8"></script>
    <script type="text/javascript" src="<%=basePath %>js/jquery-validation/messages_cn.js" charset="utf-8"></script>
    <script type="text/javascript" src="<%=basePath %>js/ligerUI/plugins/ligerTab.js"></script>
    <script type="text/javascript" src="<%=basePath %>js/jquery/jquery-1.3.2.min.js"></script>
	<script src="<%=basePath %>js/ligerUI/core/base.js" type="text/javascript"></script>
	<script src="<%=basePath %>js/ligerUI/ligerui.all.js" type="text/javascript"></script>	
	<script type="text/javascript">
	var ClassData = {Rows: [
		<%String  s= (String) request.getAttribute("classlist");%>
		<%=s%>
		 ]};		
	$(f_initGrid);
	var manager, g;
	function f_initGrid() {
		g = manager = $("#maingrid").ligerGrid(
				{
				columns : [{
				display : 'ID',
				name : 'Classid',
				width : 60,
				hide:true,
				type : 'int'
			}, {
				display : '班级名称',
				name : 'Classname',
				width : 150,
				editor: { type: 'text'}
			}, {
				display : '班级专业',
				name : 'Classmajor',
				width : 150,
				editor: { type: 'text'}
			},{
					display : '班内学生',
					isSort : false,
					width : 120,
					render : function() {
						var h = "";
						h += "<a href='javascript:classstu("+ ")'>管理</a> ";
						return h;
					}
			} ],
					onSelectRow : function(rowdata, rowindex) {
						$("#txtrowindex").val(rowindex);
					},
					enabledEdit : true,
					clickToEdit : false,
					isScroll : false,
			         rownumbers:true,
			         pageSize:30,
					data : ClassData,
					width : '100%'
				});
	}
    function classstu(){
     var row = manager.getSelectedRow();
	 	if (!row) {
			alert('请选择班级！');
			return;
		}
    var str = "${pageContext.request.contextPath}/system/Class_classstulist.action?cls.id="+row.Classid;
    var str1 = row.Classname;
		m=$.ligerDialog.open({
			url : str,
			height : 650,
			width : 1000,
			title:str1,
			isDrag:true,
			showMax:true,
			showToggle:true,
			slide: false,			
			modal:false,
			isResize : true
		});
		
}
	function beginEdit() {
            var row = manager.getSelectedRow();
            if (!row) { alert('请选择一个班级！'); return; }
            manager.beginEdit(row);
        }
	function cancelEdit(rowid) {
		manager.cancelEdit(rowid);
	}
	function endEdit(rowid) {
	 var row = manager.getSelectedRow();
		manager.endEdit(row);
	$.post("${pageContext.request.contextPath}/system/Class_classupdate.action?cls.id="+ row.Classid
				+"&cls.classname="+encodeURI(encodeURI(row.Classname))
				+"&cls.major="+encodeURI(encodeURI(row.Classmajor)) );
	}
	var m;
    function addclass(){
	var str = "${pageContext.request.contextPath}/system/Class_classbeginadd.action";
		m=$.ligerDialog.open({
			url : str,
			height : 290,
			width : 350,
			isResize : true
		});
		
	}
	function addbatchclass(){
	var str = "${pageContext.request.contextPath}/system/Class_classbatchadd.action";
		m=$.ligerDialog.open({		   
			url : str,
			height : 400,
			width : 800,
			isResize : true
		});
		
	}
	function deleteclass() {
	var row = manager.getSelectedRow();
		if (!row) {
			alert('请选择一个班级！');
			return;
		}
	$.ligerDialog.confirm('对应的学生也将被删除！确认删除吗？', function (yes){
                       if(yes){	
	     $.post("${pageContext.request.contextPath}/system/Class_classdelete.action?cls.id="
				+ row.Classid,null,function(){
					 manager.deleteSelectedRow();
				});
		}
		});
	}	
</script>
	</head>
	<body style="padding: 2px">
			<a class="l-button" style="width:60px;float:left; margin:3px;" onclick="addclass()">添&nbsp;加</a>
			<a class="l-button" style="width:80px;float:left; margin:3px;" onclick="addbatchclass()">批量添加</a>
			<a class="l-button" style="width:60px;float:left; margin:3px;" onclick="deleteclass()">删&nbsp;除</a>
			<a class="l-button" style="width:60px;float:left; margin:3px;" onclick="beginEdit()">修&nbsp;改</a>
			<a class="l-button" style="width:80px;float:left; margin:3px;" onclick="cancelEdit()">取消修改</a>
		    <a class="l-button" style="width:70px;float:left; margin:3px;" onclick="endEdit()">保存</a>
		<div class="l-clear"></div>
		<div id="maingrid" ></div>
	</body>
</html>
