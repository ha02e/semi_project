package com.moim.review;

import java.util.*;

public class ReviewDTO {

	private int idx;
	private int idx_member;
	private String moimname;
	private String writer;
	private String local;
	private String hobby;
	private String subject;
	private String content;
	private String img;
	private Date writedate;
	
	public ReviewDTO() {
		super();
	}

	public ReviewDTO(int idx, int idx_member, String moimname, String writer, String local, String hobby,
			String subject, String content, String img, Date writedate) {
		super();
		this.idx = idx;
		this.idx_member = idx_member;
		this.moimname = moimname;
		this.writer = writer;
		this.local = local;
		this.hobby = hobby;
		this.subject = subject;
		this.content = content;
		this.img = img;
		this.writedate = writedate;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getIdx_member() {
		return idx_member;
	}

	public void setIdx_member(int idx_member) {
		this.idx_member = idx_member;
	}

	public String getMoimname() {
		return moimname;
	}

	public void setMoimname(String moimname) {
		this.moimname = moimname;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getLocal() {
		return local;
	}

	public void setLocal(String local) {
		this.local = local;
	}

	public String getHobby() {
		return hobby;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public Date getWritedate() {
		return writedate;
	}

	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}
	
	
}