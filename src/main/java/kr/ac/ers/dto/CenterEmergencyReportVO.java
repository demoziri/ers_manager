package kr.ac.ers.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CenterEmergencyReportVO {
	
	private String m_id;
	private String m_name;
	private String address;
	private String phone;
	private String pciture;
	private String memType;
	private String gender;
	private String rno;
	private String changeRno;
	private Date r_regDate;
	private String content;
	private String wcode;
	private Date occurTime;
	private String occurType;
	private String e_name;
}
