package kr.ac.ers.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DispatchVO {
	
	private int sCode;
	private String sType;
	private Date occurTime;
	private String address;
	private String pacemaker;
	private String name;
	private int id;
	private String wid;
	private String reDone;
	private String viewCheck;
	private int rNo;

}
