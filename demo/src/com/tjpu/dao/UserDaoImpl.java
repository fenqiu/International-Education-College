package com.tjpu.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.tjpu.bean.Dept;
import com.tjpu.bean.MD5;
import com.tjpu.bean.Role;
import com.tjpu.bean.User;

@Repository
@Transactional
public class UserDaoImpl implements UserDao {
	@Autowired
	SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	@Transactional(propagation = Propagation.NOT_SUPPORTED)
	public List<User> loginDao(String username, String password,Integer role) {
		// TODO Auto-generated method stub
		/*left join fetch u.roles r where r.rolerank=:rolerank and */
		String queryString = "from User u left join fetch u.roles r where r.id=:id and u.usernum=:uname and u.password=:pwd  ";
		Query query = sessionFactory.getCurrentSession().createQuery(queryString);
		query.setString("uname", username);
		query.setString("pwd",password );
		//MD5.generate(password);
		query.setInteger("id", role);
		List<User> loginuser = (List<User>) query.list();
		return loginuser;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> usercheck(String username) {
		// TODO Auto-generated method stub
		String queryString = "from User u  where u.username=:uname ";
		Query query = sessionFactory.getCurrentSession().createQuery(queryString);
		query.setString("uname", username);
		List<User> user = (List<User>) query.list();
		return user;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<User> pwdcheck(Integer id, String password) {
		// TODO Auto-generated method stub
		String queryString = "from User u  where u.id=:id and u.password=:password ";
		Query query = sessionFactory.getCurrentSession().createQuery(queryString);
		query.setString("password", password);
		query.setInteger("id", id);
		List<User> user = (List<User>) query.list();
		return user;
	}
	@Override
	public void userchangpwd(User user) {
		// TODO Auto-generated method stub
		User user1 = (User) sessionFactory.getCurrentSession().load(User.class, user.getId());
		user1.setPassword(user.getPassword());		
		sessionFactory.getCurrentSession().update(user1);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<User> usercheck1(String usernum) {
		// TODO Auto-generated method stub
		String queryString = "from User u  where  u.usernum =:num ";/*u.username=:uname and*/
		Query query = sessionFactory.getCurrentSession().createQuery(queryString);
		/*query.setString("uname", username);*/
		query.setString("num", usernum);
		List<User> user = (List<User>) query.list();
		return user;
	}

	@Override
	public void useradd(User u) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(u);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Dept> loaddepts() {
		// TODO Auto-generated method stub
		String queryString = "from Dept d";
		Query query = sessionFactory.getCurrentSession().createQuery(queryString);
		List<Dept> dept = (List<Dept>) query.list();
		return dept;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> loadusers(int i, int pageSize) {
		// TODO Auto-generated method stub
		String queryString = "from User u ";
		Query query = sessionFactory.getCurrentSession().createQuery(queryString);
		query.setFirstResult(i);
		query.setMaxResults(pageSize);
		List<User> user = (List<User>) query.list();
		return user;
	}

	@Override
	public long totalstu() {
		// TODO Auto-generated method stub
		String hql = "select count(*) from User";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		long total = ((Number) query.uniqueResult()).intValue();
		return total;
	}

	@Override
	public void userupdate(User user, int deptid) {
		// TODO Auto-generated method stub
		Dept dept = (Dept) sessionFactory.getCurrentSession().load(Dept.class, deptid);
		User user1 = (User) sessionFactory.getCurrentSession().load(User.class, user.getId());
		user1.setDepts(dept);
		user1.setEmail(user.getEmail());
		user1.setPassword(user.getPassword());
		user1.setRealname(user.getRealname());
		user1.setSex(user.getSex());
		user1.setTelephone(user.getTelephone());
		user1.setUsername(user.getUsername());
		sessionFactory.getCurrentSession().update(user1);
	}

	@Override
	public void userdelete(int userid) {
		// TODO Auto-generated method stub
		User user = (User) sessionFactory.getCurrentSession().load(User.class, userid);		
		user.setDepts(null);
		sessionFactory.getCurrentSession().delete(user);
	}

	@Override
	public Dept loaddeptbyid(int deptid) {
		// TODO Auto-generated method stub
		Dept dept = (Dept) sessionFactory.getCurrentSession().load(Dept.class, deptid);
		return dept;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Role loadrolebyid(int roles) {
		// TODO Auto-generated method stub
		String queryString = "from Role r where r.id=:roles";
		Query query= sessionFactory.getCurrentSession().createQuery(queryString);
		query.setInteger("roles", roles);
		List<Role> roles2 = (List<Role>)query.list();
		Role role = roles2.get(0);
		return role;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Role> loadroles(int i, int pageSize) {
		// TODO Auto-generated method stub
       String querString = "from Role r";
       Query query = sessionFactory.getCurrentSession().createQuery(querString);
       List<Role> roles = (List<Role>) query.list();
       return roles;
	}

	@Override
	public void roleadd(Role role) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(role);
	}

	@Override
	public void roledelete(int roleid) {
		// TODO Auto-generated method stub
		Role role = (Role) sessionFactory.getCurrentSession().load(Role.class, roleid);
		//role.setMenus(null);
		for (User u : role.getUsers()) {
			u.setRoles(null);
		}
		sessionFactory.getCurrentSession().delete(role);
	}

	@Override
	public void roleupdate(Role role) {
		// TODO Auto-generated method stub
		Role role1 = (Role)sessionFactory.getCurrentSession().load(Role.class, role.getId());
		role1.setCreatedate(role.getCreatedate());
		role1.setRoledescribe(role.getRoledescribe());
		role1.setRolename(role.getRolename());
		role1.setRolerank(role.getRolerank());
		sessionFactory.getCurrentSession().update(role1);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Role> rolecheck(String rolename) {
		// TODO Auto-generated method stub
		String queryString = "from Role r  where r.rolename=:name";
		Query query = sessionFactory.getCurrentSession().createQuery(queryString);
		query.setString("name", rolename);
		List<Role> role = (List<Role>) query.list();
		return role;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Role> loadroles() {
		// TODO Auto-generated method stub
		String queryString = "from Role r";
		Query query = sessionFactory.getCurrentSession().createQuery(queryString);
		List<Role> roles = (List<Role>) query.list();
		return roles;
	}

	

}
