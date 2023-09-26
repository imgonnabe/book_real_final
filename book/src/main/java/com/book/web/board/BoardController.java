package com.book.web.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;





@Controller
@RequestMapping("/community")
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	@GetMapping("/")
	public String communtiy(@RequestParam Map<String,Object>map,@RequestParam(value="pageNo", required = false, defaultValue = "1")int pageNo,PagDTO pagDTO,Model model) {
		// 검색을 진행하지 않았을때 
	
		if(map.get("searchV") == null || map.get("searchV") == "")
		{
			//페이징
			int total = boardService.totalc(); 
			pagDTO.setPageNo(pageNo);
			pagDTO.setContentNo(10);
			pagDTO.setTotalcount(total);
			pagDTO.setCurrentblock(pageNo);
			pagDTO.setLastblock(pagDTO.getTotalcount());
			pagDTO.setStartPage(pagDTO.getCurrentblock());
			pagDTO.setEndPage(pagDTO.getLastblock(), pagDTO.getCurrentblock());
			pagDTO.prevnext(pageNo);
			pagDTO.prenex(pageNo);
			Map<String,Object> num = new HashMap<String, Object>();
			num.put("pageNo", (pagDTO.getPageNo()-1)*10);
			num.put("contentNo", pagDTO.getContentNo());
			List<Map<String,Object>> list = boardService.listc(num);
			List<Map<String,Object>> boardList = boardService.boardList();
			model.addAttribute("boardList", boardList);
			model.addAttribute("list", list);
			model.addAttribute("pag",pagDTO);
		
		return "/community";
		}else {
			pagDTO.setPageNo(pageNo);
			pagDTO.setContentNo(10);
			Map<String,Object> num = new HashMap<String, Object>();
			num.put("pageNo", (pagDTO.getPageNo()-1)*10);
			num.put("contentNo", pagDTO.getContentNo());
			map.put("pageNo", (pagDTO.getPageNo()-1)*10);
			map.put("contentNo", pagDTO.getContentNo());
			int total = boardService.totalc2(map);
			pagDTO.setTotalcount(total);
			pagDTO.setCurrentblock(pageNo);
			pagDTO.setLastblock(pagDTO.getTotalcount());
			pagDTO.setStartPage(pagDTO.getCurrentblock());
			pagDTO.setEndPage(pagDTO.getLastblock(), pagDTO.getCurrentblock());
			pagDTO.prevnext(pageNo);
			pagDTO.prenex(pageNo);
			List<Map<String,Object>> boardList = boardService.boardList();
			model.addAttribute("boardList", boardList);
			model.addAttribute("pag",pagDTO);
			List<Map<String,Object>> searchlist = boardService.searchlistc(map);
			model.addAttribute("list",searchlist);
			
			return "/community";
		}
	}
	
	@GetMapping("/cwrite")
	public String cwrite(Model model,HttpSession session) {
		if(session.getAttribute("mid") != null) {
			List<Map<String,Object>> boardList = boardService.boardList();
			model.addAttribute("boardList",boardList);
		return "/community/cwrite";
		}else {
			return "redirect:/login";
		}
		
	}
	
	@PostMapping("/cwrite")
	public String cwrite(@RequestParam Map<String, Object> map, HttpSession session) {
		if(session.getAttribute("mid") != null) {
		map.put("mid", session.getAttribute("mid"));
		boardService.cwrite(map);
		return "redirect:/community/";
		}else {
			return "redirect:/login";
		}
	}
	
	
	@GetMapping("/boardM")
	public String boardM(Model model ) {
		List<Map<String,Object>> board1= boardService.board1();
		List<Map<String,Object>> board2= boardService.board2();
		List<Map<String,Object>> board3= boardService.board3();
		List<Map<String,Object>> board4= boardService.board4();
		model.addAttribute("board1", board1);
		model.addAttribute("board2", board2);
		model.addAttribute("board3", board3);
		model.addAttribute("board4", board4);
		return "/community/boardM";
	}
	
	// 보드 보여주기 ( 페이징 / 검색 포함 )
	@GetMapping("/board")
	public String board(@RequestParam(value="board", required =false, defaultValue="0")int board,@RequestParam Map<String,Object>map, Model model, 
		@RequestParam(value="pageNo", required = false, defaultValue = "1")int pageNo,PagDTO pagDTO) {
		
		// 검색이 없을 시 
		if(map.get("searchV") == null || map.get("searchV") == "")
		{
		
		int total = boardService.total(board);    
		pagDTO.setPageNo(pageNo);
		pagDTO.setContentNo(10);
		pagDTO.setTotalcount(total);
		pagDTO.setCurrentblock(pageNo);
		pagDTO.setLastblock(pagDTO.getTotalcount());
		pagDTO.setStartPage(pagDTO.getCurrentblock());
		pagDTO.setEndPage(pagDTO.getLastblock(), pagDTO.getCurrentblock());
		pagDTO.prevnext(pageNo);
		pagDTO.prenex(pageNo);
		Map<String,Object> num = new HashMap<String, Object>();
		num.put("pageNo", (pagDTO.getPageNo()-1)*10);
		num.put("contentNo", pagDTO.getContentNo());
		num.put("board", board);
		List<Map<String,Object>> boardList = boardService.boardList();
		List<Map<String,Object>> list = boardService.list(num);
		String boardName= boardService.name(board);
		model.addAttribute("name", boardName);
		model.addAttribute("list",list);
		model.addAttribute("boardList",boardList);
		model.addAttribute("pag",pagDTO);
		return "/community/board";
		
		// 검색을 했을 시 
		}else {
			pagDTO.setPageNo(pageNo);
			pagDTO.setContentNo(10);
			Map<String,Object> num = new HashMap<String, Object>();
			num.put("pageNo", (pagDTO.getPageNo()-1)*10);
			num.put("contentNo", pagDTO.getContentNo());
			num.put("board", board);
			map.put("pageNo", (pagDTO.getPageNo()-1)*10);
			map.put("contentNo", pagDTO.getContentNo());
			int total = boardService.total2(map);
			pagDTO.setTotalcount(total);
			pagDTO.setCurrentblock(pageNo);
			pagDTO.setLastblock(pagDTO.getTotalcount());
			pagDTO.setStartPage(pagDTO.getCurrentblock());
			pagDTO.setEndPage(pagDTO.getLastblock(), pagDTO.getCurrentblock());
			pagDTO.prevnext(pageNo);
			pagDTO.prenex(pageNo);
			List<Map<String,Object>> boardList = boardService.boardList();
			String boardName= boardService.name(board);
			model.addAttribute("name", boardName);
			model.addAttribute("boardList",boardList);
			model.addAttribute("pag",pagDTO);
			List<Map<String,Object>> searchlist = boardService.searchlist(map);
			model.addAttribute("list",searchlist);
			return "/community/board"; 
			}
		
	}
	
	@GetMapping("/bwrite")
	public String bwrite(@RequestParam(value="board", required =false, defaultValue="1")int board, Model model,HttpSession session) {
		if(session.getAttribute("mid") != null) {
		model.addAttribute("board", board);
		return "/community/bwrite";
		}else {
			return "redirect:/login";
		}
		
	}
	
	@PostMapping("/bwrite")
	public String bwrite(@RequestParam Map<String, Object> map, HttpSession session) {
		if(session.getAttribute("mid") != null) {
		map.put("mid", session.getAttribute("mid"));
		boardService.bwrite(map);
		return "redirect:/community/board?board="+map.get("board");
		}else {
			return "redirect:/login";
		}
	}
	
	@GetMapping("/bdetail")
	public String bdetail(@RequestParam Map<String,Object> map , Model model ,HttpSession session ) {
		Map<String, Object> bdetail = boardService.bdetail(map);
		boardService.viewUp(bdetail);
		model.addAttribute("bdetail", bdetail);
		List<Map<String, Object>> commentsList = boardService.commentsList(map);
		model.addAttribute("commentsList",commentsList);
		return "/community/bdetail";
	}
	
	
	@PostMapping("/comment")
	public String comment(@RequestParam Map<String,Object>map, HttpSession session) {
		if(session.getAttribute("mid") != null) {
		String sid=String.valueOf(session.getAttribute("mid"));
		map.put("mid", sid);
		int result = boardService.commentInsert(map);
		
		if(result == 1) {
			return "redirect:/community/bdetail?board="+map.get("board")+"&bno="+map.get("bno");
		}
			return "board";
		}else {
			return "redirect:/community/bdetail?board="+map.get("board")+"&bno="+map.get("bno");
		}
	}

	@GetMapping("/edit")
	public String edit(@RequestParam Map<String,Object> map, Model model, HttpSession session) {
		if(session.getAttribute("mid") != null) {
		Map<String,Object> result= boardService.bdetail(map);
		model.addAttribute("result", result);
		String rid = String.valueOf(result.get("mid"));
		String sid = String.valueOf( session.getAttribute("mid")) ;
		
		if(rid.equals(sid)) {
			return "/community/edit";
			}else {
				return "redirect:/community/bdetail?board="+map.get("board")+"&bno="+map.get("bno");
			}
			}else {
				
		return "redirect:/community/bdetail?board="+map.get("board")+"&bno="+map.get("bno");
		}
	}
	
	@PostMapping("/edit")
	public String edit2(@RequestParam Map<String,Object> map) {
		boardService.edit(map);
	
		return "redirect:/community/bdetail?board="+map.get("board")+"&bno="+map.get("bno");
	}
	
	
	@GetMapping("/bdelete")
	public String bdelete(@RequestParam Map<String,Object> map  ,HttpSession session) {
		if(session.getAttribute("mid") != null) {
		Map<String,Object> result= boardService.bdetail(map);
		String rid = String.valueOf(result.get("mid"));
		String sid = String.valueOf( session.getAttribute("mid")) ;
		String grade =String.valueOf(session.getAttribute("mgrade"));
		int m = Integer.valueOf(grade);
		if(rid.equals(sid) || m ==2 ) {
		boardService.deleteb(map);
		return "redirect:/community/board?board="+map.get("board");
		}else {
			return "redirect:/community/board";
		}
		}else {
			return "redirect:/community/board";
		}
		
		 
	}

	
	@ResponseBody
	@PostMapping("/cdelR")
	public String cdel(@RequestParam Map<String,Object> map , HttpSession session) {
		if(session.getAttribute("mid") != null) {
		JSONObject json = new JSONObject();
		String map2 = boardService.comments(map);
		String sid = String.valueOf( session.getAttribute("mid")) ;
		String grade =String.valueOf(session.getAttribute("mgrade"));
		int m = Integer.valueOf(grade);
		if(map2.equals(sid) || m==2) {
		int result = boardService.cdel(map);
		json.put("result", result);
		return json.toString();
		}else {
			return "redirect:/community/bdetail?board="+map.get("board")+"&bno="+map.get("bno");
		}
		}else {
			return "redirect:/community/bdetail?board="+map.get("board")+"&bno="+map.get("bno");
		}
	}
	@PostMapping("/cedit")
	public String cedit(@RequestParam Map<String,Object>map, HttpSession session) {
		if(session.getAttribute("mid") != null) {
		
		String map2 = boardService.comments(map);
		String sid = String.valueOf( session.getAttribute("mid")) ;
		
		if(map2.equals(sid)) {
		int result =boardService.cedit(map);
		return "redirect:/community/bdetail?board="+map.get("board")+"&bno="+map.get("bno");
		}else {
			return "redirect:/community/bdetail?board="+map.get("board")+"&bno="+map.get("bno");
		}
		}else {
			return "redirect:/community/bdetail?board="+map.get("board")+"&bno="+map.get("bno");
		}
	}
	// ㅡㅡㅡㅡㅡ notice ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	@GetMapping("/notice")	
	public String notice(@RequestParam(value="board", required =false, defaultValue="1")int board,@RequestParam Map<String,Object>map, Model model, 
			@RequestParam(value="pageNo", required = false, defaultValue = "1")int pageNo,PagDTO pagDTO) {
		if(map.get("searchV") == null || map.get("searchV") == "")
		{
		int total = boardService.ntotal(board);    
		pagDTO.setPageNo(pageNo);
		pagDTO.setContentNo(10);
		pagDTO.setTotalcount(total);
		pagDTO.setCurrentblock(pageNo);
		pagDTO.setLastblock(pagDTO.getTotalcount());
		pagDTO.setStartPage(pagDTO.getCurrentblock());
		pagDTO.setEndPage(pagDTO.getLastblock(), pagDTO.getCurrentblock());
		pagDTO.prevnext(pageNo);
		pagDTO.prenex(pageNo);
		Map<String,Object> num = new HashMap<String, Object>();
		num.put("pageNo", (pagDTO.getPageNo()-1)*10);
		num.put("contentNo", pagDTO.getContentNo());
		num.put("board", board);
		List<Map<String,Object>> nlist = boardService.nlist(num);
		List<Map<String,Object>> nboardList = boardService.nboardList();
		model.addAttribute("nlist", nlist);
		model.addAttribute("nboardList",nboardList);
		model.addAttribute("pag",pagDTO);
		return "/community/notice";
		}else {
			pagDTO.setPageNo(pageNo);
			pagDTO.setContentNo(10);
			Map<String,Object> num = new HashMap<String, Object>();
			num.put("pageNo", (pagDTO.getPageNo()-1)*10);
			num.put("contentNo", pagDTO.getContentNo());
			num.put("board", board);
			map.put("pageNo", (pagDTO.getPageNo()-1)*10);
			map.put("contentNo", pagDTO.getContentNo());
			int total = boardService.ntotal2(map);
			pagDTO.setTotalcount(total);
			pagDTO.setCurrentblock(pageNo);
			pagDTO.setLastblock(pagDTO.getTotalcount());
			pagDTO.setStartPage(pagDTO.getCurrentblock());
			pagDTO.setEndPage(pagDTO.getLastblock(), pagDTO.getCurrentblock());
			pagDTO.prevnext(pageNo);
			pagDTO.prenex(pageNo);
			List<Map<String,Object>> nlist = boardService.nlist(num);
			List<Map<String,Object>> nboardList = boardService.nboardList();
			model.addAttribute("nlist",nlist);
			model.addAttribute("nboardList",nboardList);
			model.addAttribute("pag",pagDTO);
			List<Map<String,Object>> nsearchlist = boardService.nsearchlist(map);
			model.addAttribute("nlist",nsearchlist);	
			
		return "/community/notice"; 
		}
	}
	
	@GetMapping("/ndetail")
	public String ndetail(@RequestParam Map<String,Object> map , Model model ) {
		Map<String, Object> ndetail = boardService.ndetail(map);
		boardService.nviewUp(ndetail);
		model.addAttribute("ndetail", ndetail);
		
		return "/community/ndetail";
	}
	@GetMapping("/nedit")
	public String nedit(@RequestParam Map<String,Object> map, Model model, HttpSession session) {
		if(session.getAttribute("mid") != null) {
			String rid= boardService.nidetail(map);
			String sid = String.valueOf( session.getAttribute("mid")) ;
		if(rid.equals(sid) ) {
			Map<String,Object> result= boardService.ndetail(map);
			int r =  (int) result.get("nreply");
			if(r ==0 ) {
			model.addAttribute("result", result);
		return "/community/nedit";
			}else {
				return "redirect:/community/ndetail?board="+map.get("board")+"&nno="+map.get("nno");
			}
			}else {
				return "redirect:/community/ndetail?board="+map.get("board")+"&nno="+map.get("nno");
			}
			}else {
			return "redirect:/community/ndetail?board="+map.get("board")+"&nno="+map.get("nno");
		}
		
	}
	//게시물 수정
	@PostMapping("/nedit")
	public String nedit2(@RequestParam Map<String,Object> map) {
		
		boardService.nedit(map);
	
		return "redirect:/community/ndetail?board="+map.get("board")+"&nno="+map.get("nno");
	}
	
	@GetMapping("/ndelete")
	public String ndelete(@RequestParam Map<String,Object> map, HttpSession session) {
		if(session.getAttribute("mid") != null) {
			String rid= boardService.nidetail(map);
			String sid = String.valueOf( session.getAttribute("mid")) ;
			if(rid.equals(sid) ) {

				boardService.ndelete(map);
				return "redirect:/community/notice";
		}else{
				return "redirect:/community/notice";
		}
		}else {	
				return "redirect:/community/notice";
		}
		
		 
	}
	
	@GetMapping("/noticeM")
	public String noticeM(Model model,HttpSession session) {
		List<Map<String,Object>> qna = boardService.qna();
		String sid = String.valueOf(session.getAttribute("mid"));
		List<Map<String,Object>> inquire = boardService.inquire(sid);
		model.addAttribute("inquire", inquire);
		model.addAttribute("qna", qna);
		
		return "/community/noticeM";
	}
	
	@GetMapping("/nwrite")
	public String nwrite(@RequestParam(value="board", required =false, defaultValue="1")int board, Model model, HttpSession session) {
		if(session.getAttribute("mid") != null) {
		String grade =String.valueOf(session.getAttribute("mgrade"));
		int m = Integer.valueOf(grade);
		if(m == 2) {
		model.addAttribute("board", board);
			return "/community/nwrite";
		}else {
		model.addAttribute("board", 3);
			return "/community/nwrite";
		}
		
		}else {
			return "/community/noticeM";
		}
		
		
	}
	// 글쓴거 보내는 작동
	@PostMapping("/nwrite")
	public String nwrite(@RequestParam Map<String, Object> map, HttpSession session) {
		String sid = String.valueOf(session.getAttribute("mid"));
		map.put("mid", sid);
		boardService.nwrite(map);
		return "redirect:/community/notice?board="+map.get("board");
		
	}



}
