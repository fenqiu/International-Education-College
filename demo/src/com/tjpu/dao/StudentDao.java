package com.tjpu.dao;

import java.util.List;

import com.tjpu.bean.Classes;
import com.tjpu.bean.Classroom;
import com.tjpu.bean.Course;
import com.tjpu.bean.Student;
import com.tjpu.bean.User;

public interface StudentDao {

	public List<Classes> loadclasses();

	public List<Student> loadstudents(int pageNumber, int pageSize);

	public long totalstu();

	public void stuupdate(Student stu, int classid);

	public void studelete(int stuid);

	public List<Student> stucheck(String stuid);

	public Classes loadclassbyid(int classid);

	public void stuadd(Student stu);

	public List<Classes> classcheck(String classname);

	public void classadd(Classes cls);

	public void classupdate(Classes cls);

	public void classdelete(Integer id);

	public List<Course> loadcourse(int i, int pageSize/*, Integer role*/);

	public List<Course> coursecheck(String coursename);

	public List<Course> coursecheck1(Integer num);

	public void courseadd(Course course);

	public void courseupdate(Course course);

	public void coursedelete(Integer id);

	public List<Classroom> loadroom(int i, int pageSize);

	public void roomadd(Classroom room);

	public void roomupdate(Classroom room);

	public void roomdelete(Integer id);

	public List<Classroom> roomcheck(String num);

	public List<Student> loadstubyclassid(int classid);

	public List<Classroom> roomsearch(Classroom room);

	public List<Student> loginDao(String stuname, String password);

	public List<Student> pwdcheck(Integer id, String password);

	public void userchangpwd(Student user);

	public Student loadstubyid(Integer id);

}
