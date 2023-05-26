package kr.ac.ers.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CenterEmergencyVO {

	private String scode;
	private String stype;
	private Date occurtime;
	private String wid;
	private String m_id;
	private String m_name;
	private String memtype;
	private String address;
	private String phone;
}
