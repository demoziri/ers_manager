package kr.ac.ers.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class CenterPersonCommandVO {
	
	private String personStatus;
	private int cnt;
	private String textColor;
}
