package kr.ac.ers.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class CenterEmanagerVO {
	
	private String wid;
	private String wcode;
	private String picture;
	private String e_name;
	private String c_name;
	private String l_name;
	private String phone;
	private String status;
	private int totalCount;
	
	public CenterEmanagerVO(String status, int totalCount) {
		this.status = status;
		this.totalCount = totalCount;
	}
	
	
}
