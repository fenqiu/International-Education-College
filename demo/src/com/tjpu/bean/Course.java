package com.tjpu.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Classes entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "course")
public class Course implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Integer num;
	private String coursename;
	private String teacher;
	private Integer beginweeks;
	private Integer endweeks;
	private Integer credits;
	private String character;
	private String checkway;

	// Constructors

	/** default constructor */
	public Course() {
	}

	/** full constructor */
	public Course(Integer num,String coursename, String teacher, Integer beginweeks, Integer endweeks,Integer credits) {
		this.num = num;
		this.coursename = coursename;
		this.teacher = teacher;
		this.beginweeks = beginweeks;
		this.endweeks = endweeks;
		this.credits = credits;
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

	@Column(name = "coursename", length = 45)
	public String getCoursename() {
		return this.coursename;
	}

	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}

	@Column(name = "teacher", length = 45)
	public String getTeacher() {
		return this.teacher;
	}

	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}

	@Column(name = "beginweeks")
	public Integer getBeginweeks() {
		return this.beginweeks;
	}

	public void setBeginweeks(Integer beginweeks) {
		this.beginweeks = beginweeks;
	}
	@Column(name = "endweeks")
	public Integer getEndweeks() {
		return endweeks;
	}

	public void setEndweeks(Integer endweeks) {
		this.endweeks = endweeks;
	}
	@Column(name = "credits")
	public Integer getCredits() {
		return credits;
	}

	public void setCredits(Integer credits) {
		this.credits = credits;
	}
    @Column(name="num")
	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}
    @Column(name="coursecharacter")
	public String getCharacter() {
		return character;
	}

	public void setCharacter(String character) {
		this.character = character;
	}
    @Column(name="coursecheckway")
	public String getCheckway() {
		return checkway;
	}

	public void setCheckway(String checkway) {
		this.checkway = checkway;
	}

	
	

}