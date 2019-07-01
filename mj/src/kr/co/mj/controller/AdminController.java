package kr.co.mj.controller;

import java.util.List;
import java.util.StringJoiner;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.net.URLEncoder;

import com.oreilly.servlet.MultipartRequest;

import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;
import kr.co.mj.dao.AdminDao;
import kr.co.mj.dao.ProductDao;
import kr.co.mj.util.CommonUtils;
import kr.co.mj.vo.Category;
import kr.co.mj.vo.Criteria;
import kr.co.mj.vo.Customers;
import kr.co.mj.vo.Pagination;
import kr.co.mj.vo.Product;
import kr.co.mj.vo.ProductsQuestion;

@Controller
public class AdminController {
	AdminDao adminDao = new AdminDao();
	ProductDao proDao = new ProductDao();
	
	//상품관리 페이지
	@RequestMapping("/kurly/admin/productManagement.hta")
	public ModelAndView productManagement(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("kurly/admin/productManagement.jsp");
		
		HttpSession session = req.getSession();
	      Customers customers = (Customers)session.getAttribute("LOGINCUSTOMER");
	      
	      if (customers == null) {
	         mav.setViewName("redirect:/mj/kurly/customers/loginform.hta?result=fail");
	         return mav;
	      }
		
		String keyword = req.getParameter("keyword"); //검색어
		int pno = CommonUtils.stringToNumber(req.getParameter("pno"), 1); //페이지번호 
		int size = 10; // 보여줄개수
		
		Criteria criteria = new Criteria();
		
		String category = req.getParameter("category");
		if(category ==null ) {
			criteria.setCatNo(1);
		} else {
			criteria.setCatNo(Integer.parseInt(category));
		}
		
		String sort = req.getParameter("sort");// 정렬기준
		String gijun = req.getParameter("gijun"); // 오름 내림차순
		
		
		if (sort != null && !sort.isEmpty() && gijun != null && !gijun.isEmpty()) {
			StringJoiner joiner = new StringJoiner("");
			joiner.add(sort);
			joiner.add(gijun);
			
			String result = joiner.toString();
			
			criteria.setSort(result);
		} else {
			//기준과 정렬기준없으면 생성일자 오름차순 정렬
			criteria.setSort("CDU");
		}
		
		criteria.setSize(size);
		
		criteria.setBeginIndex((pno - 1)*size + 1);
		
		criteria.setEndIndex(pno*size);
		
		if(keyword != null && !keyword.isEmpty()) {
			criteria.setKeyword(keyword);
		}
		
		List<Category> categories = adminDao.selectAllParentCategories(); // 부모카테고리 모두 조회
		int records = adminDao.getConditionRecords(criteria); // 조건맞는 자료들 개수
		List<Product> products = adminDao.getConditionProducts(criteria); // 조건맞는 상품들 조회
		
		Pagination pagination = new Pagination(pno, size, 5, records);
		
		mav.addAttribute("categories", categories); // 부모카테고리들 // 셀렉 옵션에 나열할래
		
		
		mav.addAttribute("products", products);
		mav.addAttribute("pagination", pagination);
		return mav;
	}
	
	// 판매시작 
	@RequestMapping("/kurly/admin/startSell.hta")
	public ModelAndView startSell(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		String keyword = req.getParameter("keyword");
		int pno = CommonUtils.stringToNumber(req.getParameter("pno"), 1);
		int category =Integer.parseInt(req.getParameter("category"));
		String sort = req.getParameter("sort");
		String gijun = req.getParameter("gijun"); 
		
		String[] proNo = req.getParameterValues("no");
		
		for(int i =0; i<proNo.length; i++) {
			Product product =proDao.getProductByNo(Integer.parseInt(proNo[i]));
			product.setUsedYn("Y");
			proDao.updateProduct(product);
		}
		
		
		mav.setViewName("redirect:productManagement.hta?category="+category+"&gijun="+gijun+"&sort="+sort+"&pno="+pno+"&keyword="+URLEncoder.encode(keyword, "utf-8"));
		return mav;
	}
	
	//판매중지
	@RequestMapping("/kurly/admin/stopSell.hta")
	public ModelAndView stopSell(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		String keyword =  req.getParameter("keyword");
		int pno = CommonUtils.stringToNumber(req.getParameter("pno"), 1);
		int category =Integer.parseInt(req.getParameter("category"));
		String sort = req.getParameter("sort");
		String gijun = req.getParameter("gijun"); 
		
		String[] proNo = req.getParameterValues("no");
		
		for(int i =0; i<proNo.length; i++) {
			Product product =proDao.getProductByNo(Integer.parseInt(proNo[i]));
			product.setUsedYn("N");
			proDao.updateProduct(product);
		}
		
		mav.setViewName("redirect:productManagement.hta?category="+category+"&gijun="+gijun+"&sort="+sort+"&pno="+pno+"&keyword="+URLEncoder.encode(keyword, "utf-8"));
		return mav;
	}
	
	// 상품수정페이지
	@RequestMapping("/kurly/admin/productModify.hta")
	public ModelAndView productModify(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = req.getSession();
	      Customers customers = (Customers)session.getAttribute("LOGINCUSTOMER");
	      
	      if (customers == null) {
	         mav.setViewName("redirect:/mj/kurly/customers/loginform.hta?result=fail");
	         return mav;
	      }
		
		mav.setViewName("kurly/admin/productModify.jsp");
		
		int no = Integer.parseInt(req.getParameter("no"));
		
		Product product = proDao.getProductByNo(no);
		
		mav.addAttribute("product", product);
		return mav;
	}
	
	//상품수정 기능
	@RequestMapping("/kurly/admin/productUpdate.hta")
	public ModelAndView productUpdate(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		MultipartRequest mr = new MultipartRequest(req, "C:/projects/web_workspace/mj/WebContent/images/product", "utf-8");
		
		int no = Integer.parseInt(mr.getParameter("prono"));
		int catNo =Integer.parseInt(mr.getParameter("procat"));
		String name = mr.getParameter("proname");
		int price = Integer.parseInt(mr.getParameter("proprice"));
		String simple = mr.getParameter("prosimple");
		int stock = Integer.parseInt(mr.getParameter("prostock"));
		double discount = Integer.parseInt(mr.getParameter("prodiscount"));
		
		String saleYn = mr.getParameter("prosale");
		String usedYn = mr.getParameter("proused");
		String img = mr.getFilesystemName("proimg");
		
		Product product = new Product();
		
		if(img == null) {
			Product product2 = proDao.getProductByNo(no);
			 product.setImg(product2.getImg());
		} else {
			product.setImg(img);
		}
		
		product.setCatNo(catNo);
		product.setDiscount((discount/100));
		product.setName(name);
		product.setNo(no);
		product.setPrice(price);
		product.setSaleYn(saleYn);
		product.setSimple(simple);
		product.setStock(stock);
		product.setUsedYn(usedYn);
		
		
		proDao.updateProduct(product);
		
		mav.setViewName("redirect:productManagement.hta");
		
		return mav;
	}
	
	//상품 등록페이지
	@RequestMapping("/kurly/admin/productAddPage.hta")
	public ModelAndView insertProduct(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = req.getSession();
	    Customers customers = (Customers)session.getAttribute("LOGINCUSTOMER");
	      
	    if (customers == null) {
	    	mav.setViewName("redirect:/mj/kurly/customers/loginform.hta?result=fail");
	    	return mav;
	      }
		
		
		mav.setViewName("kurly/admin/productAddPage.jsp");
		
		return mav;
	}
	//상품 등록 기능
	
	@RequestMapping("/kurly/admin/productAdd.hta")
	public ModelAndView productAdd(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		MultipartRequest mr = new MultipartRequest(req, "C:/projects/web_workspace/mj/WebContent/images/product", "utf-8");
		
		int catNo =Integer.parseInt(mr.getParameter("procat"));
		String name = mr.getParameter("proname");
		int price = Integer.parseInt(mr.getParameter("proprice"));
		String simple = mr.getParameter("prosimple");
		int stock = Integer.parseInt(mr.getParameter("prostock"));
		double discount = Integer.parseInt(mr.getParameter("prodiscount"));
		String saleYn = mr.getParameter("prosale");
		String usedYn = mr.getParameter("proused");
		String img = mr.getFilesystemName("proimg");
		
		Product product = new Product();
		
		if(img == null) {
			 product.setImg("noImg.jpg");
		} else {
			product.setImg(img);
		}
		product.setCatNo(catNo);
		product.setDiscount((discount/100));
		product.setName(name);
		product.setPrice(price);
		product.setSaleYn(saleYn);
		product.setSimple(simple);
		product.setStock(stock);
		product.setUsedYn(usedYn);
		
		
		proDao.insertProduct(product);
		
		mav.setViewName("redirect:productManagement.hta");
		return mav;
	}
	
	// 문의관리 페이지
	@RequestMapping("/kurly/admin/qnaManagement.hta")
	public ModelAndView qnaManagement (HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("kurly/admin/qnaManagement.jsp");
		
		HttpSession session = req.getSession();
	    Customers customers = (Customers)session.getAttribute("LOGINCUSTOMER");
	      
	    if (customers == null) {
	    	mav.setViewName("redirect:/mj/kurly/customers/loginform.hta?result=fail");
	    	return mav;
	      }
		
		int pno = CommonUtils.stringToNumber(req.getParameter("pno"), 1);
		String sort = req.getParameter("sort");
		int size = 10;
		
		Criteria criteria = new Criteria();
		
		criteria.setSort(sort);
		
		criteria.setSize(size);
		
		criteria.setBeginIndex((pno - 1)*size + 1);
		
		criteria.setEndIndex(pno*size);
				
		int records = adminDao.getConditionProQnARecords(criteria);
		List<ProductsQuestion> productsQuestions = adminDao.getConditionProQnA(criteria);
		
		Pagination pagination = new Pagination(pno, size, 5 ,records);
				
		mav.addAttribute("productsQuestions", productsQuestions);
		mav.addAttribute("pagination", pagination);
		return mav;
	}
}
