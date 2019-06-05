package kr.co.flyingturtle.repository.vo;

import java.sql.Timestamp;
import java.util.Arrays;
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
	private String month;
	
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	private int allCount;
	private int checkInCount;
	private int lateCount;
	private int earlyCount;
	private int absentCount;
	
	private String keyword;
	private String searchType;

	
	private Integer[] checkArr;
	private Integer[] selectArr;
	private String[] memoArr;
	
	public int getAllCount() {
		return allCount;
	}
	public void setAllCount(int allCount) {
		this.allCount = allCount;
	}
	public Integer[] getCheckArr() {
		return checkArr;
	}
	public void setCheckArr(Integer[] checkArr) {
		this.checkArr = checkArr;
	}
	public Integer[] getSelectArr() {
		return selectArr;
	}
	public void setSelectArr(Integer[] selectArr) {
		this.selectArr = selectArr;
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

	
	
	public String[] getMemoArr() {
		return memoArr;
	}
	public void setMemoArr(String[] memoArr) {
		this.memoArr = memoArr;
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
	@Override
	public String toString() {
		return "Attend [attendNo=" + attendNo + ", codeNo=" + codeNo + ", memberNo=" + memberNo + ", attendRegDate="
				+ attendRegDate + ", checkIn=" + checkIn + ", checkOut=" + checkOut + ", specialNote=" + specialNote
				+ ", codeName=" + codeName + ", name=" + name + ", allCount=" + allCount + ", checkInCount="
				+ checkInCount + ", lateCount=" + lateCount + ", earlyCount=" + earlyCount + ", absentCount="
				+ absentCount + ", keyword=" + keyword + ", searchType=" + searchType + ", checkArr="
				+ Arrays.toString(checkArr) + ", selectArr=" + Arrays.toString(selectArr) + ", memoArr="
				+ Arrays.toString(memoArr) + "]";
	}
	
	
	
}
