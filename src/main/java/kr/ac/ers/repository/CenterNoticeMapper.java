package kr.ac.ers.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import kr.ac.ers.command.SearchCriteria;
import kr.ac.ers.dto.NoticeVO;

@Mapper
public interface CenterNoticeMapper {

	List<NoticeVO> selectNoticeList(SearchCriteria cri, RowBounds rowBounds);

	int selectNoticeListCount(SearchCriteria cri);

	NoticeVO selectNoticeByNno(String nno);

}
