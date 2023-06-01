package kr.ac.ers.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ManagerMachineVO {
	
	private String mcode;
	private String mname;
	private String mc_name;
	private String mnum;
	private String cnum;
	private String l_name;
	private String c_name;
	private String dongname;
	private String activesensor;
	private String firesensor;
	private String doorsensor;
	private String gateway;
	private Date week_start;
	private Date week_end;
	private Date asSend;
	private Date regDate;
	private int asRequestCnt;
	private int totalCount;
	private String joongcount;
	private String seocount;
	private String dongcount;
	private String ucount;
	private String deacount;
	
	
	
	
	
	
}
