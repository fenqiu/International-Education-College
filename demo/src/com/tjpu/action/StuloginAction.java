package com.tjpu.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.tjpu.bean.Student;
import com.tjpu.service.StudentService;

@Controller
public class StuloginAction {
	@Autowired
	StudentService studentService;
	private Student student;

	public String execute() throws Exception {
		// TODO Auto-generated method stub
		if (student == null) {
			ActionContext.getContext().put("message", "您输入的用户名或密码错误！");
			return "loginfails";
		} else {
			Student u = studentService.loginService(student.getStuid(),student.getPassword());
			student = null;
			if (u != null) {
				ActionContext.getContext().getSession().put("student", u);
				ActionContext.getContext().put("message", "恭喜你登录成功！");
				return "loginsuccess";
			} else {
				ActionContext.getContext().put("message", "您输入的用户名或密码错误！");
				return "loginfails";
			}
		}
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}
	
}
