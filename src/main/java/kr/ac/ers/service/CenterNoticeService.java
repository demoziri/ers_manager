package kr.ac.ers.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.ers.command.PageMaker;
import kr.ac.ers.command.SearchCriteria;
import kr.ac.ers.dto.NoticeVO;
import kr.ac.ers.repository.CenterNoticeMapper;

@Service
public class CenterNoticeService {

	@Autowired
	private CenterNoticeMapper centerNoticeMapper;
	
	public Map<String, Object> getNoticeList(SearchCriteria cri) {
		Map<String, Object> dataMap = new HashMap<>();
		
		RowBounds rowBounds = new RowBounds(cri.getStartRowNum(), cri.getPerPageNum());
		
		List<NoticeVO> noticeList = centerNoticeMapper.selectNoticeList(cri,rowBounds);

		int totalCount = centerNoticeMapper.selectNoticeListCount(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("noticeList", noticeList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	public NoticeVO getNoticeByNno(String nno) {
		return centerNoticeMapper.selectNoticeByNno(nno);
	}

	public List<NoticeVO> getNoticeListToMain() {
		RowBounds rowBounds = new RowBounds(0, 4);
		
		List<NoticeVO> noticeList = centerNoticeMapper.selectNoticeList(null,rowBounds);
		return noticeList;
	}
	
}
