package com.tjpu.dao;

import java.util.List;

import com.tjpu.bean.Dept;
import com.tjpu.bean.Role;
import com.tjpu.bean.User;

public interface UserDao {

	public List<User> loginDao(String username, String password, Integer role);

	public List<User> usercheck(String username);

	public void useradd(User u);

	public List<Dept> loaddepts();

	public List<User> loadusers(int i, int pageSize);

	public long totalstu();

	public void userupdate(User user, int deptid);

	public void userdelete(int userid);

	public List<User> usercheck1(String usernum);

	public Dept loaddeptbyid(int deptid);

	public Role loadrolebyid(int roles);

	public List<Role> loadroles(int i, int pageSize);

	public void roleadd(Role role);

	public void roledelete(int roleid);

	public void roleupdate(Role role);

	public List<Role> rolecheck(String rolename);

	public List<Role> loadroles();

	public List<User> pwdcheck(Integer id, String password);

	public void userchangpwd(User user);

}
