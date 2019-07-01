package kr.co.mj.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringJoiner;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.common.collect.Sets.SetView;

import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;
import kr.co.jhta.mvc.view.JSONView;
import kr.co.mj.dao.CenterDao;
import kr.co.mj.util.CommonUtils;
import kr.co.mj.vo.Criteria;
import kr.co.mj.vo.Customers;
import kr.co.mj.vo.Frequent;
import kr.co.mj.vo.Notice;
import kr.co.mj.vo.OneQna;
import kr.co.mj.vo.OrderListView;
import kr.co.mj.vo.Pagination;


@Controller
public class CenterController {

	CenterDao centerDao = new CenterDao(); 
	
	@RequestMapping("/kurly/center/noticeDelete.hta")
	public ModelAndView noticeDelete(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();

		int no = Integer.parseInt(req.getParameter("no"));
		
		centerDao.noticeDelete(no);
		
		mav.setViewName("redirect:notice.hta?pno=1");		
		return mav;
	}
	@RequestMapping("/kurly/admin/orderList.hta")
	public ModelAndView modal(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		int no = Integer.parseInt(req.getParameter("no"));
		
		List<OrderListView> list = centerDao.orderdetailList(no);

		mav.addAttribute("list", list);
		
		mav.setViewName("kurly/admin/orderList.jsp");
		return mav;
	}
	// 관리자페이지 주문관리 -> 배송중 변경 컨트롤러
	@RequestMapping("/kurly/admin/adminupdateStauts.hta")
	public ModelAndView updateStatus(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		String[] status = req.getParameterValues("no");
		
		for(int i=0; i<status.length; i++) {
			centerDao.orderStatusUpdate(Integer.parseInt(status[i]));
		}
		
		mav.setViewName("redirect:orderManagement.hta");
		return mav;
	}
	@RequestMapping("/kurly/center/noticeComplete.hta")
	public ModelAndView noticeComplete(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		String title = req.getParameter("notTitle");
		String content = req.getParameter("notcontents");
		String fix = req.getParameter("fixed");
		
		Notice notice = new Notice();
		
		notice.setContent(content);
		notice.setTitle(title);

		if("Y".equals(fix)) {
			notice.setGrade(1);
		}else {
			notice.setGrade(2);
		}
		
		centerDao.noticeWriter(notice);
	
		mav.setViewName("redirect:notice.hta?pno=1");
		return mav;
	}
	
	@RequestMapping("/kurly/center/notice-writer.hta")
	public ModelAndView noticeWriter(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("kurly/center/notice-writer.jsp");
		return mav;
	}
	@RequestMapping("/kurly/center/qna-detail.hta") //1:1 문의글 디테일
	public ModelAndView qnadetail(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		int no = Integer.parseInt(req.getParameter("no"));
		
		OneQna qna = centerDao.qnadetail(no);
		
		mav.addAttribute("qna", qna);
		
		mav.setViewName("kurly/center/qna-detail.jsp");
		return mav;
	}
	
	@RequestMapping("/kurly/center/adminAddQna.hta")
	public ModelAndView adminAddQna(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		 
		String ans = req.getParameter("qnaContentsAdmin");
		int no = Integer.parseInt(req.getParameter("qnaList-no"));
		int pno = Integer.parseInt(req.getParameter("pno"));
		OneQna qna = new OneQna();
		qna.setAns(ans);
		qna.setNo(no);
		
		centerDao.adminQnaAdd(qna);
		mav.setViewName("redirect:qna.hta?pno="+pno);
		return mav;
	}
	
	@RequestMapping("/kurly/center/frequent.hta")
	public ModelAndView frequent(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("kurly/center/frequent2.jsp");
		
		
		
		int pno = CommonUtils.stringToNumber(req.getParameter("pno"), 1);
		
		int size = CommonUtils.stringToNumber(req.getParameter("size"), 10);
		
		
		String category = req.getParameter("category");
		
		String keyword = req.getParameter("keyword");
		
		Criteria criteria = new Criteria();
		
		//카테고리에 값이 비어있을 경우
		if(category != null && !category.isEmpty()) {
			criteria.setCategory(category);
		} 
		
		//키워드에 값이 비어있을 경우
		if(keyword != null && !keyword.isEmpty()) {
		criteria.setKeyword(keyword);
		}
		
		
		criteria.setSize(size);
		criteria.setBeginIndex((pno-1)*size+1);
		criteria.setEndIndex(pno * size);
		
		int recoreds = centerDao.getFreRecords(criteria);
		List<Frequent> frequents = centerDao.getFrequentList(criteria);
		
		Pagination pagination = new Pagination(pno, size, recoreds);
		
		mav.addAttribute("frequent", frequents);
		mav.addAttribute("pagination", pagination);
		return mav;
	}
	/*
	 * @RequestMapping("/kurly/center/frequent.hta") // 자주묻는질문 public ModelAndView
	 * frequent(HttpServletRequest req, HttpServletResponse res) throws Exception {
	 * ModelAndView mav = new ModelAndView();
	 * mav.setViewName("kurly/center/frequent2.jsp");
	 * 
	 * 
	 * //List<Frequent> fre = centerDao.getFre(); //mav.addAttribute("frequent",
	 * fre);
	 * 
	 * 
	 * 
	 * // 페이징 처리 int pno = Integer.parseInt(req.getParameter("pno"));
	 * 
	 * int begin = (pno-1)*10 +1; int end = pno*10;
	 * 
	 * Map<String, Object> map = new HashMap<String, Object>(); map.put("begin",
	 * begin); map.put("end", end);
	 * 
	 * mav.addAttribute("fristpage", begin); mav.addAttribute("pno", pno);
	 * 
	 * List<Frequent> fre = centerDao.getFreRange(map); // List<Board> boards =
	 * boardDao.getAllBoards(); mav.addAttribute("frequent", fre);
	 * 
	 * int totalRecordsCount = centerDao.getFreCount(); int totalPageCount = (int)
	 * Math.ceil((double)totalRecordsCount/10); mav.addAttribute("totalPCount",
	 * totalPageCount);
	 * 
	 * mav.setViewName("kurly/center/frequent.jsp");
	 * 
	 * 
	 * 
	 * return mav;
	 * 
	 * }
	 */
		
	@RequestMapping("/kurly/center/notice.hta") //공지사항
	public ModelAndView notice(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("kurly/center/notice3.jsp");
		
		int pno = CommonUtils.stringToNumber(req.getParameter("pno"), 1);
		
		int size = CommonUtils.stringToNumber(req.getParameter("size"), 20);
	
//		String opt=null;
		
//		String search[] = req.getParameterValues("search");
		
		/*
		 * for(int i=0;i<=search.length;i++) {
		 * 
		 * if(search[i].equals("title")) { opt = "title"; }else { opt = "contents"; } }
		 */
		
		String keyword = req.getParameter("keyword");
		
		Criteria criteria = new Criteria();

		String[] opt2 = req.getParameterValues("search");
		if (opt2 != null) {
			StringJoiner joiner = new StringJoiner("");
			for (String o : opt2) {
				joiner.add(o);
			}
			
			if(keyword != null && !keyword.isEmpty()) {
				criteria.setOption(joiner.toString());
				criteria.setKeyword(keyword);
			}
		}
		criteria.setSize(size);
		criteria.setBeginIndex((pno-1)*size+1);
		criteria.setEndIndex(pno * size);
		
		int recoreds = centerDao.getRecords(criteria);
		List<Notice> notice = centerDao.getNoticeList(criteria);
		
		Pagination pagination = new Pagination(pno, size, recoreds);
		mav.addAttribute("notices", notice);
		mav.addAttribute("pagination", pagination);

		return mav;
	}

	@RequestMapping("/kurly/admin/orderManagement.hta")// 관리자페이지
	public ModelAndView orderManagement(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		String status = req.getParameter("category");
		
		if(status == null) {
			status = "1";
		}
		
		int pno = CommonUtils.stringToNumber(req.getParameter("pno"), 1);
		
		int size = CommonUtils.stringToNumber(req.getParameter("size"), 10);
		
		Criteria criteria = new Criteria();
		
		criteria.setSize(size);
		criteria.setStatus(status);
		
		criteria.setBeginIndex((pno-1)*size+1);
		
		criteria.setEndIndex(pno * size);
		
		
		int recoreds = centerDao.getStatusCount(criteria);
		List<OrderListView> order = centerDao.getStatus(criteria);
	
		Pagination pagination = new Pagination(pno, size,5, recoreds);
		
		mav.addAttribute("order", order);
		mav.addAttribute("pagination", pagination);
		
		mav.setViewName("kurly/admin/orderManagement.jsp");
		return mav;
	}
	
	@RequestMapping("/kurly/center/qna.hta")  // 1:1문의
	public ModelAndView qna(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = req.getSession();
		Customers customers = (Customers)session.getAttribute("LOGINCUSTOMER");
		if (customers == null) {
			mav.setViewName("redirect:/mj/kurly/customers/loginform.hta?result=fail");
			return mav;
		}
		
		int pno =  Integer.parseInt(req.getParameter("pno"));		
		int begin = (pno-1)*10+1;
		int end = pno * 10;

		if("관리자".equals(customers.getStatus())) {
		
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("begin", begin);
			map.put("end",end);
			
			
			List<OneQna> qna = centerDao.getAdminQnaList(map);
			mav.addAttribute("Qna", qna);
			
			mav.addAttribute("pno", pno);

			int totalRecordsCount = centerDao.getAdiminQnaCount();
			int totalPageCount = (int) Math.ceil((double)totalRecordsCount/10);
			mav.addAttribute("totalPCount", totalPageCount);
			
			mav.setViewName("kurly/center/qna.jsp");
			
			
			
		} else {
			
			String cusId = customers.getId();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("begin", begin);
			map.put("end",end);
			map.put("id",cusId);
			
			List<OneQna> qna = centerDao.getQnaList(map);
			mav.addAttribute("Qna", qna);
			
			mav.addAttribute("pno", pno);
	
			int totalRecordsCount = centerDao.getQnaCount(cusId);
			int totalPageCount = (int) Math.ceil((double)totalRecordsCount/10);
			mav.addAttribute("totalPCount", totalPageCount);
			
			mav.setViewName("kurly/center/qna.jsp");
		}
//		// 페이징 처리
//		int pno = Integer.parseInt(req.getParameter("pno"));
//		
//		int begin = (pno-1)*10+1;
//		int end = pno * 10;
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("begin", begin);
//		map.put("end",end);
//		
//		List<Notice> not = centerDao.getNotRange(map);
//		mav.addAttribute("notice", not);
//		
//		
//		mav.addAttribute("pno", pno);
//		
//		int totalRecordsCount = centerDao.getNotCount();
//		int totalPageCount = (int) Math.ceil((double)totalRecordsCount/10);
//		mav.addAttribute("totalPCount", totalPageCount);
//		
//		
//		mav.setViewName("kurly/center/notice.jsp");
		return mav;
	}
	@RequestMapping("/kurly/center/qna-add.hta")
	public ModelAndView qnaAdd(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		String category = req.getParameter("categorylist");
		String title = req.getParameter("title");
		int orderNo =CommonUtils.stringToNumber(req.getParameter("orderListNo"), 0000000);
		String contents = req.getParameter("contentsqna");
		
		
		
		HttpSession session = req.getSession();
		Customers customers = (Customers)session.getAttribute("LOGINCUSTOMER");
		
		String id = customers.getId();
		
		OneQna qna = new OneQna();
		qna.setCategory(category);
		qna.setTitle(title);
		qna.setOrderNo(orderNo);
		qna.setContents(contents);
		qna.setCusId(id);
		
		centerDao.qnaAdd(qna);
		
		mav.setViewName("redirect:qna.hta?pno=1");
		
		return mav;
	}
	@RequestMapping("/kurly/center/qna-writer.hta") // 1:1문의 폼
	public ModelAndView qnaDetail(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		
		HttpSession session = req.getSession();
		Customers customers = (Customers)session.getAttribute("LOGINCUSTOMER");
		if (customers == null) {
			mav.setViewName("redirect:/mj/kurly/customers/loginform.hta?result=fail");
			return mav;
		}
		String pno = req.getParameter("pno");
		String id = customers.getId();
		
		List<OrderListView> order = centerDao.getOrderList(id);
		mav.addAttribute("pno", pno);
		mav.addAttribute("order", order);
		mav.setViewName("kurly/center/qna-writer.jsp");
		return mav;
	}
	
	@RequestMapping("/kurly/center/notice-detail.hta") // 공지사항 내부글
	public ModelAndView noticeDetail(HttpServletRequest req, HttpServletResponse res) throws Exception {
	
		ModelAndView mav = new ModelAndView();
		
		int no = Integer.parseInt(req.getParameter("no"));
		centerDao.notViewUpdate(no);
		
		Notice notice = centerDao.notdetail(no);
		Notice nextPrev = centerDao.nextPrev(no);
		
		
		mav.addAttribute("notice", notice);
		mav.addAttribute("list", nextPrev);
		
		mav.setViewName("kurly/center/notice-detail.jsp");
		
		
		return mav;
	}


	
	
//	// 공지사항 --> 제목/내용으로 글검색하기
//	@RequestMapping("/kurly/center/notice2.hta")
//	public ModelAndView noticeSerch(HttpServletRequest req, HttpServletResponse res) throws Exception {
//		ModelAndView mav = new ModelAndView();
//		String list = req.getParameter("search");
//		String noticeContent = req.getParameter("noitceContent");
//		
//		int pno = Integer.parseInt(req.getParameter("pno"));
//		
//		int begin = (pno-1)*10+1;
//		int end = pno * 10;
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("begin", begin);
//		map.put("end", end);
//		map.put("content",noticeContent);
//		
//		mav.addAttribute("pno", pno);
//		
//		
//		if("내용".equals(list)) {
//			List<Notice> notice = centerDao.getNotById(map);
//			mav.addAttribute("notice2", notice);
//			
//			int totalRecordsCount = centerDao.getNotByTitleCount(noticeContent);
//			int totalPageCount = (int) Math.ceil((double)totalRecordsCount/10);
//			mav.addAttribute("totalPCount", totalPageCount);	
//		}
//		
//		if ("제목".equals(list)) {
//			List<Notice> notice = centerDao.getNotByTitle(map);
//			mav.addAttribute("notice2", notice);
//			
//			int totalRecordsCount = centerDao.getNotByContentCount(noticeContent);
//			int totalPageCount = (int) Math.ceil((double)totalRecordsCount/10);
//			mav.addAttribute("totalPCount", totalPageCount);
//		}
//		
//				
//		
//		mav.setViewName("kurly/center/notice2.jsp");
//
//	
//		return mav;
//	}
}
