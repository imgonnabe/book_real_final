package com.book.web.mypage;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MyPageService {
	@Autowired
	private MyPageDAO myPageDAO;

	public List<Map<String, Object>> booklist(String mid) {
		return myPageDAO.booklist(mid);
	}

	public List<Map<String, Object>> zzimlist(String mid) {
		return myPageDAO.zzimlist(mid);
	}

	public int zdelete(Map<String, Object> map) {
		return myPageDAO.zdelete(map);
	}

	public List<Map<String, Object>> buylist(Map<String, Object> map) {
		return myPageDAO.buylist(map);
	}

	public List<Map<String, Object>> rentlist() {
		return myPageDAO.rentlist();
	}

	public List<Map<String, Object>> boardlist(Map<String, Object> map) {
		return myPageDAO.boardlist(map);
	}

	public void bdelete(Map<String, Object> map) {
		myPageDAO.bdelete(map);
	}

	public Map<String, Object> bdetail(int bno) {
		return myPageDAO.bdetail(bno);
	}

	public List<Map<String, Object>> commentlist(Map<String, Object> map) {
		return myPageDAO.commentlist(map);
	}

	public Map<String, Object> cdetail(int cno) {
		return myPageDAO.cdetail(cno);
	}

	public List<Map<String, Object>> rentlist(Map<String, Object> map) {
		return myPageDAO.rentlist(map);
	}

	public Map<String, Object> info(Map<String, Object> map) {
		return myPageDAO.info(map);
	}

	public void phoneSave(Map<String, Object> map) {
		myPageDAO.phoneSave(map);
	}

	public void infoChange(Map<String, Object> map) {
		myPageDAO.infoChange(map);
	}

	public int idchk(String id) {
		return myPageDAO.idchk(id);
	}

	public int emailchk(String email) {
		return myPageDAO.emailchk(email);
	}

	public void returnBook(Map<String, Object> map) {
		myPageDAO.returnBook(map);
	}

	public int boardlistCnt(Map<String, Object> map) {
		return myPageDAO.boardlistCnt(map);
	}

	public int commentlistCnt(Map<String, Object> map) {
		return myPageDAO.commentlistCnt(map);
	}

	public void cdelete(Map<String, Object> map) {
		myPageDAO.cdelete(map);
	}

	public void bedit(Map<String, Object> map) {
		myPageDAO.bedit(map);
	}

	public int cedit(Map<String, Object> map) {
		return myPageDAO.cedit(map);
	}

	public int buylistCnt(Map<String, Object> map) {
		return myPageDAO.buylistCnt(map);
	}

	public int rentlistCnt(Map<String, Object> map) {
		return myPageDAO.rentlistCnt(map);
	}

	public List<Map<String, Object>> rddatelist(String mid) {
		return myPageDAO.rddatelist(mid);
	}

	public List<Map<String, Object>> tdatelist(String mid) {
		return myPageDAO.tdatelist(mid);
	}

	public void out(String id) {
		myPageDAO.out(id);
	}
	

}
