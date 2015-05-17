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
import com.tjpu.bean.Classes;
import com.tjpu.bean.Course;
import com.tjpu.bean.Student;
import com.tjpu.bean.User;
import com.tjpu.service.StudentService;

@Controller
public class StudentAction {
	@Autowired
	StudentService studentService;
    private Student stu;
    private Classes cls;
    private Course course;
    public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}
	private String ids;
    public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}
	private int classid;
    public int getClassid() {
		return classid;
	}

	public void setClassid(int classid) {
		this.classid = classid;
	}
	
	public Student getStu() {
		return stu;
	}

	public void setStu(Student stu) {
		this.stu = stu;
	}

	public Classes getCls() {
		return cls;
	}

	public void setCls(Classes cls) {
		this.cls = cls;
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

	public String stumanage() {
		String classlist = studentService.classlist();
		ActionContext.getContext().put("classlist", classlist);
		return "stulist";
	}

	public String stulist() {
		HttpServletRequest request = ServletActionContext.getRequest();
		int page = Integer.parseInt(request.getParameter("page"));
		int pageSize = Integer.parseInt(request.getParameter("pagesize"));
		Map<String, Object> map = studentService.studentmap(page, pageSize);
		datatojson(map);
		return null;
	}
    
	public String stuupdate(){
		studentService.stuupdate(stu, classid/* ,major */);
		return null;
	}
	public String studelete(){
		studentService.studelete(ids);
		return null;
	}
	public String stubeginadd(){
		List<Classes> classlist = studentService.classlist1();
		ActionContext.getContext().put("classlist", classlist);
		return "stuadd";
	}
	public String stucheck(){
		HttpServletResponse response = ServletActionContext.getResponse();
		boolean flg = studentService.stucheck(stu.getStuid());
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
	public String stuendadd(){
		studentService.stuadd(stu,classid);
		return null;
	}
	public String stubaseinfo(){	
		User user = (User) ActionContext.getContext().getSession().get("user");
        if (user.getRoles().getId()==4) {
        	Student student = studentService.loadstubyid(user.getId());
    		ActionContext.getContext().put("student", student);
		}else {
			ActionContext.getContext().put("message", "该基本信息只显示学生！！");
		}
		
		return "stubaseinfo";
	}
    public String changepwd(){
    	ActionContext.getContext().put("userid", stu.getId());
		return "changepwd";
    }
    public String pwdcheck(){
		HttpServletResponse response = ServletActionContext.getResponse();
		boolean flg = studentService.pwdcheck(stu.getId(),stu.getPassword());
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
	public String stuchangepwd(){
		studentService.userchangpwd(stu);
		return null;
	}
    
    
}
