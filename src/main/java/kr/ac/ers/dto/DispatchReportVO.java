package kr.ac.ers.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DispatchReportVO {
	
	private int sCode;
	private String sType;
	private Date ocurTime;
	private String address;
	private String pacemaker;
	private String name;
	private String reDone;
	private int viewCheck;
	private int id;
	private String wid;
	private int rNo;

}
