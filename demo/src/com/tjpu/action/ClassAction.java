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
import com.tjpu.bean.Classroom;
import com.tjpu.bean.Course;
import com.tjpu.service.ClassService;

@Controller
public class ClassAction {
	@Autowired
	ClassService classService;
	private Classes cls;
	private Classroom room;
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

	public String classmanage() {
		String classlist = classService.classlist();
		ActionContext.getContext().put("classlist", classlist);
		return "classlist";
	}

	public String classstulist() {
		classService.loadstulistbyclassid(cls.getId());
		return "classstulist";
	}
	public String loadclassstu(){
		HttpServletRequest request = ServletActionContext.getRequest();
		int page = Integer.parseInt(request.getParameter("page"));
		int pageSize = Integer.parseInt(request.getParameter("pagesize"));
		Map<String, Object> map = classService.classstumap(page, pageSize);
		datatojson(map);
		return null;
	}
	public String classbeginadd() {
		return "classadd";
	}

	public String classcheck() {
		HttpServletResponse response = ServletActionContext.getResponse();
		boolean flg = classService.classcheck(cls.getClassname());
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

	public String classendadd() {
		classService.classadd(cls);
		return null;
	}

	public String classupdate() {
		classService.classupdate(cls);
		return null;
	}

	public String classdelete() {
		classService.classdelete(cls.getId());
		return null;
	}
	public Classroom getRoom() {
		return room;
	}

	public void setRoom(Classroom room) {
		this.room = room;
	}
	public String coursemanage() {
		String coursecredit = "{\"Coursecredit\":" + "\"" + 1 + "\"}" + "," + "{\"Coursecredit\":" + "\"" + 2 + "\"}" + "," + "{\"Coursecredit\":" + "\"" + 3 + "\"}" + "," + "{\"Coursecredit\":" + "\"" + 4 + "\"}" + "," + "{\"Coursecredit\":" + "\""
				+ 5 + "\"}" + "," + "{\"Coursecredit\":" + "\"" + 6 + "\"}" + "," + "{\"Coursecredit\":" + "\"" + 7 + "\"}";
		String char1 = "必修", char2 = "现选", char3 = "任选";
		String character = "{\"Coursecharacter\":" + "\"" + char1 + "\"}" + "," + "{\"Coursecharacter\":" + "\"" + char2 + "\"}" + "," + "{\"Coursecharacter\":" + "\"" + char3 + "\"}";
		String s1 = "集中式", s2 = "非集中式";
		String checkway = "{\"Coursecheckway\":" + "\"" + s1 + "\"}" + "," + "{\"Coursecheckway\":" + "\"" + s2 + "\"}";
		ActionContext.getContext().put("coursecredit", coursecredit);
		ActionContext.getContext().put("character", character);
		ActionContext.getContext().put("checkway", checkway);
		return "courselist";
	}

	public String courselist() {
		HttpServletRequest request = ServletActionContext.getRequest();
		int page = Integer.parseInt(request.getParameter("page"));
		int pageSize = Integer.parseInt(request.getParameter("pagesize"));
		Map<String, Object> map = classService.courselist(page, pageSize);
		datatojson(map);
		return null;
	}

	public String coursebeginadd() {
		return "courseadd";
	}

	public String coursecheck() {
		HttpServletResponse response = ServletActionContext.getResponse();
		boolean flg = classService.coursecheck(course.getCoursename());
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

	public String coursecheck1() {
		HttpServletResponse response = ServletActionContext.getResponse();
		boolean flg = classService.coursecheck1(course.getNum());
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

	public String courseendadd() {
		classService.courseadd(course);
		return null;
	}

	public String courseupdate() {
		classService.courseupdate(course);
		return null;
	}

	public String coursedelete() {
		classService.coursedelete(course.getId());
		return null;
	}
	public String clsroommanage(){
		return "classroomlist";
	}
	public String roomlist() {
		HttpServletRequest request = ServletActionContext.getRequest();
		int page = Integer.parseInt(request.getParameter("page"));
		int pageSize = Integer.parseInt(request.getParameter("pagesize"));
		Map<String, Object> map = classService.roomlist(page, pageSize);
		datatojson(map);
		return null;
	}

	public String roombeginadd() {
		return "roomadd";
	}

	public String roomcheck() {
		HttpServletResponse response = ServletActionContext.getResponse();
		boolean flg = classService.roomcheck(room.getNum());
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
	public String  roomsearch(){
		List<Classroom> classroom = classService.roomsearch(room);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		StringBuffer strb=new StringBuffer(); 
		strb.append("<table id='resultlist' >");
		strb.append("<tr class='resultlist_tr'>");
		strb.append("<td>"+"名称"+"</td>"); 
		strb.append("<td>"+"位置"+"</td>"); 
		strb.append("<td>"+"标准容量(人)"+"</td>"); 
		strb.append("<td>"+"实际容量（人）"+"</td>");
		strb.append("<td widt='50'>"+"备注"+"</td>");
		strb.append("</tr>"); 
		  for(int i=0;i<classroom.size();i++){  
			strb.append("<tr>");
		    strb.append("<td>"+classroom.get(i).getRoomname()+"</td>");
		    strb.append("<td>"+classroom.get(i).getRoomplace()+"</td>");
		    strb.append("<td>"+classroom.get(i).getRoomcapacity()+"</td>");
		    strb.append("<td>"+classroom.get(i).getRealcapacity()+"</td>");
		    strb.append("<td>"+classroom.get(i).getNote()+"</td>");
		    strb.append("</tr>"); 		    
		   }  	
		  strb.append("</table>"); 	  
		   try {
			PrintWriter out = response.getWriter();
			out.write(strb.toString());
			 out.flush();    //刷新打印流
		     out.close();    //关闭
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		   return null;
	}
    
	public String clsroomload(){
		
		return "clsroomload";
	}
	
	public String roomendadd() {
		classService.roomadd(room);
		return null;
	}

	public String roomupdate() {
		classService.roomupdate(room);
		return null;
	}

	public String roomdelete() {
		classService.roomdelete(room.getId());
		return null;
	}
	
}
