package kr.co.mj.dao;

import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.sun.scenario.effect.Crop;

import kr.co.mj.util.IbatisUtils;
import kr.co.mj.vo.Criteria;
import kr.co.mj.vo.Customers;

public class CustomerDao {

	private SqlMapClient sqlMap = IbatisUtils.getSqlMap();
	
	public void insertCustomer(Customers customers) throws Exception {
		sqlMap.insert("insertCustomer", customers);
	}
	
	public Customers getCustomerById(String userId) throws Exception {
		return (Customers) sqlMap.queryForObject("getCustomerById", userId);
	}
	
	public Customers getCustomerByEmail(String userEmail) throws Exception {
		return (Customers) sqlMap.queryForObject("getCustomerByEmail", userEmail);
	}
	
	public String getCustomer(String useremail) throws Exception {
		return (String) sqlMap.queryForObject("getCustomer", useremail);
	}
	
	@SuppressWarnings("unchecked")
	public  List<Customers> selectAllCustomers() throws Exception {
		return sqlMap.queryForList("selectAllCustomers");
	}
	
	public Integer customerPagination() throws Exception {
		return (Integer) sqlMap.queryForObject("customerPagination");
	}
	
	public void updateStatus(Customers customers) throws Exception {
		sqlMap.update("updateStatus", customers);
	}
	
	@SuppressWarnings("unchecked")
	public List<Customers> adminGetCustomer(Criteria criteria) throws Exception {
		return sqlMap.queryForList("adminGetCustomer", criteria);
	}
	
	
	
	
	
}
