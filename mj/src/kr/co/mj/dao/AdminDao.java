package kr.co.mj.dao;

import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.mj.util.IbatisUtils;
import kr.co.mj.vo.Category;
import kr.co.mj.vo.Criteria;
import kr.co.mj.vo.Product;
import kr.co.mj.vo.ProductsQuestion;

public class AdminDao {
	private SqlMapClient sqlMap = IbatisUtils.getSqlMap();
	
	// 세일 상품중 랜덤 조회 
	public List<Product> getMainProductBySale () throws Exception{
		return sqlMap.queryForList("getMainProductBySale");
	}
	
	// 베스트상품중 랜덤조회
	public List<Product> getMainProductByBest()	throws Exception{
		return sqlMap.queryForList("getMainProductByBest");
	}
	
	//늘사는것중 랜덤조회
	public List<Product> getMainProductByLikes() throws Exception{
		return sqlMap.queryForList("getMainProductByLikes");
	}
	
	// 키워드에 맞는 상품 총 숫자조회
	public int getMainSearchRecords(Criteria criteria) throws Exception{
		return (Integer)sqlMap.queryForObject("getMainSearchRecords",criteria);
	}
	// 인덱스에 해당하는 상품들 조회하기
	public List<Product>getSearchProducts(Criteria criteria)throws Exception{
		return sqlMap.queryForList("getSearchProducts",criteria);
	}
	
	//부모카테고리조회하기
	public List<Category>selectAllParentCategories() throws Exception{
		return sqlMap.queryForList("selectAllParentCategories");
	}
	
	// 조건에맞는 상품자료수 조회
	public int getConditionRecords(Criteria criteria) throws Exception{
		return (Integer)sqlMap.queryForObject("getConditionRecords",criteria);
	}
	// 조건에 맞는 상품조회
	public List<Product>getConditionProducts(Criteria criteria) throws Exception{
		return sqlMap.queryForList("getConditionProducts", criteria);
	}
	// 조건에 맞는 상품문의 수 조회
	public int getConditionProQnARecords(Criteria criteria) throws Exception{
		return (Integer)sqlMap.queryForObject("getConditionProQnARecords", criteria);
	}
	// 조건에 맞는 상품문의 조회
	public List<ProductsQuestion> getConditionProQnA(Criteria criteria) throws Exception {
		return sqlMap.queryForList("getConditionProQnA", criteria);
	}

}
