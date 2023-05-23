package kr.ac.ers.command;

import kr.ac.ers.dto.MemberVO;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class MemberModifyCommand {
	private String id;
	private String phone[];
	private String address[];
	private String caution;
	private String status;
	private String lNum;
	private String picture;
	
	
public MemberVO toMemberVO() {
		
		
		//MemberVO setting
		MemberVO member = new MemberVO();
		member.setId(id);
		member.setAddress(address[0]+" "+address[1]+" "+address[2]+" "+address[3]);
		member.setPhone(phone[0]+"-"+phone[1]+"-"+phone[2]);
		member.setCaution(caution);
		member.setStatus(status);
		member.setLNum(lNum);
		member.setPicture(picture);
		return member;
	}
	
}
