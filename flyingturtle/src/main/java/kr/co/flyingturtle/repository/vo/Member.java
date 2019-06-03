package kr.co.flyingturtle.repository.vo;

import java.util.Date;
import java.util.List;

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
	private String address;
	private String profile;
	
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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

	private List<String> videoTitle;
	private List<String> qnaTitle;

	public List<String> getVideoTitle() {
		return videoTitle;
	}

	public List<String> getQnaTitle() {
		return qnaTitle;
	}
	
}
