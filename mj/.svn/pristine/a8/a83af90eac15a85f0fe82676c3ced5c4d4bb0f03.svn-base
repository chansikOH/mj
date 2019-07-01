package kr.co.mj.dao;

import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.mj.vo.Criteria;
import kr.co.mj.util.IbatisUtils;
import kr.co.mj.vo.Frequent;
import kr.co.mj.vo.Notice;
import kr.co.mj.vo.OneQna;
import kr.co.mj.vo.OrderListView;



public class CenterDao {

	private SqlMapClient sqlMap = IbatisUtils.getSqlMap();
	//공지사항 글 삭제
	public void noticeDelete(int no)throws Exception{
			sqlMap.delete("noticeDelete",no);
	}
	//관리자페이지 주문관리
	public List<OrderListView> orderdetailList(int no) throws Exception{
		return sqlMap.queryForList("orderdetailList",no);
	}
	//관리자페이지 주문관리
	public void orderStatusUpdate(int no) throws Exception{
		sqlMap.update("orderStatusUpdate",no);
	}
	
	//관리자페이지 주문관리
	public List<OrderListView> getStatus(Criteria c) throws Exception{
		return sqlMap.queryForList("getStatus",c);
	}
	public int getStatusCount(Criteria c)throws Exception{
		return (Integer)sqlMap.queryForObject("getStautsCount",c);
	}
	//관리자페이지 주문관리
	public void noticeWriter(Notice not) throws Exception{
		sqlMap.insert("noticeWriter",not);
	}
	public Notice nextPrev(int no) throws Exception{
		return (Notice)sqlMap.queryForObject("nextPrev",no);
	}

	public Notice notdetail(int no) throws Exception{
		return (Notice)sqlMap.queryForObject("notdetail",no);
	}
	public OneQna qnadetail(int no) throws Exception{
		return (OneQna)sqlMap.queryForObject("qnadetail",no);
	}
	public void adminQnaAdd(OneQna qna) throws Exception{
		sqlMap.update("adminQnaAdd",qna);
	}
	
	public List<OneQna> getAdminQnaList(Map<String, Object> map) throws Exception{
		return sqlMap.queryForList("getAdminQnaList",map);
	}
	
	public int getAdiminQnaCount() throws Exception{
		return (Integer) sqlMap.queryForObject("getAdiminQnaCount");
	}
	
	public void qnaAdd(OneQna qna)throws Exception{
		 sqlMap.insert("qnaAdd",qna);
	}
	public List<OrderListView> getOrderList(String id)throws Exception{
		return sqlMap.queryForList("getOrder",id);
	}
	public int getQnaCount(String id) throws Exception{
		return (Integer)sqlMap.queryForObject("getQnaCount",id);
	}
	
	public List<OneQna> getQnaList(Map<String, Object> map)throws Exception{
		return sqlMap.queryForList("getQnaList",map);
	}
	
	public List<Frequent> getFrequentList(Criteria c)throws Exception{
		return sqlMap.queryForList("getFreList", c);
	}
	public int getFreRecords(Criteria c)throws Exception{
		return (Integer)sqlMap.queryForObject("getFreRecords",c);
	}
	
	
	public List<Notice> getNoticeList(Criteria c) throws Exception{
		return sqlMap.queryForList("getNoticeList", c);
	}
	
	public int getRecords(Criteria c) throws Exception{
			return (Integer) sqlMap.queryForObject("getRecords", c);
	}
	
	
	@SuppressWarnings("unchecked") // 페이징 처리하여 자주묻는질문 리스트 가져오기
	public List<Frequent> getFreRange(Map<String, Object> map) throws Exception{ 
		
		return sqlMap.queryForList("getFreByRange", map);
	}
	
	public int getFreCount() throws Exception{ // 자주묻는질문 게시글 총 개수 구하기.
		return (Integer)sqlMap.queryForObject("getFreCount");
	}

	public int getNotCount() throws Exception{ // 공지사항 게시글 총 개수 구하기
		return (Integer)sqlMap.queryForObject("getNotCount");
	}
	
	@SuppressWarnings("unchecked") // 페이징 처리하여 공지사항 리스트 가져오기
	public List<Notice>getNotRange(Map<String, Object> map) throws Exception{
		return sqlMap.queryForList("getNotByRange",map);
	}
	
	public Notice getNotByNoDetail(int no) throws Exception{ // 해당 번호 공지사항 글 불러오기
		return (Notice) sqlMap.queryForObject("getNotByNoDetail",no);
	}
	
	//조회수 증가
	public void notViewUpdate(int no) throws Exception{
		sqlMap.update("notViewUpdate",no);
	}
	
	//내용으로 공지사항 글 찾기
	public List<Notice> getNotById(Map<String, Object> map) throws Exception{
		return sqlMap.queryForList("getNotById",map);
	}
	
	//제목으로 공지사항 글찾기
	public List<Notice> getNotByTitle(Map<String, Object> map) throws Exception{
		return sqlMap.queryForList("getNotByTitle",map);
	}
	
	//제목으로 찾은 공지사항 글 총 개수 구하기
	public int getNotByTitleCount(String title) throws Exception{
		return (int)sqlMap.queryForObject("getNotByTitleCount",title);
	}
	
	public int getNotByContentCount(String content) throws Exception{
		return (int)sqlMap.queryForObject("getNotByContentCount",content);
	}
	
	
}

