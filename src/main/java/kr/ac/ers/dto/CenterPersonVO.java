package kr.ac.ers.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CenterPersonVO {

	private String mid;
	private String m_name;
	private String memType;
	private String address;
	private String phone;
	private Date activeTime;
	private Date outTime;
	private String d_day;
	private String h_hour;
	private String m_minute;
}
