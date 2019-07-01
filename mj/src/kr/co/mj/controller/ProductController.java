package kr.co.mj.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;
import kr.co.jhta.mvc.view.JSONView;
import kr.co.mj.dao.CustomerDao;
import kr.co.mj.dao.MypageDao;
import kr.co.mj.dao.ProductDao;
import kr.co.mj.util.CommonUtils;
import kr.co.mj.vo.Category;
import kr.co.mj.vo.Criteria;
import kr.co.mj.vo.Customers;
import kr.co.mj.vo.LikesProduct;
import kr.co.mj.vo.Pagination;
import kr.co.mj.vo.Product;
import kr.co.mj.vo.ProductsQuestion;
import kr.co.mj.vo.Review;
import kr.co.mj.vo.ReviewLikes;

@Controller
public class ProductController {

	private ProductDao productDao = new ProductDao();
	private CustomerDao customerDao = new CustomerDao();
	private MypageDao mypageDao = new MypageDao();
	
	@RequestMapping("/kurly/product/list.hta")
	public ModelAndView list(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		int pno = CommonUtils.stringToNumber(req.getParameter("pno"), 1);
		int size = CommonUtils.stringToNumber(req.getParameter("size"), 15);
		int catNo;
		try {
			catNo = Integer.parseInt(req.getParameter("catNo"));
		} catch (Exception e) {
			catNo = 10;
		}
		String sort = req.getParameter("sort");
		String page = req.getParameter("page");
		String option = page;
		
		Criteria criteria = new Criteria();
		criteria.setSize(size);
		criteria.setOption(option);
		if(sort != null && !sort.isEmpty()) {
			criteria.setSort(sort);
		} else {
			criteria.setSort("default");
		}	
		criteria.setBeginIndex((pno - 1)*size + 1);
		criteria.setEndIndex(pno*size);
		criteria.setCatNo(catNo);

		Category category = productDao.getCategoryByNo(catNo);
		Category parentCat = new Category();
		if (category.getParentNo() != null) {
			int parentNo = Integer.parseInt(category.getParentNo());
			parentCat = productDao.getCategoryByNo(parentNo);
		} else {
			parentCat = category;
		}
		List<Category> childCats = productDao.getAllCategoriesByParentNo(parentCat.getNo());
		
		List<Product> products = productDao.getProductByRange(criteria);
		int records = productDao.getProductCount(criteria);
		
		Pagination pagination = new Pagination(pno, size, records);
		
		mav.addAttribute("parentCat", parentCat);
		mav.addAttribute("childCats", childCats);
		mav.addAttribute("catNo", catNo);
		mav.addAttribute("products", products);
		mav.addAttribute("pagination", pagination);
		mav.addAttribute("page", page);
	
		mav.setViewName("kurly/product/list.jsp");
		return mav;
	}
	
	@RequestMapping("/kurly/product/detail.hta")
	public ModelAndView detail(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		String position = req.getParameter("position");
		if(position == null) {
			position = "first";
		}
		int pqNo = CommonUtils.stringToNumber(req.getParameter("pqNo"), 0);
		int proNo = CommonUtils.stringToNumber(req.getParameter("proNo"), 0);
		int reviewPno = CommonUtils.stringToNumber(req.getParameter("reviewPno"), 1);
		int pqPno = CommonUtils.stringToNumber(req.getParameter("pqPno"), 1);
		int size = CommonUtils.stringToNumber(req.getParameter("size"), 5);
		String sort = req.getParameter("sort");
		String likeYn = null;
		
		int productNo = Integer.parseInt(req.getParameter("proNo"));
		Product product = productDao.getProductByNo(productNo);
		
		HttpSession session = req.getSession();
		Customers likeCust = (Customers) session.getAttribute("LOGINCUSTOMER");
		if(likeCust == null) {
			likeYn = "N";
		}
		if(likeCust != null) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("proNo", productNo);
			map.put("custId", likeCust.getId());
			
			LikesProduct likPro = mypageDao.getlikedProductByIdAndNo(map);
			if(likPro == null) {
				likeYn = "N";
			} else {
				likeYn = "Y";
			}
		}
		
		int unitPrice = 0;
		if(product.getSaleYn().equals("Y")) {
			unitPrice = product.getDiscountPrice();
		} else {
			unitPrice = product.getPrice();
		}
		
		Category category = productDao.getCategoryByNo(product.getCatNo());
		int parentNo = Integer.parseInt(category.getParentNo());
		List<Product> relatedProducts = productDao.getRandomProductByParentCat(parentNo);
		
		Criteria revCriteria = new Criteria();
		revCriteria.setSize(size);
		if(sort != null && !sort.isEmpty()) {
			revCriteria.setSort(sort);
		} else {
			revCriteria.setSort("date");
		}
		revCriteria.setBeginIndex((reviewPno - 1)*size + 1);
		revCriteria.setEndIndex(reviewPno*size);
		revCriteria.setProductNo(productNo);
		
		List<Review> reviews = productDao.getReviewsByRange(revCriteria);
		for(Review review : reviews) {
			Customers cust = customerDao.getCustomerById(review.getCustId());
			review.setCustomers(cust);
		}
		int revRecords = productDao.getReviewCountByProductNo(productNo);
		Pagination revPagination = new Pagination(reviewPno, size, revRecords);
		
		Criteria pqCriteria = new Criteria();
		pqCriteria.setSize(size);
		pqCriteria.setBeginIndex((pqPno - 1)*size + 1);
		pqCriteria.setEndIndex(pqPno*size);
		pqCriteria.setProductNo(productNo);
		
		List<ProductsQuestion> pqs = productDao.getPqsByRange(pqCriteria);
		for(ProductsQuestion pq : pqs) {
			Customers cust = customerDao.getCustomerById(pq.getCustId());
			pq.setCustomer(cust);
		}
		int pqRecords = productDao.getPqCountByProductNo(productNo);
		Pagination pqPagination = new Pagination(pqPno, size, pqRecords);
		
		if(position.equals("searchPq")) {
			for(int i=1; i<=pqPagination.getTotalPages(); i++) {
				pqCriteria.setBeginIndex((i - 1)*size + 1);
				pqCriteria.setEndIndex(i*size);
				List<ProductsQuestion> searchPqs = productDao.getPqsByRange(pqCriteria);
				for(ProductsQuestion searchPq : searchPqs) {
					if(searchPq.getNo() == pqNo) {
						mav.setViewName("redirect:detail.hta?proNo=" + proNo + "&pqPno=" + i + "&position=openPq&pqNo=" + pqNo);
						return mav;
					}
				}
			}
		}
		
		mav.addAttribute("position", position);
		mav.addAttribute("product", product);
		mav.addAttribute("unitPrice", unitPrice);
		mav.addAttribute("relatedProducts", relatedProducts);
		mav.addAttribute("reviews", reviews);
		mav.addAttribute("revPag", revPagination);
		mav.addAttribute("pqs", pqs);
		mav.addAttribute("pqPag", pqPagination);
		mav.addAttribute("likeYn", likeYn);
		mav.addAttribute("pqNo", pqNo);
		
		mav.setViewName("kurly/product/detail.jsp");
		return mav;
	}
	
	@RequestMapping("/kurly/product/proreviewtitle.hta")
	public ModelAndView proreviewtitle(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		int reviewNo = Integer.parseInt(req.getParameter("reviewno"));
		Review rev = mypageDao.getReviewByNo(reviewNo);
		
		ServletContext application = req.getServletContext();
		@SuppressWarnings("unchecked")
		List<Integer> checkApps = (List<Integer>)application.getAttribute("CHECK");
		if(checkApps == null) {
			checkApps = new ArrayList<Integer>();
			checkApps.add(reviewNo);
			application.setAttribute("CHECK", checkApps);

			rev.setView(rev.getView() + 1);
			mypageDao.updateReview(rev);

		} else if (checkApps != null) {
			boolean isExist = false;
			for(Integer checkApp : checkApps) {
				if(checkApp == reviewNo) {
					isExist = true;
				}
			}
			
			if(!isExist) {				
				checkApps.add(reviewNo);
				
				rev.setView(rev.getView() + 1);
				mypageDao.updateReview(rev);
			}
		}
		
		Review review = mypageDao.getReviewByNo(reviewNo);
		review.setCustomers(customerDao.getCustomerById(review.getCustId()));
		
		mav.addAttribute("review", review);
		mav.setView(new JSONView());
		
		return mav;
	}
	
	@RequestMapping("/kurly/product/proreviewlikes.hta")
	public ModelAndView proreviewlikes(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		int reviewNo = Integer.parseInt(req.getParameter("reviewno"));
		String loginId = req.getParameter("loginid");
		
		Review rev = mypageDao.getReviewByNo(reviewNo);
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("reviewNo", reviewNo);
		searchMap.put("loginId", loginId);
		
		ReviewLikes revLikes = mypageDao.getReviewLikesByAll(searchMap);
		if(revLikes != null) {
			mav.addAttribute("review", rev);
			mav.setView(new JSONView());
		} else {
			rev.setLikes(rev.getLikes() + 1);
			mypageDao.updateReview(rev);
			
			mypageDao.insertReviewLikes(searchMap);
			
			Review review = mypageDao.getReviewByNo(reviewNo);
			mav.addAttribute("review", review);
			mav.setView(new JSONView());
		}
		
		return mav;
	}
	
	@RequestMapping("/kurly/product/pqform.hta")
	public ModelAndView pqform(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		int productNo = Integer.parseInt(req.getParameter("prono"));
		String custId = req.getParameter("custid");
		
		Customers customer = customerDao.getCustomerById(custId);
		
		mav.addAttribute("proNo", productNo);
		mav.addAttribute("customer", customer);
		
		mav.setViewName("kurly/product/pqform.jsp");
		return mav;
	}
	
	@RequestMapping("/kurly/product/addPq.hta")
	public ModelAndView addPq(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		String saveDirectory = "C:\\projects\\web_workspace\\mj\\WebContent\\images\\pq";
		MultipartRequest mr = new MultipartRequest(req, saveDirectory, "utf-8");
		
		int proNo = Integer.parseInt(mr.getParameter("prono"));
		String custId = mr.getParameter("custid");
		String title = mr.getParameter("pqtitle");
		String content = mr.getParameter("content");
		String imgName = mr.getFilesystemName("pqimg");
		
		ProductsQuestion pq = new ProductsQuestion();
		pq.setProNo(proNo);
		pq.setCustId(custId);
		pq.setTitle(title);
		pq.setContents(content);
		pq.setImgName(imgName);
		
		productDao.insertPq(pq);
		
		mav.setViewName("redirect:detail.hta?proNo="+ proNo + "&reviewPno=1&pqPno=1&position=pq");
		return mav;
	}
	
	@RequestMapping("/kurly/product/pqanswerform.hta")
	public ModelAndView pqanswerform(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		int productNo = Integer.parseInt(req.getParameter("prono"));
		int pqPno = Integer.parseInt(req.getParameter("pqPno"));
		int pqNo = Integer.parseInt(req.getParameter("pqno"));
		
		ProductsQuestion pq = productDao.getPqByNo(pqNo);
		Customers cust = customerDao.getCustomerById(pq.getCustId());
		pq.setCustomer(cust);
		
		mav.addAttribute("proNo", productNo);
		mav.addAttribute("pqPno", pqPno);
		mav.addAttribute("pq", pq);
		
		mav.setViewName("kurly/product/pqanswerform.jsp");
		return mav;
	}
	
	@RequestMapping("/kurly/product/addAnswer.hta")
	public ModelAndView addAnswer(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		int productNo = Integer.parseInt(req.getParameter("prono"));
		int pqPno = Integer.parseInt(req.getParameter("pqPno"));
		int pqNo = Integer.parseInt(req.getParameter("pqno"));
		String answer = req.getParameter("answer");
		
		ProductsQuestion pq = productDao.getPqByNo(pqNo);
		pq.setAnswer(answer);
		
		productDao.updatePq(pq);
		
		mav.setViewName("redirect:detail.hta?proNo=" + productNo + "&reviewPno=1&pqPno=" + pqPno + "&position=pq");
		return mav;
	}
	
	@RequestMapping("/kurly/product/addLikePro.hta")
	public ModelAndView addLikePro(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		int productNo = Integer.parseInt(req.getParameter("prono"));
		HttpSession session = req.getSession();
		Customers cust = (Customers) session.getAttribute("LOGINCUSTOMER");
		
		LikesProduct lp = new LikesProduct();
		lp.setProNo(productNo);
		lp.setCustId(cust.getId());
		
		mypageDao.insertLike(lp);
		
		Product pro = productDao.getProductByNo(productNo);
		pro.setLikesCnt(pro.getLikesCnt() + 1);
		
		productDao.updateProduct(pro);
		
		mav.setViewName("redirect:detail.hta?proNo=" + productNo + "&reviewPno=1&pqPno=1&position=first");
		return mav;
	}
	
	@RequestMapping("/kurly/product/delLikePro.hta")
	public ModelAndView delLikePro(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		int productNo = Integer.parseInt(req.getParameter("prono"));
		HttpSession session = req.getSession();
		Customers cust = (Customers) session.getAttribute("LOGINCUSTOMER");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("proNo", productNo);
		map.put("custId", cust.getId());
		LikesProduct lp = mypageDao.getlikedProductByIdAndNo(map);
		
		mypageDao.deleteLike(lp);
		
		mav.setViewName("redirect:detail.hta?proNo=" + productNo + "&reviewPno=1&pqPno=1&position=first");
		return mav;
	}
	
	@RequestMapping("/kurly/product/modify.hta")
	public ModelAndView modify(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("kurly/product/modify.jsp");
		return mav;
	}
}
