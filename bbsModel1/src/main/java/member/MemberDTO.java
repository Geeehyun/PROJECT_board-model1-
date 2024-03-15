package member;

import java.time.LocalDateTime;

public class MemberDTO {
// DTO = Data Transfer Object 데이터 전송용 객체
// VO = Value Object 데이터베이스의 딱 컬럼에 맞는 데이터를 갖고있는 객체
// 많은 책에서는 DTO와 VO를 같은 개념으로 보지만, 근본적으로는 다른 개념
	
	private String memberId;
	private String name;
	private String pwd;
	private String jumin;
	private String addr1;
	private String addr2;
	private String birthday;
	private String jobCode;
	private long mileage;
	private String memberState;
	private LocalDateTime regDate;
	private LocalDateTime leaveDate;
	private LocalDateTime pwd_change_date;
	/**
	 * @return the memberId
	 */
	public String getMemberId() {
		return memberId;
	}
	/**
	 * @param memberId the memberId to set
	 */
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return the pwd
	 */
	public String getPwd() {
		return pwd;
	}
	/**
	 * @param pwd the pwd to set
	 */
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	/**
	 * @return the jumin
	 */
	public String getJumin() {
		return jumin;
	}
	/**
	 * @param jumin the jumin to set
	 */
	public void setJumin(String jumin) {
		this.jumin = jumin;
	}
	/**
	 * @return the addr1
	 */
	public String getAddr1() {
		return addr1;
	}
	/**
	 * @param addr1 the addr1 to set
	 */
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	/**
	 * @return the addr2
	 */
	public String getAddr2() {
		return addr2;
	}
	/**
	 * @param addr2 the addr2 to set
	 */
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	/**
	 * @return the birthday
	 */
	public String getBirthday() {
		return birthday;
	}
	/**
	 * @param birthday the birthday to set
	 */
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	/**
	 * @return the jobCode
	 */
	public String getJobCode() {
		return jobCode;
	}
	/**
	 * @param jobCode the jobCode to set
	 */
	public void setJobCode(String jobCode) {
		this.jobCode = jobCode;
	}
	/**
	 * @return the mileage
	 */
	public long getMileage() {
		return mileage;
	}
	/**
	 * @param mileage the mileage to set
	 */
	public void setMileage(long mileage) {
		this.mileage = mileage;
	}
	/**
	 * @return the memberState
	 */
	public String getMemberState() {
		return memberState;
	}
	/**
	 * @param memberState the memberState to set
	 */
	public void setMemberState(String memberState) {
		this.memberState = memberState;
	}
	/**
	 * @return the regDate
	 */
	public LocalDateTime getRegDate() {
		return regDate;
	}
	/**
	 * @param regDate the regDate to set
	 */
	public void setRegDate(LocalDateTime regDate) {
		this.regDate = regDate;
	}
	/**
	 * @return the leaveDate
	 */
	public LocalDateTime getLeaveDate() {
		return leaveDate;
	}
	/**
	 * @param leaveDate the leaveDate to set
	 */
	public void setLeaveDate(LocalDateTime leaveDate) {
		this.leaveDate = leaveDate;
	}
	/**
	 * @return the pwd_change_date
	 */
	public LocalDateTime getPwd_change_date() {
		return pwd_change_date;
	}
	/**
	 * @param pwd_change_date the pwd_change_date to set
	 */
	public void setPwd_change_date(LocalDateTime pwd_change_date) {
		this.pwd_change_date = pwd_change_date;
	}
}
