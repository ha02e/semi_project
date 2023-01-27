package com.moim.stat;

import java.util.*;

public class StatDTO {

	private int idx;
	private int idx_member;
	private int idx_info;
	private int stat;
	private Date joindate;
	private String content;
	
	public StatDTO() {
		super();
	}

	public StatDTO(int idx, int idx_member, int idx_info, int stat, Date joindate, String content) {
		super();
		this.idx = idx;
		this.idx_member = idx_member;
		this.idx_info = idx_info;
		this.stat = stat;
		this.joindate = joindate;
		this.content = content;
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

	public int getStat() {
		return stat;
	}

	public void setStat(int stat) {
		this.stat = stat;
	}

	public Date getJoindate() {
		return joindate;
	}

	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	
}
