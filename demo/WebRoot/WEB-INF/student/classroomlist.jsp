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
			}, {display : '编号', name : 'num',  width : 120, editor: { type: 'text'}
			}, {display : '名称', name : 'roomname',  width : 120, editor: { type: 'text'}
			} ,{display : '位置', name : 'roomplace',width : 120,editor: { type: 'text'}
			}, {display : '类型', name : 'roomtype',width : 120, editor: { type: 'text'}
			}, {display : '容量', name : 'roomcapacity',width : 100, editor: { type: 'text'}
			}, {display : '实际容量', name : 'realcapacity',width : 100, editor: { type: 'text'}			
			}, {display : '备注', name : 'note',width : 120, editor: { type: 'text'}
			} ],
					onSelectRow : function(rowdata, rowindex) {
						$("#txtrowindex").val(rowindex);
					},
					checkbox:true,
					enabledEdit : true,
					clickToEdit : false,
					isScroll : false,
					rownumbers:true, 
					pageSize:30,
					url :'${pageContext.request.contextPath}/system/Class_roomlist.action',
					width : '100%'
				});
	}
	function beginEdit() {
            var row = manager.getSelectedRow();
            if (!row) { alert('请选择一个教室！'); return; }
            manager.beginEdit(row);
        }
	function cancelEdit(rowid) {
		manager.cancelEdit(rowid);
	}
	function endEdit(rowid) {
	 var row = manager.getSelectedRow();
	 manager.endEdit(row);
	 $.post("${pageContext.request.contextPath}/system/Class_roomupdate.action?room.id="+ row.id
				+"&room.num="+row.num
				+"&room.roomname="+row.roomname
				+"&room.roomplace="+encodeURI(encodeURI(row.roomplace))
				+"&room.roomcapacity="+encodeURI(encodeURI(row.roomcapacity))
				+"&room.realcapacity="+encodeURI(encodeURI(row.realcapacity))
				+"&room.note="+encodeURI(encodeURI(row.note))
				+"&room.roomtype="+encodeURI(encodeURI(row.roomtype)));
	}

	function deleterow() {
	var row = manager.getSelectedRow();
		if (!row) {
			alert('请选择一个教室！');
			return;
		}
		if (confirm('确定删除?'))
            {
              var rows = g.getCheckedRows();
              var str = "";
              $(rows).each(function(){
              str += this.id +",";
              });
              $.post("${pageContext.request.contextPath}/system/Class_roomdelete.action?ids="+ str);
			  manager.deleteSelectedRow();	
            }
	}	 
	var m;
	function addrow(){
	var win1;
	if (win1) win1.show();
	else{
	var str = "${pageContext.request.contextPath}/system/Class_roombeginadd.action";
		m=$.ligerDialog.open({
			url : str,
			height : 430,
			width : 350,
			isDrag:true,
			title:'添加教室',
			showMax:true,
			showToggle:true,
			slide: false,			
			modal:false,
			left:200,
			allowClose:true,
		    isResize : false
		});}
	
		
	}
	function addbatchrow(){
	var str = "${pageContext.request.contextPath}/system/Class_roombatchadd.action";
		m=$.ligerDialog.open({
			url : str,
			height : 500,
			width : 800,
			isResize : true
		});
		
	}
</script>
	</head>
	<body style="padding: 2px">
	 <a class="l-button" style="width:70px;float:left; margin:3px;" onclick="addrow()">添&nbsp;&nbsp;加</a>
	 <a class="l-button" style="width:70px;float:left; margin:3px;" onclick="addbatchrow()">批量添加</a>       
	 <a class="l-button" style="width:70px;float:left; margin:3px;" onclick="deleterow()">删&nbsp;&nbsp;除</a>
	 <a class="l-button" style="width:70px;float:left; margin:3px;" onclick="beginEdit()">修&nbsp;&nbsp;改</a>
	 <a class="l-button" style="width:80px;float:left; margin:3px;" onclick="cancelEdit()">取消修改</a>
	 <a class="l-button" style="width:70px;float:left; margin:3px;" onclick="endEdit()">保存</a>
		<div class="l-clear"></div>
		<div id="maingrid" ></div>
	</body>
</html>

