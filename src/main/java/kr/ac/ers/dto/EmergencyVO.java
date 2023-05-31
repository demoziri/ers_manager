package kr.ac.ers.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class EmergencyVO {
	
	private int sCode;
	private String sType;
	private Date occurTime;
	private String confirmCheck;
	private String reportCheck;
	private String id;
	private String wId;
	private String name;
	private String birth;
	private String address;
	private String phone;
	private String caution;
	private String pacemaker;
	private String equipment;
	private String memType;
	private String gender;

}
