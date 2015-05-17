package com.tjpu.service;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tjpu.bean.Classes;
import com.tjpu.bean.Classroom;
import com.tjpu.bean.ClassroomModel;
import com.tjpu.bean.Course;
import com.tjpu.bean.CourseModel;
import com.tjpu.bean.Student;
import com.tjpu.bean.StudentModel;
import com.tjpu.dao.StudentDao;

@Service
public class ClassServiceImpl implements ClassService {
	@Autowired
	StudentDao studentDao;

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
	public boolean classcheck(String classname) {
		// TODO Auto-generated method stub
		List<Classes> havestu = studentDao.classcheck(classname);
		if (havestu.size() > 0) {
			return false;
		}
		return true;
	}

	@Override
	public void classadd(Classes cls) {
		// TODO Auto-generated method stub
		String classname = null;
		String major = null;
		try {
			classname = java.net.URLDecoder.decode(cls.getClassname(), "UTF-8");
			major = java.net.URLDecoder.decode(cls.getMajor(), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		cls.setClassname(classname);
		cls.setMajor(major);
		studentDao.classadd(cls);
	}

	@Override
	public void classupdate(Classes cls) {
		// TODO Auto-generated method stub
		String classname = null;
		String major = null;
		try {
			classname = java.net.URLDecoder.decode(cls.getClassname(), "UTF-8");
			major = java.net.URLDecoder.decode(cls.getMajor(), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		cls.setClassname(classname);
		cls.setMajor(major);
		studentDao.classupdate(cls);
	}

	@Override
	public void classdelete(Integer id) {
		// TODO Auto-generated method stub
		studentDao.classdelete(id);
	}

	@Override
	public Map<String, Object> courselist(int page, int pageSize) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		/*User user = (User) ActionContext.getContext().getSession().get("user");*/
		List<Course> courses = studentDao.loadcourse((page - 1) * pageSize, pageSize/*, user.getRoles().getRolerank()*/);
		long total = courses.size();
		List<CourseModel> coursemodels = new ArrayList<CourseModel>();
		for (Course p : courses) {
			CourseModel model = new CourseModel();
			model.setId(p.getId());
			model.setNum(p.getNum());
			model.setCoursename(p.getCoursename());
			model.setTeacher(p.getTeacher());
			model.setCharacter(p.getCharacter());
			model.setCheckway(p.getCheckway());
			model.setCredits(p.getCredits());
			model.setBeginweeks(p.getBeginweeks());
			model.setEndweeks(p.getEndweeks());
			coursemodels.add(model);
		}
		map.put("Total", total);
		map.put("Rows", coursemodels);
		return map;
	}

	@Override
	public void courseadd(Course course) {
		// TODO Auto-generated method stub
		Integer num = null;
		String coursename = null;
		Integer beginweeks = null;
		Integer endweeks = null;
		String teacher = null;
		Integer credits = null;
		String character = null;
		String checkway = null;
		try {
			num = course.getNum();
			coursename = java.net.URLDecoder.decode(course.getCoursename(), "UTF-8");
			beginweeks = course.getBeginweeks();
			endweeks = course.getEndweeks();
			teacher = java.net.URLDecoder.decode(course.getTeacher(), "UTF-8");
			character = java.net.URLDecoder.decode(course.getCharacter(), "UTF-8");
			checkway = java.net.URLDecoder.decode(course.getCheckway(), "UTF-8");
			credits = course.getCredits();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		course.setNum(num);
		course.setBeginweeks(beginweeks);
		course.setCharacter(character);
		course.setCheckway(checkway);
		course.setCoursename(coursename);
		course.setCredits(credits);
		course.setEndweeks(endweeks);
		course.setTeacher(teacher);
		studentDao.courseadd(course);
	}

	@Override
	public void courseupdate(Course course) {
		// TODO Auto-generated method stub
		Integer num = null;
		String coursename = null;
		Integer beginweeks = null;
		Integer endweeks = null;
		String teacher = null;
		Integer credits = null;
		String character = null;
		String checkway = null;
		try {
			num = course.getNum();
			coursename = java.net.URLDecoder.decode(course.getCoursename(), "UTF-8");
			beginweeks = course.getBeginweeks();
			endweeks = course.getEndweeks();
			teacher = java.net.URLDecoder.decode(course.getTeacher(), "UTF-8");
			character = java.net.URLDecoder.decode(course.getCharacter(), "UTF-8");
			checkway = java.net.URLDecoder.decode(course.getCheckway(), "UTF-8");
			credits = course.getCredits();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		course.setNum(num);
		course.setBeginweeks(beginweeks);
		course.setCharacter(character);
		course.setCheckway(checkway);
		course.setCoursename(coursename);
		course.setCredits(credits);
		course.setEndweeks(endweeks);
		course.setTeacher(teacher);
		studentDao.courseupdate(course);
	}

	@Override
	public void coursedelete(Integer id) {
		// TODO Auto-generated method stub
		studentDao.coursedelete(id);
	}

	@Override
	public boolean coursecheck(String coursename) {
		// TODO Auto-generated method stub
		List<Course> havecourse = studentDao.coursecheck(coursename);
		if (havecourse.size() > 0) {
			return false;
		}
		return true;
	}

	@Override
	public boolean coursecheck1(Integer num) {
		// TODO Auto-generated method stub
		List<Course> havecourse = studentDao.coursecheck1(num);
		if (havecourse.size() > 0) {
			return false;
		}
		return true;
	}

	@Override
	public Map<String, Object> roomlist(int page, int pageSize) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		List<Classroom> room = studentDao.loadroom((page - 1) * pageSize, pageSize);
		long total1 = room.size();
		/*long total = studentDao.totalroom();*/
		List<ClassroomModel> roommodels = new ArrayList<ClassroomModel>();
		for (Classroom s : room) {
			ClassroomModel model = new ClassroomModel();
			model.setId(s.getId());
			model.setNum(s.getNum());
			model.setRoomname(s.getRoomname());
			model.setRoomplace(s.getRoomplace());
			model.setRoomtype(s.getRoomtype());
			model.setRoomcapacity(s.getRoomcapacity());
			model.setRealcapacity(s.getRealcapacity());
			model.setNote(s.getNote());
		    roommodels.add(model);
		}
		map.put("Total", total1);
		map.put("Rows", roommodels);
		return map;
	}

	@Override
	public void roomadd(Classroom room) {
		// TODO Auto-generated method stub
		String  num = null;
		String roomname = null;
		String roomplace = null;
		String roomtype  = null;
		String roomcapacity = null;
		String realcapacity = null;
		String note = null;
		try {
			num = java.net.URLDecoder.decode(room.getNum(),"UTF-8");
			roomname = java.net.URLDecoder.decode(room.getRoomname(),"UTF-8");
			roomplace = java.net.URLDecoder.decode(room.getRoomplace(),"UTF-8");
			roomtype = java.net.URLDecoder.decode(room.getRoomtype(),"UTF-8");
			roomcapacity = java.net.URLDecoder.decode(room.getRoomcapacity(),"UTF-8");
			realcapacity = java.net.URLDecoder.decode(room.getRealcapacity(),"UTF-8");
			note = java.net.URLDecoder.decode(room.getNote(),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		room.setNote(note);
		room.setNum(num);
		room.setRoomcapacity(roomcapacity);
		room.setRealcapacity(realcapacity);
		room.setRoomname(roomname);
		room.setRoomname(roomname);
		room.setRoomplace(roomplace);
		room.setRoomtype(roomtype);
		studentDao.roomadd(room);
	}

	@Override
	public void roomupdate(Classroom room) {
		// TODO Auto-generated method stub
		String  num = null;
		String roomname = null;
		String roomplace = null;
		String roomtype  = null;
		String roomcapacity = null;
		String realcapacity = null;
		String note = null;
		try {
			num = java.net.URLDecoder.decode(room.getNum(),"UTF-8");
			roomname = java.net.URLDecoder.decode(room.getRoomname(),"UTF-8");
			roomplace = java.net.URLDecoder.decode(room.getRoomplace(),"UTF-8");
			roomtype = java.net.URLDecoder.decode(room.getRoomtype(),"UTF-8");
			roomcapacity = java.net.URLDecoder.decode(room.getRoomcapacity(),"UTF-8");
			realcapacity = java.net.URLDecoder.decode(room.getRealcapacity(),"UTF-8");
			note = java.net.URLDecoder.decode(room.getNote(),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		room.setNote(note);
		room.setNum(num);
		room.setRoomcapacity(roomcapacity);
		room.setRealcapacity(realcapacity);
		room.setRoomname(roomname);
		room.setRoomplace(roomplace);
		room.setRoomtype(roomtype);
		studentDao.roomupdate(room);
	}

	@Override
	public void roomdelete(Integer id) {
		// TODO Auto-generated method stub
		studentDao.roomdelete(id);
	}

	@Override
	public boolean roomcheck(String num) {
		// TODO Auto-generated method stub
		List<Classroom> haveroom = studentDao.roomcheck(num);
		if (haveroom.size() > 0) {
			return false;
		}
		return true;
	}

	List<Student> stus = new ArrayList<Student>();

	@Override
	public List<Student> loadstulistbyclassid(int classid) {
		// TODO Auto-generated method stub		
		stus.clear();
		stus = studentDao.loadstubyclassid(classid);
		return null;
	}
	@Override
	public Map<String, Object> classstumap(int page, int pageSize) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		long total = stus.size();
		List<StudentModel> stumodels = new ArrayList<StudentModel>();
		for (int i = (page - 1) * pageSize; i < page * pageSize; i++) {
			if (i < stus.size()) {
				StudentModel model = new StudentModel();
				try {
					model.setClassid(stus.get(i).getClasses().getId());
				} catch (Exception e) {
					model.setClassid(0);
				}
				model.setId(stus.get(i).getId());
				model.setPassword(stus.get(i).getPassword());
				model.setStusex(stus.get(i).getSex());
				model.setStuid(stus.get(i).getStuid());
				model.setStuname(stus.get(i).getStuname());
				model.setEnname(stus.get(i).getEnname());
				model.setEnsuiname(stus.get(i).getEnsuiname());
				model.setNation(stus.get(i).getNation());
				model.setPassport(stus.get(i).getPassport());
				model.setRoomplace(stus.get(i).getRoomplace());
				model.setTelephone(stus.get(i).getTelephone());
				stumodels.add(model);
			} else {
				break;
			}
		}
		map.put("Total", total);
		map.put("Rows", stumodels);
		return map;
	}

	@Override
	public List<Classroom> roomsearch(Classroom room) {
		// TODO Auto-generated method stub
		List<Classroom> classroom = studentDao.roomsearch(room);
		return classroom;
	}
	
}
