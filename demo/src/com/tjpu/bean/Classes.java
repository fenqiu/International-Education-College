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
 * Classes entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "class")
public class Classes implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String classname;
	private String major;
	private Integer courseId;
	private Set<Student> Students = new HashSet<Student>(0);
	/*private Set<Course> courses = new HashSet<Course>(0);*/

	// Constructors

	/** default constructor */
	public Classes() {
	}

	/** full constructor */
	public Classes(String classname, String major, Integer courseId, Set<Student> Students /*Set<Course> courses*/) {
		this.classname = classname;
		this.major = major;
		this.courseId = courseId;
		this.Students = Students;
		/*this.courses = courses;*/
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "classname", length = 45)
	public String getClassname() {
		return this.classname;
	}

	public void setClassname(String classname) {
		this.classname = classname;
	}

	@Column(name = "major", length = 45)
	public String getMajor() {
		return this.major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	@Column(name = "course_id")
	public Integer getCourseId() {
		return this.courseId;
	}

	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "classes")
	public Set<Student> getStudents() {
		return this.Students;
	}

	public void setStudents(Set<Student> Students) {
		this.Students = Students;
	}

	/*@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinTable(name = "t_class_course", joinColumns = { @JoinColumn(name = "class_id", nullable = false, updatable = false) }, inverseJoinColumns = { @JoinColumn(name = "course_id", nullable = false, updatable = false) })
	public Set<Course> getCourses() {
		return this.courses;
	}

	public void setCourses(Set<Course> courses) {
		this.courses = courses;
	}*/

}