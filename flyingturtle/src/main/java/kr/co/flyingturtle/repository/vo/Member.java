package kr.co.flyingturtle.repository.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Member {
	private int memberCode;
	private int memberNo;
	private String id;
	private String pass;
	private String email;
	private String name;
	private String goal;
	private String patternPass;
	private String major;
	private String profile;
	private int status;
	
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}

	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date birthDate;
	
	
	
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public Date getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}
	public String getGoal() {
		return goal;
	}
	public void setGoal(String goal) {
		this.goal = goal;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public int getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}
	public String getPatternPass() {
		return patternPass;
	}
	public void setPatternPass(String patternPass) {
		this.patternPass = patternPass;
	}

	
	
	/* MYPAGE */
	private String title;
	private String content;
	private int videoNo;
	private int subjectNo;
	private String videoAddr;
	private String  type; 
	 

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getVideoNo() {
		return videoNo;
	}
	public void setVideoNo(int videoNo) {
		this.videoNo = videoNo;
	}
	public int getSubjectNo() {
		return subjectNo;
	}
	public void setSubjectNo(int subjectNo) {
		this.subjectNo = subjectNo;
	}
	public String getVideoAddr() {
		return videoAddr;
	}
	public void setVideoAddr(String videoAddr) {
		this.videoAddr = videoAddr;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	
	
	
	
	
}
