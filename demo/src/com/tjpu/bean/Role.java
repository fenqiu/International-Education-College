package com.tjpu.bean;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.OneToMany;

import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Role entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "role")
public class Role implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	// Fields

	private Integer id;
	private String rolename;
	private String roledescribe;
	private Integer rolerank;
	private String createdate;
	private Set<User> Users = new HashSet<User>(0);
	// Constructors

	/** default constructor */
	public Role() {
	}

	/** minimal constructor */
	public Role(String createdate) {
		this.createdate = createdate;
	}

	/** full constructor */
	public Role(String rolename, String roledescribe, Integer rolerank, String createdate,Set<User> Users) {
		this.rolename = rolename;
		this.roledescribe = roledescribe;
		this.rolerank = rolerank;
		this.createdate = createdate;
		this.Users = Users;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "rolename", length = 45)
	public String getRolename() {
		return this.rolename;
	}

	public void setRolename(String rolename) {
		this.rolename = rolename;
	}

	@Column(name = "roledescribe", length = 45)
	public String getRoledescribe() {
		return this.roledescribe;
	}

	public void setRoledescribe(String roledescribe) {
		this.roledescribe = roledescribe;
	}

	@Column(name = "rolerank")
	public Integer getRolerank() {
		return this.rolerank;
	}

	public void setRolerank(Integer rolerank) {
		this.rolerank = rolerank;
	}

	@Column(name = "createdate", nullable = false, length = 45)
	public String getCreatedate() {
		return this.createdate;
	}

	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "roles")
	public Set<User> getUsers() {
		return Users;
	}

	public void setUsers(Set<User> users) {
		Users = users;
	}

}