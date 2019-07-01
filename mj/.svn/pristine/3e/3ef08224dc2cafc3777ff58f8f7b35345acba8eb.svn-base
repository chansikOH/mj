package kr.co.mj.dao;

import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.mj.util.IbatisUtils;
import kr.co.mj.vo.Criteria;
import kr.co.mj.vo.CustQuitInfo;
import kr.co.mj.vo.Customers;
import kr.co.mj.vo.LikesProduct;
import kr.co.mj.vo.OrderListView;
import kr.co.mj.vo.Orders;
import kr.co.mj.vo.PointHistory;
import kr.co.mj.vo.Product;
import kr.co.mj.vo.Review;
import kr.co.mj.vo.ReviewLikes;

public class MypageDao {

	private SqlMapClient sqlMap = IbatisUtils.getSqlMap();
		
	@SuppressWarnings("unchecked")
	public List<PointHistory> getMypoint(Map<String, Object> map) throws Exception {
		return sqlMap.queryForList("getMypoint", map);
	}
	
	public int getMypointRecords(Map<String, Object> map) throws Exception {
		return (int) sqlMap.queryForObject("getMypointRecords", map);
	}
	
	public int getOrderListRecords(Map<String, Object> map) throws Exception {
		return (int) sqlMap.queryForObject("getOrderListRecords", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<OrderListView> getOrderListProduct(Map<String, Object> map) throws Exception {
		return sqlMap.queryForList("getOrderListProduct", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<OrderListView> getOrderDetailProduct(Map<String, Object> map) throws Exception {
		return sqlMap.queryForList("getOrderDetailProduct", map);
	}
	
	public OrderListView getOrderDetailInfo(Map<String, Object> map) throws Exception {
		return (OrderListView) sqlMap.queryForObject("getOrderDetailInfo", map);
	}
	
	public void modifyMyInfo(Customers cust) throws Exception {
		sqlMap.update("modifyMyInfo", cust);
	}
	
	public Customers getCustomerById(String id) throws Exception {
		return (Customers) sqlMap.queryForObject(id);
	}
	
	//////////////
	
	public int getBeforeAmountById(String value) throws Exception {
		return (int) sqlMap.queryForObject("getBeforeAmountById", value);
	}

	public int getAfterAmountById(String value) throws Exception {
		return (int) sqlMap.queryForObject("getAfterAmountById", value);
	}

	public void addCustQuitInfo(CustQuitInfo custQuitInfo) throws Exception {
		sqlMap.insert("addCustQuitInfo", custQuitInfo);
	}

	public void updateUsedYn(String id) throws Exception {
		sqlMap.update("updateUsedYn", id);
	}
	
	public void insertLike(LikesProduct likesProduct) throws Exception {
		  sqlMap.insert("insertLike", likesProduct);
	}

	public void deleteLike(LikesProduct likesProduct) throws Exception {
		  sqlMap.delete("deleteLike", likesProduct);
	}

	public void deleteAllLikes(String custId) throws Exception {
		  sqlMap.delete("deleteAllLikes", custId);
	}

	@SuppressWarnings("unchecked")
	public List<Product> getLikedProductsById(String custId) throws Exception {
		   return sqlMap.queryForList("getLikedProductsById", custId);
	}
	
	public LikesProduct getlikedProductByIdAndNo(Map<String, Object> map) throws Exception {
		return (LikesProduct) sqlMap.queryForObject("getlikedProductByIdAndNo", map);
	}
	
	public Review getReviewByNo(int reviewNo) throws Exception {
		return (Review) sqlMap.queryForObject("getReviewByNo", reviewNo);
	}
	
	public void updateReview(Review review) throws Exception {
		sqlMap.update("updateReview", review);
	}
	
	public ReviewLikes getReviewLikesByAll(Map<String, Object> searchMap) throws Exception {
		return (ReviewLikes) sqlMap.queryForObject("getReviewLikesByAll", searchMap);
	}
	
	public void insertReviewLikes(Map<String, Object> searchMap) throws Exception {
		sqlMap.insert("insertReviewLikes", searchMap);
	}
	
	// 추가
	//리뷰작성 가능한 글 불러오기
	public List<Product> getWritableProducts(int value) throws Exception {
		return sqlMap.queryForList("getWritableProducts", value);
	}

	public void insertReview(Review review) throws Exception {
		sqlMap.insert("insertReview", review);
	}

	@SuppressWarnings("unchecked")
	public List<Review> getFinishedReviewsById(String value) throws Exception {
		return sqlMap.queryForList("getFinishedReviewsById", value);
	}

	@SuppressWarnings("unchecked")
	public List<Integer> getWritableOrders(String id) throws Exception {
		return sqlMap.queryForList("getWritableOrders", id);
	}
	
	@SuppressWarnings("unchecked")
	public List<OrderListView> getdelfinorderlist(String id) throws Exception {
		return sqlMap.queryForList("getdelfinorderlist", id);
	}
}
