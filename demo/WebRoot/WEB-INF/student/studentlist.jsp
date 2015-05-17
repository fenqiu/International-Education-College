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
			}, {display : '学号', name : 'stuid',  width : 120, editor: { type: 'text'}
			} ,{display : '密码', name : 'password',width : 80,editor: { type: 'password'}
			}, {display : 'FirstName', name : 'enname',width : 120, editor: { type: 'text'}
			}, {display : 'FamilyName', name : 'ensuiname',width : 120, editor: { type: 'text'}
			}, {display : '中文名', name : 'stuname',width : 120, editor: { type: 'text'}
			} ,{display : '性别', name : 'stusex', width : 50,  editor:{type:'text'}				
			} ,{ display: '班级',  name: 'classid', width: 100, isSort: false,
            editor: { type: 'select', data: ClassList, valueColumnName: 'Classid', displayColumnName: 'Classname' }, 
                  render: function (item)
                    {for (var i = 0; i < ClassList.length; i++)
                        { if (ClassList[i]['Classid'] == item.classid)
                                return ClassList[i]['Classname'];
                        }
                        return item.Classname;
                    }
                }
             ,{display : '电话', name : 'telephone', width : 100,  editor:{type:'text'} 
             } ,{display : '住址', name : 'roomplace', width : 120,  editor:{type:'text'}	}	],
					onSelectRow : function(rowdata, rowindex) {
						$("#txtrowindex").val(rowindex);
					},
					checkbox:true,
					enabledEdit : true,
					clickToEdit : false,
					isScroll : false,
					rownumbers:true, 
					pageSize:30,
					url :'${pageContext.request.contextPath}/system/Stu_stulist.action',
					width : '100%'
				});
	}
	function beginEdit() {
            var row = manager.getSelectedRow();
            if (!row) { alert('请选择一名学生！'); return; }
            manager.beginEdit(row);
        }
	function cancelEdit(rowid) {
		manager.cancelEdit(rowid);
	}
	function endEdit(rowid) {
	 var row = manager.getSelectedRow();
	 manager.endEdit(row);
	 $.post("${pageContext.request.contextPath}/system/Stu_stuupdate.action?stu.id="+ row.id
				+"&stu.stuid="+row.stuid
				+"&stu.password="+row.password
				+"&classid="+row.classid
				+"&stu.sex="+encodeURI(encodeURI(row.stusex))
				+"&stu.stuname="+encodeURI(encodeURI(row.stuname)));
	}

	function deleterow() {
	var row = manager.getSelectedRow();
		if (!row) {
			alert('请选择一名学生！');
			return;
		}
		if (confirm('确定删除?'))
            {
              var rows = g.getCheckedRows();
              var str = "";
              $(rows).each(function(){
              str += this.id +",";
              });
              $.post("${pageContext.request.contextPath}/system/Stu_studelete.action?ids="+ str);
			  manager.deleteSelectedRow();	
            }
	}	 
	var m;
	function addstu(){
	var win1;
	if (win1) win1.show();
	else{
	var str = "${pageContext.request.contextPath}/system/Stu_stubeginadd.action";
		m=$.ligerDialog.open({
			url : str,
			height : 400,
			width : 350,
			isDrag:true,
			showMax:true,
			showToggle:true,
			slide: false,			
			modal:false,
			left:200,
			allowClose:true,
		    isResize : false
		});}
	
		
	}
	function addbatchstu(){
	var str = "${pageContext.request.contextPath}/system/Stu_stubatchadd.action";
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
	 <a class="l-button" style="width:70px;float:left; margin:3px;" onclick="addstu()">添&nbsp;&nbsp;加</a>
	 <a class="l-button" style="width:70px;float:left; margin:3px;" onclick="addbatchstu()">批量添加</a>       
	 <a class="l-button" style="width:70px;float:left; margin:3px;" onclick="deleterow()">删&nbsp;&nbsp;除</a>
	 <a class="l-button" style="width:70px;float:left; margin:3px;" onclick="beginEdit()">修&nbsp;&nbsp;改</a>
	 <a class="l-button" style="width:80px;float:left; margin:3px;" onclick="cancelEdit()">取消修改</a>
	 <a class="l-button" style="width:70px;float:left; margin:3px;" onclick="endEdit()">保存</a>
		<div class="l-clear"></div>
		<div id="maingrid" ></div>
	</body>
</html>

