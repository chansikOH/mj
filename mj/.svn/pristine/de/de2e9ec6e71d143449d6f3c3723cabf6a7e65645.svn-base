package kr.co.mj.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.net.httpserver.Authenticator.Success;

import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;
import kr.co.jhta.mvc.view.JSONView;
import kr.co.mj.dao.CustomerDao;
import kr.co.mj.dao.OrderDao;
import kr.co.mj.vo.Cart;
import kr.co.mj.vo.CartInfo;
import kr.co.mj.vo.Customers;
import kr.co.mj.vo.ShortCartInfo;

@Controller
public class OrderController {
	
	OrderDao orderDao = new OrderDao();

	// 상품 장바구니에 담기 
	@RequestMapping("/kurly/orders/addProduct.hta")
	public ModelAndView addProductIntoTheCart(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		mav.setView(new JSONView());
		try {
			int cartAmount = Integer.parseInt(req.getParameter("cartAmount")); 
			int proNo = Integer.parseInt(req.getParameter("proNo")); 
			HttpSession session = req.getSession();
			Customers cust = (Customers) session.getAttribute("LOGINCUSTOMER");
			
			if (cust == null) {
				mav.addAttribute("success", "LoginFail");
				return mav;
			} 
		
			List<Cart> carts = orderDao.getAllCartByCustid(cust.getId());
			for (Cart cart: carts) {
				if(cart.getProNo() == proNo ) {
					mav.addAttribute("success", "Same");
					return mav;
				}
			}
			
			Cart cart = new Cart();
			cart.setCartAmount(cartAmount);
			cart.setProNo(proNo);
			cart.setCustId(cust.getId());
			
			orderDao.addProductIntoTheCart(cart);
			
			int cartCount = orderDao.getCartCountByCustId(cust.getId());
			session.setAttribute("headCartCount", cartCount);
			mav.addAttribute("headCartCount", cartCount);
			mav.addAttribute("success", "YES");
			
		} catch (Exception e) {
			e.printStackTrace();
			mav.addAttribute("success", "No");
		}
		return mav;
	}
	
	// 장바구니 기본정보 (리로딩)
	@RequestMapping("/kurly/orders/cart.hta")
	public ModelAndView basket(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("kurly/orders/cart.jsp");
		
		HttpSession session= req.getSession();
		Customers cust = (Customers)session.getAttribute("LOGINCUSTOMER");
		if (cust == null)  {
			mav.setViewName("redirect:/mj/kurly/customers/loginform.hta?result=fail");
			return mav;
		}	
		String custId = cust.getId();
	 
		List<CartInfo> cartInfos = orderDao.getAllCartInfo(custId);
		
	
		int posiblePro = 0;				// 품절상품을 제외한 장바구니 상품 		
		
		for (CartInfo info : cartInfos) {
			
			if(info.getUsedYn().equals("Y")) {
				posiblePro += 1;
			}
			
		}
		
		mav.addAttribute("cartInfos", cartInfos);
		mav.addAttribute("cartCount", posiblePro);
	
		return mav;
	}
	
	
	@RequestMapping("/kurly/orders/deletecartitem.hta")
	public ModelAndView cartdelete(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		try {
			int cartNo= Integer.parseInt(req.getParameter("cartNo"));
			orderDao.deleteCartProduct(cartNo);
			mav.addAttribute("success", "YES");
			
		} catch (Exception e) {
			mav.addAttribute("success", "No");
		}
		mav.setView(new JSONView());
		
		return mav;
	}
	
	@RequestMapping("/kurly/orders/deleteallcartitem.hta")
	public ModelAndView deleteallcartitem(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
			HttpSession session= req.getSession();
			Customers cust = (Customers)session.getAttribute("LOGINCUSTOMER");
			String custId = cust.getId();
			
			orderDao.deleteAllProduct(custId);	
			
		mav.setViewName("redirect:cart.hta");
		
		return mav;
	}
	
	@RequestMapping("/kurly/orders/deletesoldoutitems.hta")
	public ModelAndView plusCartAmount(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		try {
			orderDao.deleteSoldoutPro();
			mav.addAttribute("success", "YES");
			
		} catch (Exception e) {
			mav.addAttribute("success", "No");
		}
		mav.setView(new JSONView());
		
		return mav;
	}
	
	@RequestMapping("/kurly/orders/updateProAmount.hta")
	public ModelAndView updateProAmount(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		int cartNo = Integer.parseInt(req.getParameter("cartNo")); 
		String type = req.getParameter("type"); 
		
		Cart cart = orderDao.getCartByCartNo(cartNo); 
		int no = cart.getCartNo();
		int amount = cart.getCartAmount();
		int prono = cart.getProNo();
		String custid = cart.getCustId();
		Date createDate = cart.getCreateDate();
		
		if (type.equals("p")) {
			amount += 1 ;
		} else  {
			amount -= 1 ; 
		}	
		
		Cart newcart = new Cart();
		newcart.setCartNo(no);
		newcart.setCartAmount(amount);
		newcart.setProNo(prono);
		newcart.setCustId(custid);
		newcart.setCreateDate(createDate);
		
		try {
			orderDao.updateProAmount(newcart);  
			mav.addAttribute("success", "YES"); 
			
		} catch (Exception e) {
			mav.addAttribute("success", "No");
		}
		mav.setView(new JSONView());
		
		return mav;

	}
	
	

	
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	@RequestMapping("/kurly/orders/ordersheet.hta")
	public ModelAndView ordersheet(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("kurly/orders/ordersheet.jsp");
		
		// 장바구니에서 체크한 상품 ordersheet에 넘기기 
		String[] checkedCartNos = req.getParameterValues("individualcheckbox");
		
		List<CartInfo> carts = new ArrayList<CartInfo>();
		for (String cartNo : checkedCartNos) {
			CartInfo cart = orderDao.getCartInfoByCartNo(Integer.parseInt(cartNo));
			carts.add(cart);
		}
		mav.addAttribute("cartInfos", carts);

		// 장바구니에서 계산된 최종 금액 가져오기 
		String originalTotalPrice = req.getParameter("originalTotalPrice"); 
		String totalDiscount = req.getParameter("totalDiscount"); 
		String orderFee = req.getParameter("orderFee"); 
		String finalTotalPrice = req.getParameter("finalTotalPrice"); 
		
		mav.addAttribute("originalTotalPrice", originalTotalPrice);
		mav.addAttribute("totalDiscount", totalDiscount);
		mav.addAttribute("orderFee", orderFee);
		mav.addAttribute("finalTotalPrice", finalTotalPrice);
		
		// 회원정보 
		HttpSession session= req.getSession();
		Customers cust = (Customers)session.getAttribute("LOGINCUSTOMER");
		if (cust == null)  {
			mav.setViewName("redirect:/mj/kurly/customers/loginform.hta?result=fail");
			return mav;
		}
		
		String custId = cust.getId();	
		String custName = cust.getName();
		String custPhone = cust.getPhoneNumber();
		String custEmail = cust.getEmail();
		
		ShortCartInfo shortCartInfo = orderDao.getShortCartInfo(custId); 
		String proName = shortCartInfo.getProName();
		int proAmount = shortCartInfo.getCartProAmount();
		
		mav.addAttribute("proName", proName);
		mav.addAttribute("proAmount", proAmount);
		mav.addAttribute("custPhone", custPhone);
		mav.addAttribute("custName", custName);
		mav.addAttribute("custEmail", custEmail);
	
		// 기존 적립금 꺼내오기 
		int originalPoint = cust.getPoint();
		mav.addAttribute("originalPoint", originalPoint);
		
		// 등급에 따라 적립금액 책정하기 
		String gra = cust.getGra();
		mav.addAttribute("gra", gra);
		
		
		return mav;		
	}
	
	
///////////////////////////////////////////////////////////////////////////////////////////////////
	
	@RequestMapping("/kurly/orders/ordercomplete.hta")
	public ModelAndView ordercomplete(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("kurly/orders/ordercomplete.jsp");
		
		// 여기 싹다 다시 해야함 
		// 고객이름 가져오기  
		HttpSession session= req.getSession();
		Customers cust = (Customers)session.getAttribute("LOGINCUSTOMER");
		if (cust == null)  {
			mav.setViewName("redirect:/mj/kurly/customers/loginform.hta?result=fail");
			return mav;
		}
		
		String custName = cust.getName();
		String custId = cust.getId();
		mav.addAttribute("custName", custName);
		
		List<CartInfo> cartInfos = orderDao.getAllCartInfo(custId);
		mav.addAttribute("cartInfos", cartInfos);
		
		// 총가격 & 포인트 가져오기 
		String lastTotalPrice = req.getParameter("lastTotalPrice"); 
		String plusPoint = req.getParameter("plusPoint"); 
		
		System.out.println(lastTotalPrice);
		System.out.println(plusPoint);
	
		mav.addAttribute("plusPoint", plusPoint);
		mav.addAttribute("lastTotalPrice", lastTotalPrice);
		
		return mav;

	}

}
