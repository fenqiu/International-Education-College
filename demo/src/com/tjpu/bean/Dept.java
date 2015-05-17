package com.tjpu.bean;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Student entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "dept")
public class Dept implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
     
	private Integer deptid;
	private String deptname;
	private String deptresponsible;
	private Set<User> Users = new HashSet<User>(0);
	// Constructors

		/** default constructor */
		public Dept() {
		}

		/** full constructor */
		public Dept(String deptname, String deptresponsible, Set<User> Users) {
			this.deptname = deptname;
			this.deptresponsible = deptresponsible;
			this.Users = Users;
		}
		@Id
		@GeneratedValue
		@Column(name = "dept_id", unique = true, nullable = false)
		public Integer getDeptId() {
			return deptid;
		}
		public void setDeptId(Integer deptid) {
			this.deptid = deptid;
		}

		@Column(name = "dept_name", length = 45)
		public String getDeptname() {
			return deptname;
		}
		public void setDeptname(String deptname) {
			this.deptname = deptname;
		}

		@Column(name = "dept_responsible", length = 45)
		public String getDeptresponsible() {
			return deptresponsible;
		}
		public void setDeptresponsible(String deptresponsible) {
			this.deptresponsible = deptresponsible;
		}

		@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "depts")
		public Set<User> getUsers() {
			return Users;
		}
		public void setUsers(Set<User> users) {
			Users = users;
		}	
}
