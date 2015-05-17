package com.tjpu.service;

import java.util.List;
import java.util.Map;

import com.tjpu.bean.Dept;
import com.tjpu.bean.Role;
import com.tjpu.bean.User;

public interface UserService {

 	public User loginService(User user);

	public boolean usercheck(String username);

	public void useradd(User user, int deptid, int roles);

	public String deptlist();

	public Map<String, Object> usermap(int page, int pageSize);

	public void userupdate(User user, int deptid);

	public void userdelete(String ids);

	public List<Dept> deptlist1();

	public boolean usercheck1(String usernum);

	public void roleadd(Role role);

	public void roledelete(String ids);

	public void roleupdate(Role role);

	public Map<String, Object> rolemap(int page, int pageSize);

	public boolean rolecheck(String rolename);

	public String rolelist();

	public boolean pwdcheck(Integer id, String password);

	public void userchangpwd(User user);

	public Role loadrolebyid(Integer id);

	

}
