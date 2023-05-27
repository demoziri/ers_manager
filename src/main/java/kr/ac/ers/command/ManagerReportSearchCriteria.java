package kr.ac.ers.command;


public class ManagerReportSearchCriteria {

	private int page;
	private int perPageNum;
	private String reType;
	private String start_Day;
	private String end_day;
	
	
	public void setPage(String page) {
		this.page = Integer.parseInt(page);
	}
	
	public void setPerPageNum(String perPageNum) {
		this.perPageNum = Integer.parseInt(perPageNum);
	}
	
	//시작 행번호 계산하는 method
	public int getStartRowNum() {
		return (this.page-1)* this.perPageNum;
	}
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}
	public String getReType() {
		return reType;
	}
	public void setReType(String reType) {
		this.reType = reType;
	}
	public String getStart_Day() {
		return start_Day;
	}
	public void setStart_Day(String start_Day) {
		this.start_Day = start_Day;
	}
	public String getEnd_day() {
		return end_day;
	}
	public void setEnd_day(String end_day) {
		this.end_day = end_day;
	}
	
	
}
