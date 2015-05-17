package com.tjpu.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Classroom entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "classroom")
public class Classroom implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String num;
	private String roomname;
	private String roomplace;
	private String  roomcapacity ;
	private String realcapacity;
	private String roomtype;
	private String note;

	// Constructors

	

	/** default constructor */
	public Classroom() {
	}

	/** full constructor */
	public Classroom(String num, String roomname, String roomplace, String  roomcapacity,String roomtype,String note,String realcapacity) {
		this.num = num;
		this.roomname = roomname;
		this.roomplace = roomplace;
		this.roomcapacity = roomcapacity;
		this.roomtype = roomtype;
		this.note = note;
		this.realcapacity = realcapacity;
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

	@Column(name = "num")
	public String getNum() {
		return this.num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	@Column(name = "roomname")
	public String getRoomname() {
		return this.roomname;
	}

	public void setRoomname(String roomname) {
		this.roomname = roomname;
	}

	@Column(name = "roomplace")
	public String getRoomplace() {
		return this.roomplace;
	}

	public void setRoomplace(String roomplace) {
		this.roomplace = roomplace;
	}

	@Column(name = "roomtype")
	public String getRoomtype() {
		return this.roomtype;
	}

	public void setRoomtype(String roomtype) {
		this.roomtype = roomtype;
	}
	@Column(name = "roomcapacity")
	public String  getRoomcapacity() {
		return roomcapacity;
	}

	public void setRoomcapacity(String roomcapacity) {
		this.roomcapacity = roomcapacity;
	}
	@Column(name = "note")
	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}
    @Column(name="realcapacity")
	public String getRealcapacity() {
		return realcapacity;
	}

	public void setRealcapacity(String realcapacity) {
		this.realcapacity = realcapacity;
	}
	
}