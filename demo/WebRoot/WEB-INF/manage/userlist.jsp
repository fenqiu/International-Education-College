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
   var DeptData = { 
	Rows: [<%String s = (String) request.getAttribute("deptlist");%> <%=s%>]};
    var DeptList =DeptData.Rows;
    var RoleData = { 
	Rows: [
	<%String ss = (String) request.getAttribute("rolelist");%>
	<%=ss%>
]};
 var RoleList = RoleData.Rows; 
 $(f_initGrid);
	var manager, g;
	function f_initGrid() {
		g = manager = $("#maingrid").ligerGrid(
			{columns : [
			{   display : 'ID',   name : 'id',         width : 60,  type : 'int',hide:false
			}, {display : '用户编号', name : 'usernum',   width : 60, editor: { type: 'text'}
			}, {display : '用户名', name : 'username',   width : 120, editor: { type: 'text'}
			} ,{display : '密码',  name : 'password',   width : 120, editor: { type: 'password'}
			}, {display : '姓名',  name : 'realname',   width : 120, editor: { type: 'text'}
			} ,{display : '性别',  name : 'sex',        width : 60,  editor:{type:'text'}	
			} ,{display : '电话',  name : 'telephone',  width : 120,  editor:{type:'text'}	
			} ,{display : 'E-mail', name : 'email',    width : 150,  editor:{type:'text'}				
			} ,{ display: '部门',  name: 'deptid', width: 150, isSort: false,
            editor: { type: 'select', data: DeptList, valueColumnName: 'Deptid', displayColumnName: 'Deptname' }, 
                  render: function (item)
                    {for (var i = 0; i < DeptList.length; i++)
                        { if (DeptList[i]['Deptid'] == item.deptid)
                                return DeptList[i]['Deptname'];
                        }
                        return item.Deptname;
                    }
                } ,{ display: '角色', name: 'roleid', width: 120, isSort: false,
                    editor: { type: 'select', data: RoleList, valueColumnName: 'Roleid', displayColumnName: 'Roledescribe' }, 
                    render: function (item)
                    {
                        for (var i = 0; i < RoleList.length; i++)
                        {
                            if (RoleList[i]['Roleid'] == item.roleid)
                                return RoleList[i]['Roledescribe'];
                        }
                        return item.Roledescribe;
                    }
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
					url :'${pageContext.request.contextPath}/system/User_userlist.action',
					width : '100%'
				});
	}
	function beginEdit() {
            var row = manager.getSelectedRow();
            if (!row) { alert('请选择一名用户！'); return; }
            manager.beginEdit(row);
        }
	function cancelEdit(rowid) {
		manager.cancelEdit(rowid);
	}
	function endEdit(rowid) {
	 var row = manager.getSelectedRow();
	 manager.endEdit(row);
	 $.post("${pageContext.request.contextPath}/system/User_userupdate.action?user.id="+ row.id
				+"&user.usernum="+row.usernum
				+"&user.username="+encodeURI(encodeURI(row.username))
				+"&user.password="+row.password
				+"&user.realname="+encodeURI(encodeURI(row.realname))
				+"&user.sex="+encodeURI(encodeURI(row.sex))
				+"&user.telephone="+row.telephone
				+"&user.email="+row.email
				+"&deid="+row.deptid);
				
	}

	function deleterow() {
	var row = manager.getSelectedRow();
		if (!row) {
			alert('请选择一名用户！');
			return;
		}
		if (confirm('确定删除?'))
            {
              var rows = g.getCheckedRows();
              var str = "";
              $(rows).each(function(){
              str += this.id +",";
              });
              $.post("${pageContext.request.contextPath}/system/User_userdelete.action?ids="+ str);
			  manager.deleteSelectedRow();	
            }
	}	 
	var m;
	function adduser(){
	var win1;
	if (win1) win1.show();
	else{
	var str = "${pageContext.request.contextPath}/system/User_userbeginadd.action";
		m=$.ligerDialog.open({
			url : str,
			height : 430,
			title:'添加用户',
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
	var str = "${pageContext.request.contextPath}/system/User_userbatchadd.action";
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
	 <a class="l-button" style="width:70px;float:left; margin:3px;" onclick="adduser()">添&nbsp;&nbsp;加</a>
	 <a class="l-button" style="width:70px;float:left; margin:3px;" onclick="addbatchstu()">批量添加</a>       
	 <a class="l-button" style="width:70px;float:left; margin:3px;" onclick="deleterow()">删&nbsp;&nbsp;除</a>
	 <a class="l-button" style="width:70px;float:left; margin:3px;" onclick="beginEdit()">修&nbsp;&nbsp;改</a>
	 <a class="l-button" style="width:80px;float:left; margin:3px;" onclick="cancelEdit()">取消修改</a>
	 <a class="l-button" style="width:70px;float:left; margin:3px;" onclick="endEdit()">保存</a>
		<div class="l-clear"></div>
		<div id="maingrid" ></div>
	</body>
</html>

