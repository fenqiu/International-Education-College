package com.tjpu.service;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tjpu.bean.Dept;
import com.tjpu.bean.Role;
import com.tjpu.bean.RoleModel;
import com.tjpu.bean.User;
import com.tjpu.bean.UserModel;
import com.tjpu.dao.UserDao;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	UserDao userDao;

	@Override
	public User loginService(User user) {
		// TODO Auto-generated method stub
		User user1 = null;
		List<User> list = userDao.loginDao(user.getUsernum(), user.getPassword(),user.getRoles().getId());
		if (list.size() > 0 && list != null) {
			user1 = list.get(0);
		}
		return user1;
	}

	@Override
	public boolean usercheck(String username) {
		// TODO Auto-generated method stub
		List<User> user = userDao.usercheck(username);
		if (user.size() > 0) {
			return false;
		}
		return true;
	}
	@Override
	public boolean usercheck1(String usernum) {
		// TODO Auto-generated method stub
		List<User> user = userDao.usercheck1(usernum);
		if (user.size() > 0) {
			return false;
		}
		return true;
	}

	@Override
	public boolean pwdcheck(Integer id, String password) {
		// TODO Auto-generated method stub
		List<User> user = userDao.pwdcheck(id,password);
		if (user.size() > 0) {
			return true;
		}
		return false;
	}
	@Override
	public void userchangpwd(User user) {
		// TODO Auto-generated method stub
	    String password = null;
	    password = user.getPassword();
	    user.setPassword(password);
	    userDao.userchangpwd(user);
	}
	@Override
	public void useradd(User user,int deptid,int roles) {
		// TODO Auto-generated method stub
		String username= null;
		String usernum = null;
		String realname = null;
		String password = String.valueOf(123456);
		String sex = null;
		String telephone = null;
		String email = null; 
		try {
			username = java.net.URLDecoder.decode(user.getUsername(),"UTF-8");
			usernum = java.net.URLDecoder.decode(user.getUsernum(),"UTF-8");
			realname = java.net.URLDecoder.decode(user.getRealname(),"UTF-8");
			/*password = java.net.URLDecoder.decode(user.getPassword(),"UTF-8");*/
			sex = java.net.URLDecoder.decode(user.getSex(),"UTF-8");
			telephone = user.getTelephone();
			email = java.net.URLDecoder.decode(user.getEmail(),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		User u = new User();
		u.setUsernum(usernum);
		u.setPassword(password);
		u.setRealname(realname);
		u.setEmail(email);
		u.setUsername(username);
		u.setTelephone(telephone);
		u.setSex(sex);
		Role role = userDao.loadrolebyid(roles);
		u.setRoles(role);
		Dept dept = userDao.loaddeptbyid(deptid);
		u.setDepts(dept);
		userDao.useradd(u);
	}

	@Override
	public String deptlist() {
		// TODO Auto-generated method stub
		List<Dept> depts = userDao.loaddepts();
		String deptlist = "";
		int i = 1;
		for (Dept c : depts) {
			String s = "{\"Deptid\":" + c.getDeptId() + "," + "\"Deptname\":" + "\"" + c.getDeptname() + "\"," + "\"Responsible\":" + "\"" + c.getDeptresponsible() + "\"}";
			if (i < depts.size()) {
				deptlist += s + ",";
			} else {
				deptlist += s;
			}
			i++;
		}
		return deptlist;
	}

	@Override
	public Map<String, Object> usermap(int page, int pageSize) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		List<User> user = userDao.loadusers((page - 1) * pageSize, pageSize);
		long total = userDao.totalstu();
		List<UserModel> stumodels = new ArrayList<UserModel>();
		for (User s : user) {
			UserModel model = new UserModel();
			model.setUsernum(s.getUsernum());
			model.setDeptid(s.getDepts().getDeptId());
			model.setId(s.getId());
			model.setRoleid(s.getRoles().getId());			
			model.setPassword(s.getPassword());
			model.setSex(s.getSex());
			model.setUsername(s.getUsername());
			model.setRealname(s.getRealname());
			model.setEmail(s.getEmail());
			model.setTelephone(s.getTelephone());
			stumodels.add(model);
		}
		map.put("Total", total);
		map.put("Rows", stumodels);
		return map;
	}

	@Override
	public void userupdate(User user, int deptid) {
		// TODO Auto-generated method stub
		String username = null;
		String usernum = null;
		String realname = null;
		String telephone = null;
		String email = null;
		String sex = null;
		String password = null;
		try {
			username = java.net.URLDecoder.decode(user.getUsername(),"UTF-8");
			usernum = java.net.URLDecoder.decode(user.getUsernum(),"UTF-8");
			realname = java.net.URLDecoder.decode(user.getRealname(),"UTF-8");
			telephone = java.net.URLDecoder.decode(user.getTelephone(),"UTF-8");
			email = java.net.URLDecoder.decode(user.getEmail(),"UTF-8");
			sex = java.net.URLDecoder.decode(user.getSex(),"UTF-8");
			password = java.net.URLDecoder.decode(user.getPassword(),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		user.setUsernum(usernum);
		user.setTelephone(telephone);
		user.setUsername(username);
		user.setEmail(email);
		user.setPassword(password);
		user.setRealname(realname);
		user.setSex(sex);
		userDao.userupdate(user,deptid);
	}

	@Override
	public void userdelete(String ids) {
		// TODO Auto-generated method stub
		StringTokenizer fenxi = new StringTokenizer(ids, ",");
		while (fenxi.hasMoreTokens()) {
			String sid = fenxi.nextToken();
			int userid = Integer.parseInt(sid);
			userDao.userdelete(userid);
		}
	}

	@Override
	public List<Dept> deptlist1() {
		// TODO Auto-generated method stub
		List<Dept> deptlist = userDao.loaddepts();
		return deptlist;
	}

	@Override
	public void roleadd(Role role) {
		// TODO Auto-generated method stub
		String rolename = null;
		String roledescribe = null;
		Integer rolerank  = null;
		try {
			rolename = java.net.URLDecoder.decode(role.getRolename(),"UTF-8");
			roledescribe = java.net.URLDecoder.decode(role.getRoledescribe(),"UTF-8");
			rolerank = role.getRolerank();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Date dt = new Date();
		SimpleDateFormat matter1 = new SimpleDateFormat("yyyy-MM-dd");
		String createdate = matter1.format(dt);
		role.setCreatedate(createdate);
		role.setRoledescribe(roledescribe);
		role.setRolename(rolename);
		role.setRolerank(rolerank);
		userDao.roleadd(role);		
	}

	@Override
	public void roledelete(String ids) {
		// TODO Auto-generated method stub
		StringTokenizer fenxi = new StringTokenizer(ids,",");
		while (fenxi.hasMoreTokens()) {
			String sid = fenxi.nextToken();
			int roleid = Integer.parseInt(sid);
			userDao.roledelete(roleid);
		}
	}

	@Override
	public void roleupdate(Role role) {
		// TODO Auto-generated method stub
		String rolename = null;
		String roledescribe = null;
		Integer rolerank  = null;
		String createdate = null;
		try {
			rolename = java.net.URLDecoder.decode(role.getRolename(),"UTF-8");
			roledescribe = java.net.URLDecoder.decode(role.getRoledescribe(),"UTF-8");
			rolerank = role.getRolerank();
			createdate = java.net.URLDecoder.decode(role.getCreatedate(),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		role.setCreatedate(createdate);
		role.setRoledescribe(roledescribe);
		role.setRolename(rolename);
		role.setRolerank(rolerank);
		userDao.roleupdate(role);		
	}

	@Override
	public Map<String, Object> rolemap(int page, int pageSize) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		List<Role> role = userDao.loadroles((page - 1) * pageSize, pageSize);
		
		long total = role.size();
		List<RoleModel> stumodels = new ArrayList<RoleModel>();
		for (Role s : role) {
			RoleModel model = new RoleModel();
			model.setId(s.getId());
			model.setCreatedate(s.getCreatedate());
			model.setRoledescribe(s.getRoledescribe());
			model.setRolename(s.getRolename());
			model.setRolerank(s.getRolerank());
			stumodels.add(model);
		}
		map.put("Total", total);
		map.put("Rows", stumodels);
		return map;
	}

	@Override
	public boolean rolecheck(String rolename) {
		// TODO Auto-generated method stub
		System.out.println(rolename);
		List<Role> haverole = userDao.rolecheck(rolename);
		if (haverole.size() > 0) {
			return false;
		}
		return true;
	}

	@Override
	public String rolelist() {
		// TODO Auto-generated method stub
		List<Role> roles = userDao.loadroles();
		String rolelist = "";
		int i = 1;
		for (Role role : roles) {
			String s = "{\"Roleid\":" + role.getId() + "," + "\"Rolename\":" + "\"" + role.getRolename() + "\"," + "\"Rolerank\":" + role.getRolerank() + "," + "\"Createdate\":" + "\""
					+ role.getCreatedate() + "\"," + "\"Roledescribe\":" + "\"" + role.getRoledescribe() + "\"}";
			if (i < roles.size()) {
				rolelist += s + ",";
			} else {
				rolelist += s;
			}
			i++;
		}
		return rolelist;
	}

	@Override
	public Role loadrolebyid(Integer id) {
		// TODO Auto-generated method stub
		Role role = userDao.loadrolebyid(id);
		return role;
	}

	

	

}
