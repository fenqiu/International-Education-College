package com.tjpu.service;

import java.util.List;
import java.util.Map;

import com.tjpu.bean.Classes;
import com.tjpu.bean.Student;

public interface StudentService {

	public String classlist();

	public Map<String, Object> studentmap(int page, int pageSize);

	public void stuupdate(Student stu, int classid);

	public void studelete(String ids);

	public List<Classes> classlist1();

	public boolean stucheck(String stuid);

	public void stuadd(Student stu, int classid);

	public Student loginService(String username,String password);

	public void userchangpwd(Student stu);

	public boolean pwdcheck(Integer id, String password);

	public Student loadstubyid(Integer id);

	

}
