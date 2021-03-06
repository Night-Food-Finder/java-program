package kr.co.nff.front.notice.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.nff.front.notice.service.NoticeService;
import kr.co.nff.repository.vo.Notice;
import kr.co.nff.repository.vo.Store;
import kr.co.nff.repository.vo.User;

@Controller("kr.co.nff.front.notice.controller.FrontNoticeController")
@RequestMapping("/front/main")
public class FrontNoticeController {
	
	@Autowired
	private NoticeService service;
	
	
	/* 알림 리스트 */
	@RequestMapping("/notice_list.do")
	@ResponseBody
	public Map <String, Object> noticeListAjax(Notice notice, HttpSession session) {
		Map <String, Object> map = service.noticeList(notice, session);

		return service.noticeList(notice, session);
	}
	
	
	
	
	
/*	@RequestMapping("/notice_list.do")
	@ResponseBody
	public List<Notice> noticeListAjax(HttpSession session, Notice notice) {
		User loginUser = (User)session.getAttribute("loginUser");
		Store loginStore = (Store)session.getAttribute("loginStore");

	//	Notice notice = new Notice();
		if (loginUser != null) notice.setUserNo(loginUser.getUserNo());
		if (loginStore != null) notice.setStoreNo(loginStore.getStoreNo());

		return service.selectNotice(notice);
	}

*/	
	/* 알림 확인시 */
	@RequestMapping("/read_notice.do")
	@ResponseBody
	public void readNoticeAjax(int noticeNo) {
		service.readNotice(noticeNo);
	}

	/* 알림 갯수 */
	@RequestMapping("/count_notice.do")
	@ResponseBody
	public int countNoticeAjax(HttpSession session) {
		User loginUser = (User)session.getAttribute("loginUser");
		Store storeUser = (Store)session.getAttribute("loginStore");
		
		// 로그인 상태 걸러준다.
		if (loginUser == null && storeUser == null) return 0;
		
		Notice notice = new Notice();
		if (storeUser == null && loginUser != null) notice.setUserNo(loginUser.getUserNo());
		else if (storeUser != null && loginUser == null) notice.setStoreNo(storeUser.getStoreNo());

		int noticeCnt = service.countNewNotice(notice);
		
		// 알림 갯수가 0이라면 0 반환. -> script단에서 걸러준다.
		if (noticeCnt != 0) return service.countNewNotice(notice);
		return 0;

	}
	
	/* 알림 하나 삭제 */
	@RequestMapping("/delete_notice.do")
	@ResponseBody
	public void deleteNoticeAjax(int noticeNo) {
		service.deleteNotice(noticeNo);
	}
	
	/* 알림 전부 삭제 */
	@RequestMapping("/deleteall_notice.do")
	@ResponseBody
	public void deleteAllNoticeAjax(HttpSession session) {
		User loginUser = (User)session.getAttribute("loginUser");
		Store loginStore = (Store)session.getAttribute("loginStore");
	
		Notice notice = new Notice();
		if (loginUser != null) {
			notice.setUserNo(loginUser.getUserNo());
			
		}
		if (loginStore != null) {
			notice.setStoreNo(loginStore.getStoreNo());
		
		}
		service.deleteAllNotice(notice);
	}
	 
}
