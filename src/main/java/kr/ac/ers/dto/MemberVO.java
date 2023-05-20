package kr.ac.ers.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberVO {

	private String id;
	private String name;
	private String birth;
	private String address;
	private String phone;
	private String gender;
	private String picture;
	private String mentalStatus;
	private String fam_rel;
	private String wid;
	private String caution;
	private String pacemaker;
	private Date regDate;
	private Date equipDate;
	private String status;
	private String dropstatus;
	private String dropDate;
	private String drug;
	private String orgdisease;
	private String allergy;
	private String equipment;
	private String afNo;
	private String memType;
	private int machineCk; //설치완료:1 미설치:0
	private String w_Name;
	private int e_count;

}
