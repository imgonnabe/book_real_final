package com.book.web.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminService {
	@Autowired
	private AdminDAO adminDAO;

	public List<Map<String, Object>> stocklist(Map<String, Object> map) {
		return adminDAO.stocklist(map);
	}

	public void updateStock(Map<String, Object> map) {
		adminDAO.updateStock(map);
	}

	public List<Map<String, Object>> boardlist(Map<String, Object> map) {
		return adminDAO.boardlist(map);
	}

	public Map<String, Object> bdetail(int bno) {
		return adminDAO.bdetail(bno);
	}

	public List<Map<String, Object>> comment(int bno) {
		return adminDAO.comment(bno);
	}

	public void memberOut(String mid) {
		adminDAO.memberOut(mid);
	}

	public void bdel(int bno) {
		adminDAO.bdel(bno);
	}

	public List<Map<String, Object>> rentlist(Map<String, Object> map) {
		return adminDAO.rentlist(map);
	}

	public List<Map<String, Object>> tradelist(Map<String, Object> map) {
		return adminDAO.tradelist(map);
	}

	public List<Map<String, Object>> rentalAmount(Map<String, Object> map) {
		return adminDAO.rentalAmount(map);
	}

	public Map<String, Object> ndetail(int nno) {
		return adminDAO.ndetail(nno);
	}

	public int boardlistCnt(Map<String, Object> map) {
		return adminDAO.boardlistCnt(map);
	}

	public int stocklistCnt(Map<String, Object> map) {
		return adminDAO.stocklistCnt(map);
	}

	public List<Map<String, Object>> noticelist(Map<String, Object> map) {
		return adminDAO.noticelist(map);
	}

	public int noticelistCnt(Map<String, Object> map) {
		return adminDAO.noticelistCnt(map);
	}

	public int tradelistCnt(Map<String, Object> map) {
		return adminDAO.tradelistCnt(map);
	}

	public int rentalAmountCnt(Map<String, Object> map) {
		return adminDAO.rentalAmountCnt(map);
	}

	public int rentlistCnt(Map<String, Object> map) {
		return adminDAO.rentlistCnt(map);
	}

	void nedit(Map<String, Object> map) {
		adminDAO.nedit(map);
	}

	public void ndelete(Map<String, Object> map) {
		adminDAO.ndelete(map);
	}

	public void nwrite(Map<String, Object> map) {
		adminDAO.nwrite(map);
	}

	// ncate = 3 시 reply 주기 
	public int find(Map<String, Object> map) {
		
		return adminDAO.find(map);
	}

	public void reply(Map<String, Object> map) {
		adminDAO.reply(map);
		
	}

	// ncate = 3 시 reply 주기 
}
