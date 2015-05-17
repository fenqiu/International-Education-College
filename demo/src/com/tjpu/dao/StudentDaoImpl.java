package com.tjpu.dao;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.tjpu.bean.Classes;
import com.tjpu.bean.Classroom;
import com.tjpu.bean.Course;
import com.tjpu.bean.Student;

@Repository
@Transactional
public class StudentDaoImpl implements StudentDao {
	@Autowired
	SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<Student> loginDao(String stuname, String password) {
		// TODO Auto-generated method stub
		String queryString = "from Student u  where  u.stuid=:uname and u.password=:pwd  ";
		Query query = sessionFactory.getCurrentSession().createQuery(queryString);
		query.setString("uname", stuname);
		query.setString("pwd",password );
		//MD5.generate(password);
		List<Student> loginuser = (List<Student>) query.list();
		return loginuser;
	}
		
	@SuppressWarnings("unchecked")
	@Override
	@Transactional(propagation = Propagation.NOT_SUPPORTED)
	public List<Classes> loadclasses() {
		// TODO Auto-generated method stub
		String queryString = "from Classes c";
		Query query = sessionFactory.getCurrentSession().createQuery(queryString);
		List<Classes> classes = (List<Classes>) query.list();
		return classes;
	}
	/*学生列表*/
	@SuppressWarnings("unchecked")
	@Override
	public List<Student> loadstudents(int pageNumber, int pageSize) {
		// TODO Auto-generated method stub
		String queryString = "from Student s left join fetch s.classes";
		Query query = sessionFactory.getCurrentSession().createQuery(queryString);
		query.setFirstResult(pageNumber);
		query.setMaxResults(pageSize);
		List<Student> stu = (List<Student>) query.list();
		return stu;
	}
	/*学生总数*/
	@Override
	public long totalstu() {
		// TODO Auto-generated method stub
		String hql = "select count(*) from Student";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		long total = ((Number) query.uniqueResult()).intValue();
		return total;
	}
	/*学生更新*/
	@Override
	public void stuupdate(Student stu, int classid) {
		// TODO Auto-generated method stub
		Classes cls = (Classes) sessionFactory.getCurrentSession().load(Classes.class, classid);
		Student stu1 = (Student) sessionFactory.getCurrentSession().load(Student.class, stu.getId());
		stu1.setClasses(cls);
		stu1.setStuname(stu.getStuname());
		stu1.setStuid(stu.getStuid());
		stu1.setPassword(stu.getPassword());
		stu1.setSex(stu.getSex());
		sessionFactory.getCurrentSession().update(stu1);
	}
    /*学生删除*/
	@Override
	public void studelete(int stuid) {
		// TODO Auto-generated method stub	
		Student stu = (Student) sessionFactory.getCurrentSession().load(Student.class, stuid);		
		stu.setClasses(null);
		sessionFactory.getCurrentSession().delete(stu);
	}
	/*学生查重*/
	@SuppressWarnings("unchecked")
	@Override
	public List<Student> stucheck(String stuid) {
		// TODO Auto-generated method stub
		String queryString = "from Student s left join fetch s.classes where s.stuid=:num";
		Query query = sessionFactory.getCurrentSession().createQuery(queryString);
		query.setString("num", stuid);
		List<Student> stu = (List<Student>) query.list();
		return stu;
	}
	@Override
	public Classes loadclassbyid(int classid) {
		// TODO Auto-generated method stub
		Classes cls = (Classes) sessionFactory.getCurrentSession().load(Classes.class, classid);
		return cls;
	}
	@Override
	public void stuadd(Student stu) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(stu);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Classes> classcheck(String classname) {
		// TODO Auto-generated method stub
		String queryString = "from Classes c where c.classname=:num";
		Query query = sessionFactory.getCurrentSession().createQuery(queryString);
		query.setString("num", classname);
		List<Classes> stuclass = (List<Classes>) query.list();
		return stuclass;
	}
	@Override
	public void classadd(Classes cls) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(cls);
	}
	@Override
	public void classupdate(Classes cls) {
		// TODO Auto-generated method stub
		Classes cls1 = (Classes) sessionFactory.getCurrentSession().load(Classes.class, cls.getId());
		cls1.setClassname(cls.getClassname());
		cls1.setMajor(cls.getMajor());
		sessionFactory.getCurrentSession().update(cls1);
	}
	@Override
	public void classdelete(Integer id) {
		// TODO Auto-generated method stub
		Classes cls = (Classes)sessionFactory.getCurrentSession().load(Classes.class,id);
		sessionFactory.getCurrentSession().delete(cls);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Course> loadcourse(int i, int pageSize/*, Integer role*/) {
		// TODO Auto-generated method stub
		String queryString = "from Course s ";
		Query query = sessionFactory.getCurrentSession().createQuery(queryString);
		query.setFirstResult(i);
		query.setMaxResults(pageSize);
		List<Course> course = (List<Course>) query.list();
		return course;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Course> coursecheck(String coursename) {
		// TODO Auto-generated method stub
		String queryString = "from Course c where c.coursename=:coursename";
		Query query = sessionFactory.getCurrentSession().createQuery(queryString);
		query.setString("coursename", coursename);
		List<Course> course = (List<Course>) query.list();
		return course;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Course> coursecheck1(Integer num) {
		// TODO Auto-generated method stub
		String queryString = "from Course c where c.num=:num";
		Query query = sessionFactory.getCurrentSession().createQuery(queryString);
		query.setInteger("num", num);
		List<Course> course = (List<Course>) query.list();
		return course;
	}
	@Override
	public void courseadd(Course course) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(course);
	}
	@Override
	public void courseupdate(Course course) {
		// TODO Auto-generated method stub
		Course course1 = (Course)sessionFactory.getCurrentSession().load(Course.class, course.getId());
		course1.setBeginweeks(course.getBeginweeks());
		course1.setCharacter(course.getCharacter());
		course1.setCheckway(course.getCheckway());
		course1.setCoursename(course.getCoursename());
		course1.setCredits(course.getCredits());
		course1.setEndweeks(course.getEndweeks());
		course1.setNum(course.getNum());
		course1.setTeacher(course.getTeacher());
		sessionFactory.getCurrentSession().update(course1);
	}
	@Override
	public void coursedelete(Integer id) {
		// TODO Auto-generated method stub
		Course course = (Course)sessionFactory.getCurrentSession().load(Course.class, id);
		sessionFactory.getCurrentSession().delete(course);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Classroom> loadroom(int i, int pageSize) {
		// TODO Auto-generated method stub
		String queryString = "from Classroom ";
		Query query = sessionFactory.getCurrentSession().createQuery(queryString);
		query.setFirstResult(i);
		query.setMaxResults(pageSize);
		List<Classroom> room = (List<Classroom>) query.list();
		return room;
	}
	@Override
	public void roomadd(Classroom room) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(room);
	}
	@Override
	public void roomupdate(Classroom room) {
		// TODO Auto-generated method stub
		Classroom room1 = (Classroom)sessionFactory.getCurrentSession().load(Classroom.class, room.getId());
		room1.setNote(room.getNote());
		room1.setNum(room.getNum());
		room1.setRoomcapacity(room.getRoomcapacity());
		room1.setRealcapacity(room.getRealcapacity());
		room1.setRoomname(room.getRoomname());
		room1.setRoomplace(room.getRoomplace());
		room1.setRoomtype(room.getRoomtype());
		sessionFactory.getCurrentSession().update(room1);
	}
	@Override
	public void roomdelete(Integer id) {
		// TODO Auto-generated method stub
		Classroom room1 = (Classroom)sessionFactory.getCurrentSession().load(Classroom.class, id);
	    sessionFactory.getCurrentSession().delete(room1);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Classroom> roomcheck(String num) {
		// TODO Auto-generated method stub
		String queryString="from Classroom c where c.num =:num";
		Query query = sessionFactory.getCurrentSession().createQuery(queryString);
		query.setString("num", num);
		List<Classroom> room = (List<Classroom>)query.list();
		return room;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Student> loadstubyclassid(int classid) {
		// TODO Auto-generated method stub
		String queryString = "from Student s left join fetch s.classes c where c.id=:id order by s.id";
		Query query = sessionFactory.getCurrentSession().createQuery(queryString);
		query.setInteger("id", classid);
		List<Student> stus = (List<Student>) query.list();
		return stus;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Classroom> roomsearch(Classroom room) {
		// TODO Auto-generated method stub
		List<Classroom> classrooms = new ArrayList<Classroom>();
		String roomname = room.getRoomname();
		String roomplace = room.getRoomplace();
		if (roomname.length()!=0) {
			if (roomplace.length()!=0) {
				String querystrinString ="from Classroom c where c.roomname=:roomname and c.roomplace =:roomplace";
				Query query = sessionFactory.getCurrentSession().createQuery(querystrinString);
				query.setString("roomname", roomname);
				query.setString("roomplace", roomplace);
				classrooms = (List<Classroom>)query.list();				
			}else {
				String querystrinString ="from Classroom c where c.roomname=:roomname ";
				Query query = sessionFactory.getCurrentSession().createQuery(querystrinString);
				query.setString("roomname", roomname);
				classrooms = (List<Classroom>)query.list();
			}
		}else {
			String querystrinString ="from Classroom c where  c.roomplace =:roomplace";
			Query query = sessionFactory.getCurrentSession().createQuery(querystrinString);
			query.setString("roomplace", roomplace);
			classrooms = (List<Classroom>)query.list();		
		}
		return classrooms;
	}
	@Override
	public void userchangpwd(Student user) {
		// TODO Auto-generated method stub
		Student user1 = (Student) sessionFactory.getCurrentSession().load(Student.class, user.getId());
		user1.setPassword(user.getPassword());		
		sessionFactory.getCurrentSession().update(user1);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Student> pwdcheck(Integer id, String password) {
		// TODO Auto-generated method stub
		String queryString = "from Student u  where u.id=:id and u.password=:password ";
		Query query = sessionFactory.getCurrentSession().createQuery(queryString);
		query.setString("password", password);
		query.setInteger("id", id);
		List<Student> user = (List<Student>) query.list();
		return user;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Student loadstubyid(Integer id) {
		// TODO Auto-generated method stub
		String querString = "from Student s where s.id=:id";
		Query query = sessionFactory.getCurrentSession().createQuery(querString);
		query.setInteger("id", id);
		List<Student> student = (List<Student>)query.list();
		return student.get(0);
	}

}
