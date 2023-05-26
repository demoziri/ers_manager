package kr.ac.ers.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.ac.ers.dto.NoticeVO;
import kr.ac.ers.repository.NoticeMapper;

@Service
public class NoticeService {

	private NoticeMapper noticeMapper;

	public NoticeService(NoticeMapper noticeMapper) {
		this.noticeMapper = noticeMapper;
	}

	public NoticeVO getNotice(int nno) {

		NoticeVO notice = noticeMapper.selectNotice(nno);

		return notice;
	}

	public List<NoticeVO> getNoticeList(NoticeVO notice) {

		List<NoticeVO> noticeList = noticeMapper.selectNoticeList(notice);

		return noticeList;
	}

	public void writeNotice(NoticeVO notice) {

		noticeMapper.insertNotice(notice);
	}

	public void modifyNotice(NoticeVO notice) {

		noticeMapper.updateNotice(notice);
	}

	public void deleteNotice(int nno) {

		noticeMapper.deleteNotice(nno);

	}

}
