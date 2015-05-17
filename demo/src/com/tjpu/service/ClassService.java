package com.tjpu.service;

import java.util.List;
import java.util.Map;

import com.tjpu.bean.Classes;
import com.tjpu.bean.Classroom;
import com.tjpu.bean.Course;
import com.tjpu.bean.Student;

public interface ClassService {
	
	public boolean classcheck(String classname);

	public String classlist();

	public void classadd(Classes cls);

	public void classupdate(Classes cls);

	public void classdelete(Integer id);

	public Map<String, Object> courselist(int page, int pageSize);

	public void courseadd(Course course);

	public void courseupdate(Course course);

	public void coursedelete(Integer id);

	public boolean coursecheck(String coursename);

	public boolean coursecheck1(Integer num);

	public Map<String, Object> roomlist(int page, int pageSize);

	public void roomadd(Classroom room);

	public void roomupdate(Classroom room);

	public void roomdelete(Integer id);

	public boolean roomcheck(String num);

	public Map<String, Object> classstumap(int page, int pageSize);

	public List<Student> loadstulistbyclassid(int classid);

	public List<Classroom> roomsearch(Classroom room);

	



}
