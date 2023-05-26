package kr.ac.ers.command;


public class MachineSearchCriteria {

	private int page;
	private int perPageNum;
	private String gu;
	private String dong;
	
	public String getGu() {
		return gu;
	}
	public void setGu(String gu) {
		this.gu = gu;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public void setPage(String page) {
		this.page = Integer.parseInt(page);
	}
	
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}
	public void setPerPageNum(String perPageNum) {
		this.perPageNum = Integer.parseInt(perPageNum);
	}
	
	//시작 행번호 계산하는 method
	public int getStartRowNum() {
		return (this.page-1)* this.perPageNum;
	}
	
	
}
