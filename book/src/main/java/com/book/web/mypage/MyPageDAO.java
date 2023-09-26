package com.book.web.mypage;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MyPageDAO {

	List<Map<String, Object>> booklist(String mid);

	List<Map<String, Object>> zzimlist(String mid);

	int zdelete(Map<String, Object> map);

	List<Map<String, Object>> buylist(Map<String, Object> map);

	List<Map<String, Object>> rentlist();

	List<Map<String, Object>> boardlist(Map<String, Object> map);

	void bdelete(Map<String, Object> map);

	Map<String, Object> bdetail(int bno);

	List<Map<String, Object>> commentlist(Map<String, Object> map);

	Map<String, Object> cdetail(int cno);

	List<Map<String, Object>> rentlist(Map<String, Object> map);

	Map<String, Object> info(Map<String, Object> map);

	void phoneSave(Map<String, Object> map);

	void infoChange(Map<String, Object> map);

	int idchk(String id);

	int emailchk(String email);

	void returnBook(Map<String, Object> map);

	int boardlistCnt(Map<String, Object> map);

	int commentlistCnt(Map<String, Object> map);

	void cdelete(Map<String, Object> map);

	void bedit(Map<String, Object> map);

	int cedit(Map<String, Object> map);

	int buylistCnt(Map<String, Object> map);

	int rentlistCnt(Map<String, Object> map);

	List<Map<String, Object>> rddatelist(String mid);

	List<Map<String, Object>> tdatelist(String mid);

	void out(String id);

}
