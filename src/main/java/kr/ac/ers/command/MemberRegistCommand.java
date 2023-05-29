package kr.ac.ers.command;


import org.springframework.web.multipart.MultipartFile;

import kr.ac.ers.dto.MemberVO;
import lombok.Data;


@Data
public class MemberRegistCommand {
	
	private String id;
	private String name;
	private String birth;
	private String address[];
	private String phone[];
	private String gender;
	private String picture;
	private String wid;
	private String manid;
	private String caution;
	private String memType;
	private String lNum;
	private MultipartFile uploadfile;
	
	public MemberVO toMemberVO() {
		
		
	    String birthStr = birth.substring(2, 4)+birth.substring(5, 7)+birth.substring(8);
		
		
		//MemberVO setting
		MemberVO member = new MemberVO();
		member.setId(id);
		member.setName(name);
		member.setBirth(birthStr);
		member.setAddress(address[0]+" "+address[1]+" "+address[2]+" "+address[3]);
		member.setPhone(phone[0]+"-"+phone[1]+"-"+phone[2]);
		member.setGender(gender);
		member.setPicture(picture);
		member.setWid(wid);
		member.setCaution(caution);
		member.setMemType(memType);
		member.setLNum(lNum);
		
		return member;
	}
}
