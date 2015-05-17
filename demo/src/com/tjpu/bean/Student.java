package com.tjpu.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


/**
 * Student entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="student",catalog="arranging")

public class Student  implements java.io.Serializable {


    // Fields    

     /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
     private Classes classes;
     private String stuid;
     private String enname;
     private String ensuiname;
     private String nation;
     private String stuname;
     private String sex;
     private String password;
     private String telephone;
     private String roomplace;
     private String imgurl;
     private String passport;


    // Constructors

    /** default constructor */
    public Student() {
    }

	/** minimal constructor */
    public Student(String password) {
        this.password = password;
    }
    
    /** full constructor */
    public Student(Classes classes, String stuid, String enname, String ensuiname, String nation, String stuname, String sex, String password, String telephone, String roomplace, String imgurl, String passport) {
        this.classes = classes;
        this.stuid = stuid;
        this.enname = enname;
        this.ensuiname = ensuiname;
        this.nation = nation;
        this.stuname = stuname;
        this.sex = sex;
        this.password = password;
        this.telephone = telephone;
        this.roomplace = roomplace;
        this.imgurl = imgurl;
        this.passport = passport;
    }

   
    // Property accessors
    @Id @GeneratedValue(strategy=IDENTITY)    
    @Column(name="id", unique=true, nullable=false)
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
	@ManyToOne(fetch=FetchType.LAZY) @JoinColumn(name="class_id")

    public Classes getClasses() {
        return classes;
    }
    
    public void setClasses(Classes classes) {
        this.classes = classes;
    }
    
    @Column(name="stuid")

    public String getStuid() {
        return this.stuid;
    }
    
    public void setStuid(String stuid) {
        this.stuid = stuid;
    }
    
    @Column(name="enname")

    public String getEnname() {
        return this.enname;
    }
    
    public void setEnname(String enname) {
        this.enname = enname;
    }
    
    @Column(name="ensuiname")

    public String getEnsuiname() {
        return this.ensuiname;
    }
    
    public void setEnsuiname(String ensuiname) {
        this.ensuiname = ensuiname;
    }
    
    @Column(name="nation")

    public String getNation() {
        return this.nation;
    }
    
    public void setNation(String nation) {
        this.nation = nation;
    }
    
    @Column(name="stuname")

    public String getStuname() {
        return this.stuname;
    }
    
    public void setStuname(String stuname) {
        this.stuname = stuname;
    }
    
    @Column(name="sex")

    public String getSex() {
        return this.sex;
    }
    
    public void setSex(String sex) {
        this.sex = sex;
    }
    
    @Column(name="password", nullable=false)

    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    
    @Column(name="telephone")

    public String getTelephone() {
        return this.telephone;
    }
    
    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }
    
    @Column(name="roomplace")

    public String getRoomplace() {
        return this.roomplace;
    }
    
    public void setRoomplace(String roomplace) {
        this.roomplace = roomplace;
    }
    
    @Column(name="imgurl")

    public String getImgurl() {
        return this.imgurl;
    }
    
    public void setImgurl(String imgurl) {
        this.imgurl = imgurl;
    }
    
    @Column(name="passport")

    public String getPassport() {
        return this.passport;
    }
    
    public void setPassport(String passport) {
        this.passport = passport;
    }
   








}