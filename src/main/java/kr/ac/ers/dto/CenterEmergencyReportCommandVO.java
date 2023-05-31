package kr.ac.ers.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class CenterEmergencyReportCommandVO {

	private String occurType;
	private int cnt;
}
