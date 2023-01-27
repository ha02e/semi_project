package com.moim.noimg;

import java.util.*;

public class NoimgDTO {
	
	private int idx;
	private int idx_member;
	private int idx_info;
	private int category;
	private String subject;
	private String content;
	private Date wirtedate;
	private int ref;
	private int lev;
	private int sunbun;
	
	public NoimgDTO() {
		super();
	}

	public NoimgDTO(int idx, int idx_member, int idx_info, int category, String subject, String content, Date wirtedate,
			int ref, int lev, int sunbun) {
		super();
		this.idx = idx;
		this.idx_member = idx_member;
		this.idx_info = idx_info;
		this.category = category;
		this.subject = subject;
		this.content = content;
		this.wirtedate = wirtedate;
		this.ref = ref;
		this.lev = lev;
		this.sunbun = sunbun;
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

	public int getIdx_info() {
		return idx_info;
	}

	public void setIdx_info(int idx_info) {
		this.idx_info = idx_info;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
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

	public Date getWirtedate() {
		return wirtedate;
	}

	public void setWirtedate(Date wirtedate) {
		this.wirtedate = wirtedate;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getLev() {
		return lev;
	}

	public void setLev(int lev) {
		this.lev = lev;
	}

	public int getSunbun() {
		return sunbun;
	}

	public void setSunbun(int sunbun) {
		this.sunbun = sunbun;
	}
	
	
}
