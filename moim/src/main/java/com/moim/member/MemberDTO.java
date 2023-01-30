package com.moim.member;

import java.util.*;

public class MemberDTO {

	private int idx;
	private String name;
	private String id;
	private String pwd;
	private String email;
	private String local;
	private int age;
	private String hobby;
	private Date joindate;
	private int manager;
	
	
	
	public MemberDTO() {
		super();
	}



	public MemberDTO(int idx, String name, String id, String pwd, String email, String local, int age, String hobby,
			Date joindate, int manager) {
		super();
		this.idx = idx;
		this.name = name;
		this.id = id;
		this.pwd = pwd;
		this.email = email;
		this.local = local;
		this.age = age;
		this.hobby = hobby;
		this.joindate = joindate;
		this.manager = manager;
	}



	public int getIdx() {
		return idx;
	}



	public void setIdx(int idx) {
		this.idx = idx;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public String getPwd() {
		return pwd;
	}



	public void setPwd(String pwd) {
		this.pwd = pwd;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getLocal() {
		return local;
	}



	public void setLocal(String local) {
		this.local = local;
	}



	public int getAge() {
		return age;
	}



	public void setAge(int age) {
		this.age = age;
	}



	public String getHobby() {
		return hobby;
	}



	public void setHobby(String hobby) {
		this.hobby = hobby;
	}



	public Date getJoindate() {
		return joindate;
	}



	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}



	public int getManager() {
		return manager;
	}



	public void setManager(int manager) {
		this.manager = manager;
	}

}
