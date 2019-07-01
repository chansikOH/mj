package kr.co.mj.dao;

import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.mj.util.IbatisUtils;
import kr.co.mj.vo.Category;
import kr.co.mj.vo.Criteria;
import kr.co.mj.vo.Product;
import kr.co.mj.vo.ProductsQuestion;
import kr.co.mj.vo.Review;

public class ProductDao {

	private SqlMapClient sqlMap = IbatisUtils.getSqlMap();
	
	@SuppressWarnings("unchecked")
	public List<Product> getProductByRange(Criteria criteria) throws Exception {
		return (List<Product>) sqlMap.queryForList("getProductByRange", criteria);
	}
	
	public int getProductCount(Criteria criteria) throws Exception {
		return (int) sqlMap.queryForObject("getProductCount", criteria);
	}
	
	@SuppressWarnings("unchecked")
	public List<Category> getAllParentCategories() throws Exception {
		return (List<Category>) sqlMap.queryForList("getAllParentCategories");
	}
	
	@SuppressWarnings("unchecked")
	public List<Category> getAllCategoriesByParentNo(int parentNo) throws Exception {
		return (List<Category>) sqlMap.queryForList("getAllCategoriesByParentNo", parentNo);
	}
	
	public Category getCategoryByNo(int categoryNo) throws Exception {
		return (Category) sqlMap.queryForObject("getCategoryByNo", categoryNo);
	}
	
	public Product getProductByNo(int productNo) throws Exception {
		return (Product) sqlMap.queryForObject("getProductByNo", productNo);
	}
	
	@SuppressWarnings("unchecked")
	public List<Product> getRandomProductByParentCat(int categoryNo) throws Exception {
		return (List<Product>) sqlMap.queryForList("getRandomProductByParentCat", categoryNo);
	}
	
	@SuppressWarnings("unchecked")
	public List<Review> getReviewsByRange(Criteria criteria) throws Exception {
		return (List<Review>) sqlMap.queryForList("getReviewsByRange", criteria);
	}
	
	public int getReviewCountByProductNo(int productNo) throws Exception {
		return (int) sqlMap.queryForObject("getReviewCountByProductNo", productNo);
	}
	
	@SuppressWarnings("unchecked")
	public List<ProductsQuestion> getPqsByRange(Criteria criteria) throws Exception {
		return (List<ProductsQuestion>) sqlMap.queryForList("getPqsByRange", criteria);
	}
	
	public int getPqCountByProductNo(int productNo) throws Exception {
		return (int) sqlMap.queryForObject("getPqCountByProductNo", productNo);
	}
	
	public void insertPq(ProductsQuestion pq) throws Exception {
		sqlMap.insert("insertPq", pq);
	}
	
	public void updatePq(ProductsQuestion pq) throws Exception {
		sqlMap.update("updatePq", pq);
	}
	
	public ProductsQuestion getPqByNo(int pqNo) throws Exception {
		return (ProductsQuestion) sqlMap.queryForObject("getPqByNo", pqNo);
	}
	
	//상품 변경 기능
	public void updateProduct(Product product) throws Exception{
		sqlMap.update("updateProduct", product);
	}
	
	//상품 등록 기능
	public void insertProduct(Product product) throws Exception{
		sqlMap.insert("insertProduct", product);
	}
}
