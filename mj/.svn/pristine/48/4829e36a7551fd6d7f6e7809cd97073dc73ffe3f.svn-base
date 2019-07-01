package kr.co.mj.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.mj.util.CommonUtils;
import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;
import kr.co.mj.dao.AdminDao;
import kr.co.mj.dao.OrderDao;
import kr.co.mj.dao.ProductDao;
import kr.co.mj.vo.Category;
import kr.co.mj.vo.Criteria;
import kr.co.mj.vo.Customers;
import kr.co.mj.vo.Pagination;
import kr.co.mj.vo.Product;

@Controller
public class HomeController {
	AdminDao adminDao = new AdminDao();
	ProductDao productDao = new ProductDao();
	OrderDao orderDao = new OrderDao();

	@RequestMapping("/kurly/main.hta")
	public ModelAndView main(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		List<Category> parentCategories = productDao.getAllParentCategories();
		List<Map<String, Object>> menuCats = new ArrayList<Map<String,Object>>();
		for(Category category : parentCategories) {
			List<Category> childCategories = productDao.getAllCategoriesByParentNo(category.getNo());
			
			Map<String, Object> menuMap = new HashMap<String, Object>();
			menuMap.put("parentCat", category);
			menuMap.put("childCatList", childCategories);
			
			menuCats.add(menuMap);
		}
	
		ServletContext application = req.getServletContext();
		application.setAttribute("MENUCATS", menuCats);
		
		HttpSession session = req.getSession();
		Customers cust = (Customers) session.getAttribute("LOGINCUSTOMER");
		int cartCount;
		if(cust == null) {
			cartCount = 0;
		} else {
			cartCount = orderDao.getCartCountByCustId(cust.getId());
		}
		session.setAttribute("headCartCount", cartCount);
		
		List<Product> saleProducts= adminDao.getMainProductBySale();
		List<Product> bestProducts= adminDao.getMainProductByBest();
		List<Product> likesProducts = adminDao.getMainProductByLikes();
		
		mav.addAttribute("saleProducts", saleProducts);
		mav.addAttribute("bestProducts", bestProducts);
		mav.addAttribute("likesProducts", likesProducts);
		
		mav.setViewName("kurly/main.jsp");
		return mav;
	}
	@RequestMapping("/kurly/admin/searchPage.hta")
	public ModelAndView searchPage(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("kurly/admin/searchPage.jsp");
		
		String keyword = req.getParameter("keyword");
		int pno = CommonUtils.stringToNumber(req.getParameter("pno"), 1); 
		int size = 9;
		
		Criteria criteria = new Criteria();
		criteria.setSize(size);
		criteria.setBeginIndex((pno - 1)*size + 1);
		criteria.setEndIndex(pno*size);
		
		if(keyword != null && !keyword.isEmpty()) {
			criteria.setKeyword(keyword);
		}
		
		int records = adminDao.getMainSearchRecords(criteria);
		List<Product> products = adminDao.getSearchProducts(criteria);
		
		Pagination pagination = new Pagination(pno, size, 5, records);
		
		mav.addAttribute("keyword", keyword);
		mav.addAttribute("pno", pno);
		mav.addAttribute("products", products);
		mav.addAttribute("pagination", pagination);
		return mav;
	}
	
	
	
}
