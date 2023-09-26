package com.book.web.board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardService {
	@Autowired
	public BoardDAO boardDAO;
	public List<Map<String, Object>>boardList() {
		
		return boardDAO.boardList();
	}
	public List<Map<String, Object>> list(Map<String, Object> num) {
		
		return boardDAO.list(num);
	}
	public void bwrite(Map<String, Object> map) {
		boardDAO.bwrite(map);
		
	}
	public Map<String, Object> bdetail(Map<String, Object> map) {
		
		return boardDAO.bdetail(map);
	}
	public int commentInsert(Map<String, Object> map) {
		
		return boardDAO.commentInsert(map);
	}
	public List<Map<String, Object>> commentsList(Map<String, Object> map) {
		
		return boardDAO.commentsList(map);
	}
	public void deleteb(Map<String, Object> map) {
		boardDAO.deleteb(map);
		
	}
	public void edit(Map<String, Object> map) {
		boardDAO.edit(map);
		
	}
	public void viewUp(Map<String, Object> bdetail) {
		boardDAO.viewUp(bdetail);
	}
	public int cdel(Map<String, Object> map) {
		
		return boardDAO.cdel(map);
	}
	public int cedit(Map<String, Object> map) {
		
		return boardDAO.cedit(map);
	}
	
	public List<Map<String, Object>> searchlist(Map<String, Object> map) {
		
		return boardDAO.searchlist(map);
	}
	public String name(int board) {
		
		return boardDAO.name(board);
	}
	public int total(int board) {
		
		return boardDAO.total(board);
	}
	public int total2(Map<String, Object> map) {
		
		return boardDAO.total2(map);
	}
	public List<Map<String, Object>> board1() {
		
		return boardDAO.board1();
	}

	 public List<Map<String, Object>> board2() {
	  return boardDAO.board2(); }
	
	public List<Map<String, Object>> board3() {
		
		return boardDAO.board3();
	}
	public int ntotal(int board) {
		
		return boardDAO.ntotal(board);
	}
	public List<Map<String, Object>> nlist(Map<String, Object> num) {
		
		return boardDAO.nlist(num);
	}
	public int ntotal2(Map<String, Object> map) {
		
		return boardDAO.ntotal2(map);
	}
	public List<Map<String, Object>> nsearchlist(Map<String, Object> map) {
	
		return boardDAO.nsearchlist(map);
	}
	public List<Map<String, Object>> board4() {
		
		return boardDAO.board4();
	}
	public Map<String, Object> ndetail(Map<String, Object> map) {
		
		return boardDAO.ndetail(map);
	}
	public void nviewUp(Map<String, Object> ndetail) {
		boardDAO.nviewUp(ndetail);
		
	}
	public void nedit(Map<String, Object> map) {
		boardDAO.nedit(map);
		
	}
	public void ndelete(Map<String, Object> map) {
		boardDAO.ndelete(map);
		
	}
	public List<Map<String, Object>> nboardList() {
		
		return boardDAO.nboardList();
	}
	public List<Map<String, Object>> qna() {
		
		return boardDAO.qna();
	}
	public void nwrite(Map<String, Object> map) {
		boardDAO.nwrite(map);
		
	}
	public String comments(Map<String, Object> map) {
		
		return boardDAO.comments(map);
	}
	public int totalc() {
		
		return boardDAO.totalc();
	}
	public List<Map<String, Object>> listc(Map<String, Object> num) {
		
		return boardDAO.listc(num);
	}
	public int totalc2(Map<String, Object> map) {
		
		return boardDAO.totalc2(map);
	}
	public List<Map<String, Object>> searchlistc(Map<String, Object> map) {
		
		return boardDAO.searchlistc(map);
	}
	public void cwrite(Map<String, Object> map) {
		boardDAO.cwrite(map);
	}
	public List<Map<String, Object>> inquire(String sid) {
		
		return boardDAO.inquire(sid);
	}
	public String nidetail(Map<String, Object> map) {
		
		return boardDAO.nidetail(map);
	}
	

	}

