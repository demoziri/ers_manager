package kr.ac.ers.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class EquipmentReportVO {
	
	private int rNo; 
	private Date regDate;
	private String content;
	private String id;
	private int wCode;
	private String reDone; 
	private String viewCheck;
	private String reType;
	private Date occurTime;
	private String occurType;
	private String callCheck;
	private int mNum;
	private	String mstatus;
	private String name;
	private String address;

}
