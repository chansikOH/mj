package kr.co.mj.dao;

import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.engine.mapping.sql.Sql;

import kr.co.mj.util.IbatisUtils;
import kr.co.mj.vo.Cart;
import kr.co.mj.vo.CartInfo;
import kr.co.mj.vo.Customers;
import kr.co.mj.vo.ShortCartInfo;

public class OrderDao {

	SqlMapClient sqlMap = IbatisUtils.getSqlMap();
	
	@SuppressWarnings("unchecked")
	public List<Cart> getAllCartByCustid(String custId) throws Exception {
		return sqlMap.queryForList("getAllCartByCustid",custId); 
	}
	
	public void addProductIntoTheCart(Cart cart) throws Exception {
		sqlMap.insert("addProductIntoTheCart",cart);   
	}
	
	@SuppressWarnings("unchecked")
	public List<CartInfo> getAllCartInfo(String custId) throws Exception {
		return sqlMap.queryForList("getAllCartInfo", custId); 
	}
	
	public void deleteCartProduct(int CartNo) throws Exception {
		sqlMap.delete("deleteCartProduct", CartNo); 
	} 
	
	public void deleteAllProduct(String custId) throws Exception {
		sqlMap.delete("deleteAllProduct", custId); 
	}
	
	public Cart getCartByCartNo(int CartNo) throws Exception {
		return (Cart)sqlMap.queryForObject("getCartByCartNo",CartNo);
	}
	
	public void updateProAmount(Cart cart) throws Exception {
		sqlMap.update("updateProAmount", cart); 
	}

	public void deleteSoldoutPro() throws Exception {
		sqlMap.delete("deleteSoldoutPro"); 
	}
	
	public ShortCartInfo getShortCartInfo(String custId) throws Exception {
		return (ShortCartInfo)sqlMap.queryForObject("getShortCartInfo", custId); 
	}
	
	public CartInfo getCartInfoByCartNo(int cartNo) throws Exception {
		return (CartInfo)sqlMap.queryForObject("getCartInfoByCartNo", cartNo);
	}
	
	/* 오찬식 / 해당 아이디의 장바구니 개수 반환 */
	public int getCartCountByCustId(String custId) throws Exception {
		return (int) sqlMap.queryForObject("getCartCountByCustId", custId);
	}
	
	/* 오찬식 / 아이디와 상품번호가 같은 장바구니 반환 */
	public Cart getCartByCustIdAndProNo(Map<String, Object> map) throws Exception {
		return (Cart) sqlMap.queryForObject("getCartByCustIdAndProNo", map);
	}
}
