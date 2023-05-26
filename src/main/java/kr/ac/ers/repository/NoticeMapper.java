package kr.ac.ers.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.ac.ers.dto.NoticeVO;

@Mapper
public interface NoticeMapper {

	public List<NoticeVO> selectNoticeList(NoticeVO notice);
	
	public NoticeVO selectNotice(int nno);

	public void insertNotice(NoticeVO notice);

	public void updateNotice(NoticeVO notice);

	public int deleteNotice(int nno);

	

}
