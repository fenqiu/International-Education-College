package com.tjpu.bean;


public class CourseModel  {

	private Integer id;
	private Integer num;
	private String coursename;
	private String teacher;
	private Integer beginweeks;
	private Integer endweeks;
	private Integer credits;
	private String character;
	private String checkway;

	
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	
	public String getCoursename() {
		return this.coursename;
	}

	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}

	
	public String getTeacher() {
		return this.teacher;
	}

	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}

	
	public Integer getBeginweeks() {
		return this.beginweeks;
	}

	public void setBeginweeks(Integer beginweeks) {
		this.beginweeks = beginweeks;
	}
	
	public Integer getEndweeks() {
		return endweeks;
	}

	public void setEndweeks(Integer endweeks) {
		this.endweeks = endweeks;
	}
	
	public Integer getCredits() {
		return credits;
	}

	public void setCredits(Integer credits) {
		this.credits = credits;
	}
  
	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}
   
	public String getCharacter() {
		return character;
	}

	public void setCharacter(String character) {
		this.character = character;
	}
  
	public String getCheckway() {
		return checkway;
	}

	public void setCheckway(String checkway) {
		this.checkway = checkway;
	}

	
	

}