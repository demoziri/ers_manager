package kr.ac.ers.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CenterEquipmentCheckVO {

	private String id;
	private String m_name;
	private String address;
	private String phone;
	private Date unconnectTime;
	private String ma_name;
	private String mstatus;
}
