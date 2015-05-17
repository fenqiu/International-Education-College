package com.tjpu.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.tjpu.bean.Role;
import com.tjpu.bean.Student;
import com.tjpu.bean.User;
import com.tjpu.service.StudentService;
import com.tjpu.service.UserService;

@Controller
public class LoginAction {
	@Autowired
	UserService userService;
	@Autowired
	StudentService studentService;
	private User user;
	private Role role;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		if (user == null) {
			ActionContext.getContext().put("message", "您输入的用户名或密码错误！");
			return "loginfail";
		} else {
			if (user.getRoles().getId()==4) {
				Student student = studentService.loginService(user.getUsernum(), user.getPassword());
				Role roles = userService.loadrolebyid(user.getRoles().getId());
				user = null;
				if (student != null) {
					User users = new User();
					users.setRealname(student.getStuname());
					users.setRoles(roles);
					users.setId(student.getId());
					ActionContext.getContext().getSession().put("user", users);					
					return "loginsuc";
				} else {
					ActionContext.getContext().put("message", "您输入的用户名或密码错误！");
					return "loginfail";
				}
			}else {
				User u = userService.loginService(user);				
				user = null;
				if (u != null) {
					ActionContext.getContext().getSession().put("user", u);
					return "loginsuc";
				} else {
					ActionContext.getContext().put("message", "您输入的用户名或密码错误！");
					return "loginfail";
				}
			}
							
		}
	}
	
	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}
	
	
}
