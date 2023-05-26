package kr.ac.ers.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NoticeVO {
	
	private int nno;
	private String title;
	private String content;
	private Date regDate;
	private Date updateDate;
	private String manId;
	private String name;
}
