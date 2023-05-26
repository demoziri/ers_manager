package kr.ac.ers.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ManagerMachineVO {
	
	private String mcode;
	private String mname;
	private String l_name;
	private String c_name;
	private String dongname;
	private String activesensor;
	private String firesensor;
	private String doorsensor;
	private String gateway;
	private Date week_start;
	private Date week_end;
	private int asRequestCnt;

}
