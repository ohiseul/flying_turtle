package kr.co.flyingturtle.repository.vo;

import java.sql.Timestamp;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Attend {
	private int attendNo;
	private int codeNo;
	private int memberNo;
	private String attendRegDate;
	private Timestamp checkIn;
	private Timestamp checkOut;
	private String specialNote;
	private String codeName;
	private String name;
	private String category_no;//상태변경 카테고리
	
	private int checkInCount;
	private int lateCount;
	private int earlyCount;
	private int absentCount;
	
	private String keyword;
	private String searchType;
	
	
	public String getCategory_no() {
		return category_no;
	}
	public void setCategory_no(String category_no) {
		this.category_no = category_no;
	}
	public int getCheckInCount() {
		return checkInCount;
	}
	public void setCheckInCount(int checkInCount) {
		this.checkInCount = checkInCount;
	}
	public int getLateCount() {
		return lateCount;
	}
	public void setLateCount(int lateCount) {
		this.lateCount = lateCount;
	}
	public int getEarlyCount() {
		return earlyCount;
	}
	public void setEarlyCount(int earlyCount) {
		this.earlyCount = earlyCount;
	}
	public int getAbsentCount() {
		return absentCount;
	}
	public void setAbsentCount(int absentCount) {
		this.absentCount = absentCount;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
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
	public String getAttendRegDate() {
		return attendRegDate;
	}
	public void setAttendRegDate(String attendRegDate) {
		this.attendRegDate = attendRegDate;
	}

	public Timestamp getCheckIn() {
		return checkIn;
	}
	public void setCheckIn(Timestamp checkIn) {
		this.checkIn = checkIn;
	}
	public Timestamp getCheckOut() {
		return checkOut;
	}
	public void setCheckOut(Timestamp checkOut) {
		this.checkOut = checkOut;
	}
	public String getSpecialNote() {
		return specialNote;
	}
	public void setSpecialNote(String specialNote) {
		this.specialNote = specialNote;
	}
	
	
	
}
