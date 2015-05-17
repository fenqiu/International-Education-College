package com.tjpu.service;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tjpu.bean.Classes;
import com.tjpu.bean.Student;
import com.tjpu.bean.StudentModel;
import com.tjpu.dao.StudentDao;

@Service
public class StudentServiceImpl implements StudentService {
	@Autowired
	StudentDao studentDao;

	@Override
	public Student loginService(String username,String password) {
		// TODO Auto-generated method stub
		Student student1 = null;
		List<Student> list = studentDao.loginDao(username,password);
		if (list.size() > 0 && list != null) {
			student1 = list.get(0);
		}
		return student1;
	}
	
	@Override
	public String classlist() {
		// TODO Auto-generated method stub
		List<Classes> classes = studentDao.loadclasses();
		String classlist = "";
		int i = 1;
		for (Classes c : classes) {
			String s = "{\"Classid\":" + c.getId() + "," + "\"Classname\":" + "\"" + c.getClassname() + "\"," + "\"Classmajor\":" + "\"" + c.getMajor() + "\"}";
			if (i < classes.size()) {
				classlist += s + ",";
			} else {
				classlist += s;
			}
			i++;
		}
		return classlist;
	}

	@Override
	public Map<String, Object> studentmap(int page, int pageSize) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		List<Student> stus = studentDao.loadstudents((page - 1) * pageSize, pageSize);
		long total = studentDao.totalstu();
		List<StudentModel> stumodels = new ArrayList<StudentModel>();
		for (Student s : stus) {
			StudentModel model = new StudentModel();
			try {
				model.setClassid(s.getClasses().getId());
			} catch (Exception e) {
				model.setClassid(0);
			}
			model.setId(s.getId());
			model.setPassword(s.getPassword());
			model.setStusex(s.getSex());
			model.setStuid(s.getStuid());
			model.setStuname(s.getStuname());
			model.setEnname(s.getEnname());
			model.setEnsuiname(s.getEnsuiname());
			model.setNation(s.getNation());
			model.setPassport(s.getPassport());
			model.setRoomplace(s.getRoomplace());
			model.setTelephone(s.getTelephone());
			stumodels.add(model);
		}
		map.put("Total", total);
		map.put("Rows", stumodels);
		return map;
	}

	@Override
	public void stuupdate(Student stu, int classid) {
		// TODO Auto-generated method stub
		String stuname = null;
		String stusex = null;
		String stunum = null;
		String stupassword = null;
		try {
			stunum = java.net.URLDecoder.decode(stu.getStuid(), "UTF-8");
			stuname = java.net.URLDecoder.decode(stu.getStuname(), "UTF-8");
			stusex = java.net.URLDecoder.decode(stu.getSex(), "UTF-8");
			stupassword = java.net.URLDecoder.decode(stu.getPassword(), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		stu.setStuname(stuname);
		stu.setSex(stusex);
		stu.setStuid(stunum);
		stu.setPassword(stupassword);
		studentDao.stuupdate(stu, classid);
	}

	@Override
	public void studelete(String ids) {
		// TODO Auto-generated method stub
		StringTokenizer fenxi = new StringTokenizer(ids, ",");
		while (fenxi.hasMoreTokens()) {
			String sid = fenxi.nextToken();
			int stuid = Integer.parseInt(sid);
			studentDao.studelete(stuid);
		}
	}

	@Override
	public List<Classes> classlist1() {
		// TODO Auto-generated method stub
		List<Classes> classlist = studentDao.loadclasses();
		return classlist;
	}

	@Override
	public boolean stucheck(String stuid) {
		// TODO Auto-generated method stub
		List<Student> havestu = studentDao.stucheck(stuid);
		if (havestu.size() > 0) {
			return false;
		}
		return true;
	}

	@Override
	public void stuadd(Student stu, int classid) {
		// TODO Auto-generated method stub
		String stuname = null;
		String stusex = null;
		try {
			stuname = java.net.URLDecoder.decode(stu.getStuname(), "UTF-8");
			stusex = java.net.URLDecoder.decode(stu.getSex(), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		stu.setPassword("123456");
		stu.setStuname(stuname);
		stu.setSex(stusex);
		Classes cls = studentDao.loadclassbyid(classid);
		stu.setClasses(cls);
		studentDao.stuadd(stu);
	}

	@Override
	public boolean pwdcheck(Integer id, String password) {
		// TODO Auto-generated method stub
		List<Student> user = studentDao.pwdcheck(id,password);
		if (user.size() > 0) {
			return true;
		}
		return false;
	}
	@Override
	public void userchangpwd(Student user) {
		// TODO Auto-generated method stub
	    String password = null;
	    password = user.getPassword();
	    user.setPassword(password);
	    studentDao.userchangpwd(user);
	}

	@Override
	public Student loadstubyid(Integer id) {
		// TODO Auto-generated method stub
		Student student = studentDao.loadstubyid(id);
		return student;
	}

	

}
