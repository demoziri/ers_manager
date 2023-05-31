package kr.ac.ers.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberNameSearchVO {
	
	private int sCode;
	private String sType;
	private Date occurTime;
	private String reportCheck;
	private String id;
	private String wId;
	private String name;
	private String gender;
	private String birth;
	private String picture;

}
