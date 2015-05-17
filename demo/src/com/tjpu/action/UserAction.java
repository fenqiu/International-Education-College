package com.tjpu.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.tjpu.bean.Dept;
import com.tjpu.bean.Role;
import com.tjpu.bean.User;
import com.tjpu.service.UserService;

@Controller
public class UserAction {
	@Autowired
	UserService userService;
	private int deid;
	private String ids;
	private int roles;
	private Role role;
	public int getRoles() {
		return roles;
	}

	public void setRoles(int roles) {
		this.roles = roles;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}
	private User user;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	public int getDeid() {
		return deid;
	}
	public void setDeid(int deid) {
		this.deid = deid;
	}

	
	private void datatojson(Map<String, Object> map) {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json;charset=utf-8");
		Gson gson = new Gson();
		String json = gson.toJson(map);
		// System.out.print(json);
		PrintWriter out;
		try {
			out = response.getWriter();
			out.write(json);
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public String usercheck() {
		HttpServletResponse response = ServletActionContext.getResponse();
		boolean flg = userService.usercheck(user.getUsername());
		if (!flg) {
			try {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print("fail");
				out.flush();
				out.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}

	public String useradd() {
		userService.useradd(user,deid,roles);
		return null;
	}

	public String loginOut() {
		ActionContext.getContext().getSession().put("user", null);
		return "success";
	}

	public String changepwd(){
		ActionContext.getContext().put("userid", user.getId());
		return "changepwd";
	}
	
	public String pwdcheck(){
		HttpServletResponse response = ServletActionContext.getResponse();
		boolean flg = userService.pwdcheck(user.getId(),user.getPassword());
		if (!flg) {
			try {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print("fail");
				out.flush();
				out.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}
	public String userchangepwd(){
		userService.userchangpwd(user);
		return null;
	}
	
	public String usermanage() {
		String deptlist = userService.deptlist();
		ActionContext.getContext().put("deptlist", deptlist);
		String rolelist = userService.rolelist();
		ActionContext.getContext().put("rolelist", rolelist);
		return "userlist";
	}

	public String userlist() {
		HttpServletRequest request = ServletActionContext.getRequest();
		int page = Integer.parseInt(request.getParameter("page"));
		int pageSize = Integer.parseInt(request.getParameter("pagesize"));
		Map<String, Object> map = userService.usermap(page, pageSize);
		datatojson(map);
		return null;
	}

	public String userupdate() {
		userService.userupdate(user, deid);
		return null;
	}
	public String userdelete(){
		userService.userdelete(ids);
		return null;
	}
	public String userbeginadd(){
		List<Dept> deptlist = userService.deptlist1();
		ActionContext.getContext().put("deptlist", deptlist);
		return "useradd";
	}
	public String userendadd(){
		userService.useradd(user,deid,roles);
		return null;
	}
	public String  usercheck1(){
		HttpServletResponse response = ServletActionContext.getResponse();
		boolean flg = userService.usercheck1(user.getUsernum());
		if (!flg) {
			try {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print("fail");
				out.flush();
				out.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}
	public String userpermissions(){		
		return "rolelist";
	}
	public String rolelist() {
		HttpServletRequest request = ServletActionContext.getRequest();
		int page = Integer.parseInt(request.getParameter("page"));
		int pageSize = Integer.parseInt(request.getParameter("pagesize"));
		Map<String, Object> map = userService.rolemap(page, pageSize);
		datatojson(map);
		return null;
	}
    
	public String roleupdate(){
		userService.roleupdate(role);
		return null;
	}
	public String roledelete(){
		userService.roledelete(ids);
		return null;
	}
	public String rolebeginadd(){
		return "roleadd";
	}
	public String rolecheck() {
		HttpServletResponse response = ServletActionContext.getResponse();
		System.out.println(role.getRolename());
		boolean flg = userService.rolecheck(role.getRolename());
		if (!flg) {
			try {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print("fail");
				out.flush();
				out.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}
	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public String roleendadd(){
		userService.roleadd(role);
		return null;
	}
}
