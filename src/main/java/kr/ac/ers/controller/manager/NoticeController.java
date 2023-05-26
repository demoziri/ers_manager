package kr.ac.ers.controller.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.ers.dto.NoticeVO;
import kr.ac.ers.service.NoticeService;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;

	public NoticeController(NoticeService noticeService) {

		this.noticeService = noticeService;

	}

	@RequestMapping("/ers/manager/notice/main")
	public String noticeList(Model model, NoticeVO notice) {
		List<NoticeVO> noticeList = noticeService.getNoticeList(notice);

		System.out.println(noticeList);
//		for(NoticeVO notices : noticeList) {
//			notices=noticeService.getNoticeByTitle();
//			System.out.println(notices);
//		}

		model.addAttribute("noticeList", noticeList);

		return "/manager/notice/noticeList";
	}

	@RequestMapping("/ers/manager/notice/detail")
	public String noticeDetail(int nno, Model model) {

		NoticeVO noticeDetail = null;

		noticeDetail = noticeService.getNotice(nno);

		model.addAttribute("noticeDetail", noticeDetail);

		return "/manager/notice/noticeDetail";

	}

	@RequestMapping("/ers/manager/notice/noticeWriteForm")
	public String noticeWriteForm() {

	
		return "/manager/notice/noticeWrite";

	}

	@RequestMapping("/ers/manager/notice/noticeWrite")
	public void doWrite(NoticeVO notice) {

		noticeService.writeNotice(notice);

	}

	@RequestMapping("/ers/manager/notice/noticeModifyForm")
	public String noticeModifyForm() {

		return "/manager/notice/noticeModify";

	}

	@RequestMapping("/ers/manager/notice/noticeModify")
	public void noticeModify(NoticeVO notice) {

		noticeService.modifyNotice(notice);
	}

}
