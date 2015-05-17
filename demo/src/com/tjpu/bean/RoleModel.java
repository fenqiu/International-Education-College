package com.tjpu.bean;


public class RoleModel  {
    private Integer id;
	private String rolename;
	private String roledescribe;
	private Integer rolerank;
	private String createdate;
	
	
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	
	public String getRolename() {
		return this.rolename;
	}

	public void setRolename(String rolename) {
		this.rolename = rolename;
	}

	
	public String getRoledescribe() {
		return this.roledescribe;
	}

	public void setRoledescribe(String roledescribe) {
		this.roledescribe = roledescribe;
	}

	
	public Integer getRolerank() {
		return this.rolerank;
	}

	public void setRolerank(Integer rolerank) {
		this.rolerank = rolerank;
	}

	
	public String getCreatedate() {
		return this.createdate;
	}

	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}	
}