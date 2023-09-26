package com.book.web.admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminDAO {

	List<Map<String, Object>> stocklist(Map<String, Object> map);

	void updateStock(Map<String, Object> map);

	List<Map<String, Object>> boardlist(Map<String, Object> map);

	Map<String, Object> bdetail(int bno);

	List<Map<String, Object>> comment(int bno);

	void memberOut(String mid);

	void bdel(int bno);

	List<Map<String, Object>> rentlist(Map<String, Object> map);

	List<Map<String, Object>> tradelist(Map<String, Object> map);

	List<Map<String, Object>> rentalAmount(Map<String, Object> map);

	Map<String, Object> ndetail(int nno);

	int boardlistCnt(Map<String, Object> map);

	int stocklistCnt(Map<String, Object> map);

	List<Map<String, Object>> noticelist(Map<String, Object> map);

	int noticelistCnt(Map<String, Object> map);

	int tradelistCnt(Map<String, Object> map);

	int rentalAmountCnt(Map<String, Object> map);

	int rentlistCnt(Map<String, Object> map);

	void nedit(Map<String, Object> map);

	void ndelete(Map<String, Object> map);

	void nwrite(Map<String, Object> map);

	// ncate = 3 시 reply 주기 
	
	int find(Map<String, Object> map);

	void reply(Map<String, Object> map);
	// ncate = 3 시 reply 주기 

}
