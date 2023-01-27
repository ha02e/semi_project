package com.moim.info;

public class InfoDTO {

	private int idx;
	private String hobby;
	private String moimname;
	private String content;
	private String local;
	private int nowmem;
	private int maxmem;
	private String img;
	
	public InfoDTO() {
		super();
	}

	public InfoDTO(int idx, String hobby, String moimname, String content, String local, int nowmem, int maxmem,
			String img) {
		super();
		this.idx = idx;
		this.hobby = hobby;
		this.moimname = moimname;
		this.content = content;
		this.local = local;
		this.nowmem = nowmem;
		this.maxmem = maxmem;
		this.img = img;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getHobby() {
		return hobby;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
	}

	public String getMoimname() {
		return moimname;
	}

	public void setMoimname(String moimname) {
		this.moimname = moimname;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getLocal() {
		return local;
	}

	public void setLocal(String local) {
		this.local = local;
	}

	public int getNowmem() {
		return nowmem;
	}

	public void setNowmem(int nowmem) {
		this.nowmem = nowmem;
	}

	public int getMaxmem() {
		return maxmem;
	}

	public void setMaxmem(int maxmem) {
		this.maxmem = maxmem;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
	
	
}
