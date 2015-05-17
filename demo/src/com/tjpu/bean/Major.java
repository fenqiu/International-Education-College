package com.tjpu.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Major entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "major")
public class Major implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String majorname;
/*	private Set<Classes> Classess = new HashSet<Classes>(0);*/

	// Constructors

	/** default constructor */
	public Major() {
	}

	/** full constructor */
	public Major(String majorname/*,Set<Classes> Classess*/) {
		this.majorname = majorname;
		//this.Classess = Classess;
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

	@Column(name = "majorname")
	public String getMajorname() {
		return this.majorname;
	}

	public void setMajorname(String majorname) {
		this.majorname = majorname;
	}
	/*@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "major")
	public Set<Classes> getClassess() {
		return Classess;
	}

	public void setClassess(Set<Classes> Classess) {
		this.Classess = Classess;
	}
*/
}