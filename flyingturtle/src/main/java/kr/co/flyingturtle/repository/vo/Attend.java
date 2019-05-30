package kr.co.flyingturtle.repository.vo;

import java.util.Date;

public class Attend {
	private int attendNo;
	private int codeNo;
	private int memberNo;
	private Date attendRegDate;
	private Date checkIn;
	private Date checkOut;
	private String specialNote;
	private String codeName;
	private String name;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCodeName() {
		return codeName;
	}
	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}
	public int getAttendNo() {
		return attendNo;
	}
	public void setAttendNo(int attendNo) {
		this.attendNo = attendNo;
	}
	public int getCodeNo() {
		return codeNo;
	}
	public void setCodeNo(int codeNo) {
		this.codeNo = codeNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public Date getAttendRegDate() {
		return attendRegDate;
	}
	public void setAttendRegDate(Date attendRegDate) {
		this.attendRegDate = attendRegDate;
	}
	public Date getCheckIn() {
		return checkIn;
	}
	public void setCheckIn(Date checkIn) {
		this.checkIn = checkIn;
	}
	public Date getCheckOut() {
		return checkOut;
	}
	public void setCheckOut(Date checkOut) {
		this.checkOut = checkOut;
	}
	public String getSpecialNote() {
		return specialNote;
	}
	public void setSpecialNote(String specialNote) {
		this.specialNote = specialNote;
	}
	
	
	
}
