package com.book.web.board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardDAO {

	List<Map<String, Object>> boardList();

	List<Map<String, Object>> list(Map<String, Object> num);

	void bwrite(Map<String, Object> mapmap);

	Map<String, Object> bdetail(Map<String, Object> map);

	int commentInsert(Map<String, Object> map);

	List<Map<String, Object>> commentsList(Map<String, Object> map);

	void deleteb(Map<String, Object> map);

	void edit(Map<String, Object> map);

	void viewUp(Map<String, Object> bdetail);

	int cdel(Map<String, Object> map);

	int cedit(Map<String, Object> map);

	List<Map<String, Object>> searchlist(Map<String, Object> map);

	String name(int board);

	int total(int board);

	int total2(Map<String, Object> map);

	List<Map<String, Object>> board1();

	List<Map<String, Object>> board2(); 
	
	List<Map<String, Object>> board3();

	int ntotal(int board);

	List<Map<String, Object>> nlist(Map<String, Object> num);

	int ntotal2(Map<String, Object> map);

	List<Map<String, Object>> nsearchlist(Map<String, Object> map);

	List<Map<String, Object>> board4();

	Map<String, Object> ndetail(Map<String, Object> map);

	void nviewUp(Map<String, Object> ndetail);

	void nedit(Map<String, Object> map);

	void ndelete(Map<String, Object> map);

	List<Map<String, Object>> nboardList();

	List<Map<String, Object>> qna();

	void nwrite(Map<String, Object> map);

	String comments(Map<String, Object> map);

	int totalc();

	List<Map<String, Object>> listc(Map<String, Object> num);

	int totalc2(Map<String, Object> map);

	List<Map<String, Object>> searchlistc(Map<String, Object> map);

	void cwrite(Map<String, Object> map);

	List<Map<String, Object>> inquire(String sid);

	String nidetail(Map<String, Object> map);

	 

}
