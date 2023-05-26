package kr.ac.ers.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ManagerVO {
	private String manid;		 //아이디
	private String name;		 //이름
	private String birth;		 //생년월일
	private String address; 	 //주소
	private String phone; 		 //전화번호
	private String pwd; 		 //패스워드
	private String authority;	 //권한
	private String depart; 		 //부서
	private String status;		 //승인여부
	private String email; 		 //이메일
	
}