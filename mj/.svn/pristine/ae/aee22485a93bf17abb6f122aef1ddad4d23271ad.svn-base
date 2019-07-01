 package kr.co.mj.controller;

import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;

import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;
import kr.co.jhta.mvc.view.JSONView;
import kr.co.mj.dao.CustomerDao;
import kr.co.mj.util.CommonUtils;
import kr.co.mj.util.FormatUtil;
import kr.co.mj.util.MailUtils;
import kr.co.mj.vo.Criteria;
import kr.co.mj.vo.Customers;
import kr.co.mj.vo.MailPassword;
import kr.co.mj.vo.Pagination;

@Controller
public class CustomerController {
	
	CustomerDao cusDao = new CustomerDao();
	
	@RequestMapping("/kurly/customers/logout.hta")
	public ModelAndView logout(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/mj/kurly/main.hta");
		
		HttpSession session = req.getSession();
		session.invalidate();
		
		return mav;
	}
	
	@RequestMapping("/kurly/customers/loginform.hta")
	public ModelAndView loginform(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("kurly/customers/loginform.jsp");
		return mav;
	}
	
	@RequestMapping("/kurly/customers/login.hta")
	public ModelAndView login(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		String id = req.getParameter("userid");
		String pwd = req.getParameter("userpwd");
		String repwd = DigestUtils.md5Hex(pwd); 
		
		Customers cust = cusDao.getCustomerById(id);
		
		
		
		if(cust == null) {
			mav.setViewName("redirect:loginform.hta?result=nullfail");
			
			return mav;
		}
		
		if(cust.getUsedYn().equals("N")) {
			mav.setViewName("redirect:loginform.hta?result=nofail");
			return mav;
		}
		
		if(!cust.getPwd().equals(repwd)) {
			mav.setViewName("redirect:loginform.hta?result=neqfail");
			return mav;
		}
		
		HttpSession session = req.getSession();
		session.setAttribute("LOGINCUSTOMER", cust);
		mav.setViewName("redirect:/mj/kurly/main.hta");
		
		return mav;
	}
	
	@RequestMapping("/kurly/customers/addCustomer.hta")
	public ModelAndView addCustomer(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("kurly/customers/addCustomer.jsp");
		
		
		return mav;
	}
	
	@RequestMapping("/kurly/customers/register.hta")
	public ModelAndView addCustomerform(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		

		String pwd = req.getParameter("userpwd");
		String name = req.getParameter("username");
		String id = req.getParameter("userid");
		String gender = req.getParameter("usergender");
		
		String userbir1 = "null";
		String userbir2 = "null";
		String userbir3 = "null";
		
		if(!req.getParameter("userbir1").isEmpty()) {
			userbir1 = req.getParameter("userbir1");
		}
		if(!req.getParameter("userbir2").isEmpty()) {
			userbir2 = req.getParameter("userbir2");
		}
		if(!req.getParameter("userbir3").isEmpty()) {
			userbir3 = req.getParameter("userbir3");
		}
		
		String birthday = userbir1 +"-"+ userbir2 +"-"+ userbir3;
		
		FormatUtil formatUtil = new FormatUtil();
		String phoneNumber = req.getParameter("phoneNumber");
		
		String phonenum = formatUtil.phone(phoneNumber);
		
		String add1 = "null";
		String add2 = "";
		
		if(!req.getParameter("useraddr1").isEmpty()) {
			add1 = req.getParameter("useraddr1");
		}
		
		if(!req.getParameter("useraddr2").isEmpty()) {
			add2 = req.getParameter("useraddr2");
		}
		
		String address = add1 +" "+ add2;
		String email = req.getParameter("useremail");
		
		String md5Password = DigestUtils.md5Hex(pwd);
		
		Customers cust = new Customers();
		cust.setAddress(address);
		cust.setBirthday(birthday);
		cust.setEmail(email);
		cust.setGender(gender);
		cust.setId(id);
		cust.setPwd(md5Password);
		cust.setPhoneNumber(phonenum);
		cust.setName(name);
		
		cusDao.insertCustomer(cust);
		
		name = URLEncoder.encode(name, "utf-8"); 
		
		mav.setViewName("redirect:/mj/kurly/customers/complete.hta?name="+name+"&id="+id+"&email="+email );
		return mav;
	}
	
	@RequestMapping("/kurly/customers/complete.hta")
	public ModelAndView complete(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("kurly/customers/complete.jsp");
		
		String id = req.getParameter("id");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		
		mav.addAttribute("id", id);
		mav.addAttribute("name", name);
		mav.addAttribute("email", email);
		
		return mav;
	}
	
	@RequestMapping("/kurly/customers/searchById.hta")
	public ModelAndView searchById(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("kurly/customers/searchById.jsp");
		
		
		
		return mav;
	}
	
	@RequestMapping("/kurly/customers/searchByIdRegister.hta")
	public ModelAndView searchByIdRegister(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		String id = cusDao.getCustomer(req.getParameter("useremail"));
		
		mav.setViewName("redirect:/mj/kurly/customers/searchByIdComplete.hta?id="+id);
		
		return mav;
	}
	
	@RequestMapping("/kurly/customers/searchByIdComplete.hta")
	public ModelAndView searchByIdComplete(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("kurly/customers/searchByIdComplete.jsp");
		String id = req.getParameter("id");
		
		mav.addAttribute("userId", id);
		
		
		return mav;
	}
	
	@RequestMapping("/kurly/customers/searchByPwd.hta")
	public ModelAndView searchByPwd(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("kurly/customers/searchByPwd.jsp");
		
		return mav;
	}
	
	@RequestMapping("/kurly/customers/searchByPwd-useremail.hta")
	public ModelAndView searchByPwdRegister(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();

		String email = req.getParameter("useremail");
		
		Customers cust = new Customers();
		
		MailPassword mailpwd = new MailPassword();
		
		String code = mailpwd.excuteGenerate();
		
		System.out.println(email);
		System.out.println(code);
		
		MailUtils.sendMail(email, code);
		
		cust.setEmail(email);
		cust.setCode(code);
		
		HttpSession session = req.getSession();
		session.setAttribute("CHANGEPWD", cust);
		
		
		mav.setView(new JSONView());
		return mav;
	}
	
	@RequestMapping("/kurly/customers/searchByPwdComplete.hta")
	public ModelAndView changepwd(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("kurly/customers/searchByPwdComplete.hta");
		
		return mav;
	}
	
	@RequestMapping("/kurly/customers/addCustomer-id.hta")
	public ModelAndView checkId(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		
		String id = req.getParameter("id");
		
		if(id == null || "".equals(id)) {
			mav.addAttribute("exist", "Nnull");
		} else {
			Customers cust = cusDao.getCustomerById(id);
			if (cust == null) {
				mav.addAttribute("exist", "Y");
			} else {
				mav.addAttribute("exist", "N");
			}
			
		}
		mav.setView(new JSONView());
		
		
		return mav;
	}
	@RequestMapping("/kurly/customers/addCustomer-email.hta")
	public ModelAndView checkEmail(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		String email = req.getParameter("email");
		
		Customers cust = cusDao.getCustomerByEmail(email);
		if (cust == null) {
			mav.addAttribute("exist", "Y");
		} else {
			mav.addAttribute("exist", "N");
		}
		
		mav.setView(new JSONView());
		
		return mav;
	}
	
	
	
	// 여기부턴 관리자 페이지 멮핑
	
	// 회원관리
	@RequestMapping("/kurly/admin/management.hta")
	public ModelAndView getAllCustomer(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("kurly/admin/management.jsp");
		
		int pno = CommonUtils.stringToNumber(req.getParameter("pno"), 1);
		int size = 10;
		
		Criteria criteria = new Criteria();
		criteria.setSize(size);
		criteria.setBeginIndex((pno - 1)*size + 1);
		criteria.setEndIndex(pno*size);
		
		int records = cusDao.customerPagination();
		
		List<Customers> customers = cusDao.adminGetCustomer(criteria);
		
		Pagination pagination = new Pagination(pno, size, records);
		
		mav.addAttribute("customers", customers);
		mav.addAttribute("pagination", pagination);
		
		return mav;
	}
	
	@RequestMapping("/kurly/admin/managementregister.hta")
	public ModelAndView managementregister(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		String id = req.getParameter("id");
		String usedYn = req.getParameter("usedYn");
		
		Customers customers = cusDao.getCustomerById(id);
		customers.setUsedYn(usedYn);
		
		cusDao.updateStatus(customers);
		
		mav.setViewName("redirect:/mj/kurly/admin/management.hta");

		return mav;
	}
	
	@RequestMapping("/kurly/admin/managementre.hta")
	public ModelAndView managementre(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		String id = req.getParameter("id");
		String status = req.getParameter("status");
		
		Customers customers = cusDao.getCustomerById(id);
		customers.setStatus(status);
		
		cusDao.updateStatus(customers);
		
		System.out.println(status + id);
		System.out.println(customers.getName()); 
		
		if("member".equals(status)) {
			customers.setStatus(status);
		} else if("admin".equals(status)) {
			customers.setStatus(status);
		}
		
		mav.setViewName("redirect:/mj/kurly/admin/management.hta");
		
		return mav;
	}
	
	@RequestMapping("/kurly/admin/management-status.hta")
	public ModelAndView updatestatus(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		String id = req.getParameter("id");
		String status = req.getParameter("status");
		
		System.out.println(id);
		System.out.println(status);
		
//		Customers cust = cusDao.getCustomerByEmail(email);
//		mav.setView(new JSONView());
		
		Customers cust = cusDao.getCustomerById(id);
		cust.setStatus(status);
		
		cusDao.updateStatus(cust);
		
		if("관리자".equals(status)) {
			mav.addAttribute("status", "admin");
		} else if("회원".equals(status)) {
			mav.addAttribute("status", "member");
		}
		
		mav.setView(new JSONView());
		
		return mav;
	}
	
//	@RequestMapping("/kurly/customers/addCustomer-email.hta")
//	public ModelAndView checkEmail(HttpServletRequest req, HttpServletResponse res) throws Exception {
//		ModelAndView mav = new ModelAndView();
//		
//		String email = req.getParameter("email");
//		
//		Customers cust = cusDao.getCustomerByEmail(email);
//		if (cust == null) {
//			mav.addAttribute("exist", "Y");
//		} else {
//			mav.addAttribute("exist", "N");
//		}
//		
//		mav.setView(new JSONView());
//		
//		return mav;
//	}
//	
	
	
	
}
