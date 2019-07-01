package kr.co.mj.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;

import com.oreilly.servlet.MultipartRequest;

import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;
import kr.co.jhta.mvc.view.JSONView;
import kr.co.mj.dao.CustomerDao;
import kr.co.mj.dao.MypageDao;
import kr.co.mj.dao.OrderDao;
import kr.co.mj.dao.ProductDao;
import kr.co.mj.util.CommonUtils;
import kr.co.mj.util.FormatUtil;
import kr.co.mj.vo.Cart;
import kr.co.mj.vo.Criteria;
import kr.co.mj.vo.CustQuitInfo;
import kr.co.mj.vo.Customers;
import kr.co.mj.vo.LikesProduct;
import kr.co.mj.vo.OrderListView;
import kr.co.mj.vo.Orders;
import kr.co.mj.vo.Pagination;
import kr.co.mj.vo.PointHistory;
import kr.co.mj.vo.Product;
import kr.co.mj.vo.Review;

@Controller
public class MypageController {

	private MypageDao mypageDao = new MypageDao();
	private CustomerDao customerDao = new CustomerDao();
	private OrderDao orderDao = new OrderDao();
	private ProductDao productDao = new ProductDao();
	
	@RequestMapping("/kurly/mypage/wishlist.hta")
	public ModelAndView wishlist(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("kurly/mypage/wishlist.jsp");
		
		HttpSession session= req.getSession();
		Customers cust = (Customers)session.getAttribute("LOGINCUSTOMER");
		
		if (cust == null)  {
			mav.setViewName("redirect:/mj/kurly/customers/loginform.hta?result=fail");
			return mav;
		}
	
		List<Product> products = mypageDao.getLikedProductsById(cust.getId());
		
		mav.addAttribute("products", products);
		
		return mav;
	}
	
	/* 늘사는 것 전체상품 카트로 담고 카트로 리다이렉트하기 */
	@RequestMapping("/kurly/mypage/addAllProductIntoCart.hta")
	public ModelAndView addAllProductIntoCart(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = req.getSession();
		Customers cust = (Customers) session.getAttribute("LOGINCUSTOMER");
		
		List<Product> products = mypageDao.getLikedProductsById(cust.getId());
		for(Product product : products) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("custId", cust.getId());
			map.put("proNo", product.getNo());
			Cart cart = orderDao.getCartByCustIdAndProNo(map);
			
			if(cart == null) {
				Cart ca = new Cart();
				ca.setCartAmount(1);
				ca.setCustId(cust.getId());
				ca.setProNo(product.getNo());
				
				orderDao.addProductIntoTheCart(ca);
			}
		}
		
		mav.setViewName("redirect:/mj/kurly/orders/cart.hta");
		return mav;
	}
	
	@RequestMapping("/kurly/mypage/deleteLike.hta")
	public ModelAndView deleteLike(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = req.getSession();
		Customers customer = (Customers) session.getAttribute("LOGINCUSTOMER");
		
		// String id = req.getParameter("userid");
		int proNoForDelete = Integer.parseInt(req.getParameter("proNoForDelete"));
		
		LikesProduct likesProduct = new LikesProduct();

		likesProduct.setCustId(customer.getId());
		likesProduct.setProNo(proNoForDelete);
		
		mypageDao.deleteLike(likesProduct);
		
		mav.setViewName("redirect:wishlist.hta");

		return mav;
	}
	
	@RequestMapping("/kurly/mypage/deleteAllLikes.hta")
	public ModelAndView deleteAllLikes(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = req.getSession();
		Customers customer = (Customers) session.getAttribute("LOGINCUSTOMER");
		
		// String id = req.getParameter("userid");
		
		mypageDao.deleteAllLikes(customer.getId());
		
		mav.setViewName("/kurly/mypage/wishlist.jsp");

		return mav;
	}
	
	@RequestMapping("/kurly/mypage/viewBeforeList.hta")
	public ModelAndView viewBeforeList(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		
		 HttpSession session = req.getSession(); 
		 Customers customers =(Customers)session.getAttribute("LOGINCUSTOMER");
		  
		 if(customers == null) {
				mav.setViewName("redirect:/mj/kurly/customers/loginform.hta?result=fail");
				return mav;
		 }
		 
		 List<OrderListView> list = mypageDao.getdelfinorderlist(customers.getId());
		 
		 
		 
		 
		 int canWriteAmount = mypageDao.getBeforeAmountById(customers.getId());// 0605 추가함. 작성가능 후기 개수
		 int FinishedAmount = mypageDao.getAfterAmountById(customers.getId());// 0605 추가함. 작성완료 후기 개수
		 
		 mav.addAttribute("list", list);
		 mav.addAttribute("canWriteAmount", canWriteAmount);		// 0605 추가함.
		 mav.addAttribute("FinishedAmount", FinishedAmount);		// 0605 추가함.
		 
		 mav.setViewName("kurly/mypage/viewBeforeList.jsp");
		
		return mav;
	}

	@RequestMapping("/kurly/mypage/reviewWrite.hta")
	public ModelAndView reviewWrite(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		
		 HttpSession session = req.getSession(); 
		 Customers customers =(Customers)session.getAttribute("LOGINCUSTOMER");
		  
		 if(customers == null) {
				mav.setViewName("redirect:/mj/kurly/customers/loginform.hta?result=fail");
				return mav;
		 }
		 
		
		int no = Integer.parseInt(req.getParameter("pro"));
		
		ProductDao productDao = new ProductDao();
		Product product = productDao.getProductByNo(no);
		
		mav.addAttribute("product", product);
		
		
		mav.setViewName("kurly/mypage/reviewWrite.jsp");
		return mav;
	}
	
	@RequestMapping("/kurly/mypage/reviewEditPage.hta")
	public ModelAndView reviewEditPage(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		
		 HttpSession session = req.getSession(); 
		 Customers customers =(Customers)session.getAttribute("LOGINCUSTOMER");
		  
		 if(customers == null) {
				mav.setViewName("redirect:/mj/kurly/customers/loginform.hta?result=fail");
				return mav;
		 }
		 
		
		int no = Integer.parseInt(req.getParameter("reviewNo"));
		
		Review review = mypageDao.getReviewByNo(no);
		Product product = productDao.getProductByNo(review.getProNo());
		
		mav.addAttribute("review", review);
		mav.addAttribute("product", product);
		
		mav.setViewName("kurly/mypage/reviewEdit.jsp");
		return mav;
	}
//

	@RequestMapping("/kurly/mypage/editReview.hta")
	public ModelAndView editReview(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = req.getSession(); 
		Customers customers =(Customers)session.getAttribute("LOGINCUSTOMER");
		
		if(customers == null) {
			mav.setViewName("redirect:/mj/kurly/customers/loginform.hta?result=fail");
			return mav;
		}
		
		MultipartRequest mr = new MultipartRequest(req,"C:/projects/web_workspace/mj/WebContent/images/mypage","utf-8");
		
		int no = Integer.parseInt(mr.getParameter("no"));
		String title = mr.getParameter("subject");
		String content = mr.getParameter("content");
		String img = mr.getFilesystemName("file");
		int prono = Integer.parseInt(mr.getParameter("prono"));
		
		
		Review review = new Review();
		
		review.setNo(no);
		review.setTitle(title);
		review.setContent(content);
		review.setImg(img);
		review.setProNo(prono);
		review.setUsedYn("Y");
		review.setCustId(customers.getId());
		
		mypageDao.updateReview(review);

		mav.setViewName("redirect:/mj/kurly/mypage/viewAfterList.hta");
		
		return mav;
	}

	
	@RequestMapping("/kurly/mypage/deleteReview.hta")
	public ModelAndView deleteReview(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = req.getSession(); 
		Customers customers =(Customers)session.getAttribute("LOGINCUSTOMER");
		
		if(customers == null) {
				mav.setViewName("redirect:/mj/kurly/customers/loginform.hta?result=fail");
				return mav;
		 }
		
		int no = Integer.parseInt(req.getParameter("reviewNo"));
		
		Review review = mypageDao.getReviewByNo(no);
		review.setUsedYn("N");
		mypageDao.updateReview(review);
		
		mav.setViewName("redirect:viewAfterList.hta");
		
		
		return mav;
	}

	@RequestMapping("/kurly/mypage/reopen.hta")
	public ModelAndView reopen(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = req.getSession(); 
		Customers customers =(Customers)session.getAttribute("LOGINCUSTOMER");
		
		if(customers == null) {
				mav.setViewName("redirect:/mj/kurly/customers/loginform.hta?result=fail");
				return mav;
		 }
		
		int no = Integer.parseInt(req.getParameter("reviewNo"));
		
		Review review = mypageDao.getReviewByNo(no);
		review.setUsedYn("Y");
		mypageDao.updateReview(review);
		
		mav.setViewName("redirect:viewAfterList.hta");
		
		
		return mav;
	}
	
	
	
	@RequestMapping("/kurly/mypage/addReview.hta")
	public ModelAndView addReview(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		
		 HttpSession session = req.getSession(); 
		 Customers customers =(Customers)session.getAttribute("LOGINCUSTOMER");
		  
		 if(customers == null) {
				mav.setViewName("redirect:/mj/kurly/customers/loginform.hta?result=fail");
				return mav;
		 }
		MultipartRequest mr = new MultipartRequest(req,"C:/projects/web_workspace/mj/WebContent/images/mypage","utf-8");
		
		String title = mr.getParameter("subject");
		String content = mr.getParameter("content");
		String img = mr.getFilesystemName("file");
		int prono = Integer.parseInt(mr.getParameter("prono"));
		
		
		Review review = new Review();
		
		review.setContent(content);
		review.setProNo(prono);
		review.setImg(img);
		review.setTitle(title);
		review.setCustId(customers.getId());
		
		mypageDao.insertReview(review);

		mav.setViewName("redirect:/mj/kurly/mypage/viewAfterList.hta");
		
		return mav;
	}
	
	@RequestMapping("/kurly/mypage/viewAfterList.hta")
	public ModelAndView viewAfterList(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		 HttpSession session = req.getSession(); 
		 Customers customers =(Customers)session.getAttribute("LOGINCUSTOMER");
		  
		 if(customers == null) {
				mav.setViewName("redirect:/mj/kurly/customers/loginform.hta?result=fail");
				return mav;
		 }
		 
		 List<Review> reviews = mypageDao.getFinishedReviewsById(customers.getId());
		 int canWriteAmount = mypageDao.getBeforeAmountById(customers.getId());// 0605 추가함. 작성가능 후기 개수
		 int FinishedAmount = mypageDao.getAfterAmountById(customers.getId());// 0605 추가함. 작성가능 후기 개수

		 mav.addAttribute("reviews", reviews);
		 mav.addAttribute("canWriteAmount", canWriteAmount);		// 0605 추가함.
		 mav.addAttribute("FinishedAmount", FinishedAmount);		// 0605 추가함.
		 
		 mav.setViewName("kurly/mypage/viewAfterList.jsp");
		
		return mav;
	}

	@RequestMapping("/kurly/mypage/confirmpwd.hta")
	public ModelAndView confirmPwd(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/kurly/mypage/confirmPwd.jsp");
		
		HttpSession session = req.getSession(); 
		Customers customers =(Customers)session.getAttribute("LOGINCUSTOMER");
		  
		if(customers == null) {
			mav.setViewName("redirect:/mj/kurly/customers/loginform.hta?result=fail");
			return mav;
		}
		
		return mav;
	}
	
	@RequestMapping("/kurly/mypage/pwdcheck.hta")
	public ModelAndView pwdcheck(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();

		String id = req.getParameter("userid");
		String pwd = req.getParameter("userpwd");
		String md5Password = DigestUtils.md5Hex(pwd);
		Customers cust = customerDao.getCustomerById(id);
		
		if(!cust.getPwd().equals(md5Password)) {
			mav.setViewName("redirect:confirmpwd.hta?result=fail");
			return mav;
		}
		
		mav.setViewName("redirect:/mj/kurly/mypage/modifyform.hta");
		
		return mav;
	}
	
	@RequestMapping("/kurly/mypage/memberQuit.hta")
	public ModelAndView memberQuit(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("kurly/mypage/memberQuit.jsp");
		
		return mav;
	}
	
	@RequestMapping("/kurly/mypage/quitcheck.hta")
	public ModelAndView quitcheck(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		String id = req.getParameter("userid");
		String pwd = req.getParameter("userpwd");
		String md5Password = DigestUtils.md5Hex(pwd);					
		String service = req.getParameter("service");
		String delivery = req.getParameter("delivery");
		String refund = req.getParameter("refund");
		String frequency = req.getParameter("frequency");
		String price = req.getParameter("price");
		String privacy = req.getParameter("privacy");
		String trust = req.getParameter("trust");
		String site = req.getParameter("site");
		String advice = req.getParameter("advice");
		
		Customers cust = customerDao.getCustomerById(id);
		
		if(!cust.getPwd().equals(md5Password)) {						
			mav.setViewName("redirect:memberQuit.hta?result=fail");
			return mav;
			
		}
		
		CustQuitInfo custQuitInfo = new CustQuitInfo();
		custQuitInfo.setQuitId(id);
		custQuitInfo.setService(service);
		custQuitInfo.setDelivery(delivery);
		custQuitInfo.setRefund(refund);
		
		custQuitInfo.setFrequency(frequency);
		custQuitInfo.setPrice(price);
		custQuitInfo.setPrivacy(privacy);
		custQuitInfo.setTrust(trust);
		custQuitInfo.setSite(site);
		custQuitInfo.setAdvice(advice);
		
		mypageDao.addCustQuitInfo(custQuitInfo);
		
		mav.setViewName("redirect:/mj/kurly/customers/logout.hta");

		// 해당하는 아이디의 cust_used_Yn을 바꾸는 메소드
		mypageDao.updateUsedYn(id);
		
		return mav;
	}
	
	
	
	/// 나경
	

	@RequestMapping("/kurly/mypage/mypoint.hta")
	public ModelAndView point(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/kurly/mypage/myPoint.jsp");
		
		int pno = CommonUtils.stringToNumber(req.getParameter("pno"), 1);
		int size = CommonUtils.stringToNumber(req.getParameter("size"), 5);
		
		HttpSession session = req.getSession();
		Customers cust = (Customers) session.getAttribute("LOGINCUSTOMER");
		
		if(cust == null) {
			mav.setViewName("redirect:/mj/kurly/customers/loginform.hta");
			return mav;
		}
		
		String id = cust.getId();
		
		Criteria criteria = new Criteria();
		criteria.setSize(size);
		criteria.setBeginIndex((pno-1)*size+1);
		criteria.setEndIndex(pno*size);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("beginIndex", criteria.getBeginIndex());
		map.put("endIndex", criteria.getEndIndex());
				
		int records = mypageDao.getMypointRecords(map);
		List<PointHistory> mypoint = mypageDao.getMypoint(map);
		Pagination pagination = new Pagination(pno, size, records);
		
		mav.addAttribute("mypoint", mypoint);
		mav.addAttribute("pagination", pagination);
		
		return mav;
	}
	
	@RequestMapping("/kurly/mypage/modifyform.hta")
	public ModelAndView modifyform(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/kurly/mypage/modifyform.jsp");
		
		HttpSession session = req.getSession();
		Customers cust = (Customers) session.getAttribute("LOGINCUSTOMER");
		
		if(cust == null) {
			mav.setViewName("redirect:/mj/kurly/customers/loginform.hta");
			return mav;
		}
		
		return mav;
	}
	
	@RequestMapping("/kurly/mypage/ckeckemail.hta")
	public ModelAndView ckeckEmail(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();
		
		HttpSession session = req.getSession();
		Customers customer = (Customers) session.getAttribute("LOGINCUSTOMER");
		
		String email = req.getParameter("email");
		
		Customers cust = customerDao.getCustomerByEmail(email);
		if(cust == null) {
			mav.addAttribute("exist", "Y");
		} else if(email.equals(customer.getEmail())) {
			mav.addAttribute("exist", "Y");
		} else {
			mav.addAttribute("exist", "N");
		}
		
		mav.setView(new JSONView());

		return mav;
	}
	
	@RequestMapping("/kurly/mypage/complete.hta")
	public ModelAndView complete(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();
		mav.setView(new JSONView());
		
		try {
			HttpSession session = req.getSession();
			Customers customer = (Customers) session.getAttribute("LOGINCUSTOMER");
			
			if(customer == null) {
				mav.setViewName("redirect:/mj/kurly/customers/loginform.hta");
				return mav;
			}
			
			String md5Password = null;
			
			String pwd = req.getParameter("newPwd");
			String name = req.getParameter("name");
			String email = req.getParameter("custEmail");
			String phone = req.getParameter("phone");
			
			String phonenumber = FormatUtil.phone(phone);
			
			String gender = req.getParameter("gender");
			String birthday = req.getParameter("birth");
			String agree = req.getParameter("personalData");
			
			
			Customers cust = new Customers();
			cust.setId(customer.getId());
			
			if(pwd == null || pwd.equals("")) {
				pwd = customer.getPwd();
				cust.setPwd(pwd);
			} else {
				md5Password = DigestUtils.md5Hex(pwd);
				cust.setPwd(md5Password);
			}
			
			cust.setName(name);
			
			if(email.equals(customer.getEmail())) {
				mav.addAttribute("checkEmail", "Y");
			} else {
				mav.addAttribute("checkEmail", "N");
			}
			
			cust.setEmail(email);
			cust.setPhoneNumber(phonenumber);
			cust.setAddress(customer.getAddress());
			cust.setGender(gender);
			
			if(birthday == null || birthday.equals("")) {
				cust.setBirthday("null-null-null");
			} else {
				cust.setBirthday(birthday);
			}
			
			if(agree == null || agree.equals("")) {
				cust.setAgree("false");
			} else {
				cust.setAgree(agree);
			}
			
			mypageDao.modifyMyInfo(cust);
			
			Customers customerD = customerDao.getCustomerById(customer.getId());
			
			session.setAttribute("LOGINCUSTOMER", customerD);		
			mav.addAttribute("result", "Y");

		} catch(Exception e) {
			e.printStackTrace();
			mav.addAttribute("result", "N");
		}
		return mav;
	}
	
	@RequestMapping("/kurly/mypage/orderlist.hta")
	public ModelAndView orderlist(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/kurly/mypage/orderlist.jsp");
		
		int pno = CommonUtils.stringToNumber(req.getParameter("pno"), 1);
		int size = CommonUtils.stringToNumber(req.getParameter("size"), 5);
		String year = req.getParameter("year");
		
		HttpSession session = req.getSession();
		Customers cust = (Customers) session.getAttribute("LOGINCUSTOMER");
				
		if(cust == null) {
			mav.setViewName("redirect:/mj/kurly/customers/loginform.hta");
			return mav;
		}
		
		String id = cust.getId();
		
		Criteria criteria = new Criteria();
		criteria.setSize(size);
		criteria.setBeginIndex((pno-1)*size+1);
		criteria.setEndIndex(pno*size);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("beginIndex", criteria.getBeginIndex());
		map.put("endIndex", criteria.getEndIndex());
		if (!"all".equals(year)) {
			map.put("year", year);
		}
				
		int records = mypageDao.getOrderListRecords(map);
		List<OrderListView> orderlistpro = mypageDao.getOrderListProduct(map);
		mav.addAttribute("orderlistpro", orderlistpro);
		
		Pagination pagination = new Pagination(pno, size, records);
		mav.addAttribute("pagination", pagination);
				
		return mav;
	}
	
	@RequestMapping("/kurly/mypage/orderlistdetail.hta")
	public ModelAndView orderlistdetail(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/kurly/mypage/orderlistdetail.jsp");
		
		HttpSession session = req.getSession();
		Customers cust = (Customers) session.getAttribute("LOGINCUSTOMER");
		
		if(cust == null) {
			mav.setViewName("redirect:/mj/kurly/customers/loginform.hta");
			return mav;
		}
		
		String id = cust.getId();
		
		int orderNo = Integer.parseInt(req.getParameter("orderNo"));
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("orderNo", orderNo);
		
		List<OrderListView> orderListDetailPro = mypageDao.getOrderDetailProduct(map);
		mav.addAttribute("orderListDetailPro", orderListDetailPro);
		
		OrderListView orderDetailInfo = mypageDao.getOrderDetailInfo(map);
		mav.addAttribute("orderDetailInfo", orderDetailInfo);

		return mav;
	}
}
