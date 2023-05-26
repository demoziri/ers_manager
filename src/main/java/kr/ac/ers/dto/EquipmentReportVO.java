package kr.ac.ers.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class EquipmentReportVO {
	
	private int rno; 
	private Date regdate;
	private String content;
	private String id;
	private int wcode;
	private String redone; 
	private String viewcheck;
	private String retype;
	private Date occurtime;
	private String occurtype;
	private String callcheck;
	private int mnum;
	private	String mstatus;

}
