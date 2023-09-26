package com.book.web.mypage;

import java.util.Arrays;
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

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
	@Autowired
	private MyPageService myPageService;
	
	@Autowired
	private SmsUtil smsUtil;
	/*@Autowired
	private NotificationService notificationService;*/
	
	@GetMapping({"/", "/main"})
	public String main(Model model, HttpSession session) {
		if(session.getAttribute("mid") != null) {
			String mid = (String) session.getAttribute("mid");
			List<Map<String, Object>> list = myPageService.booklist(mid);
			List<Map<String, Object>> rddatelist = myPageService.rddatelist(mid);
			List<Map<String, Object>> tdatelist = myPageService.tdatelist(mid);
			
			model.addAttribute("list", list);
			model.addAttribute("rlist", rddatelist);
			model.addAttribute("tlist", tdatelist);
			return "/mypage/main";
		} else {
			return "redirect:/login";
		}
	}
	
	/*@ResponseBody
	@GetMapping(value = "/main/sse", produces = MediaType.TEXT_EVENT_STREAM_VALUE)
	public SseEmitter myPageSSE(HttpSession session) {
	    // 현재 세션의 사용자 ID를 가져오는 로직을 사용하여 사용자별 SSE 알림을 처리
	    String mid = (String) session.getAttribute("mid");
	    System.out.println("----------------------------------");
	    System.out.println(mid);
	    
	    // SseEmitter 생성
	    SseEmitter emitter = notificationService.createSseEmitter(mid);
	    Map<String, Object> map = notificationService.findMidById(mid);
	    String btitle = (String) map.get("btitle");
	    String id = (String) map.get("id");
	    String comment = (String) map.get("comment");
	    System.out.println(comment);

	    // 예를 들어, 어떤 이벤트가 발생할 때 알림을 보낼 경우
	    notificationService.sendNotification(mid, id + "님이 '" + btitle + "'의 게시물에 새로운 댓글이 달았습니다.\n");
	    notificationService.sendNotification(mid, comment);
	    
	    return emitter;
	}*/
	
	@GetMapping("/zzim")
	public String zzim(Model model, HttpSession session) {
		if(session.getAttribute("mid") != null) {
			String mid = (String) session.getAttribute("mid");
			List<Map<String, Object>> list = myPageService.zzimlist(mid);
			model.addAttribute("list", list);
			return "/mypage/zzim";
		} else {
			return "redirect:/login";
		}
	}
	
	@PostMapping("/zdelete")
	public String zdelete(@RequestParam(value="valueArr") String[] del, Model model, HttpSession session) {
		System.out.println(Arrays.toString(del));
		if(session.getAttribute("mid") != null) {
			Map<String, Object> map = new HashMap<String, Object>();
			for (int i = 0; i < del.length; i++) {
				map.put("del", del[i]);
				map.put("mid", session.getAttribute("mid"));
				int result = myPageService.zdelete(map);
				model.addAttribute("data", result);
			}
			return "redirect:/mypage/zzim";
		} else {
			return "redirect:/login";
		}
	}
	
	@GetMapping("/buy")
	public String buy(Model model, @RequestParam Map<String, Object> map, HttpSession session, Criteria cri,
			@RequestParam(name="cate", required = false, defaultValue = "0") int cate) {
		System.out.println(map);
		if(session.getAttribute("mid") != null) {
			if(!map.containsKey("cate") || map.get("cate").equals(null) || map.get("cate").equals("")) {
				map.put("cate", 0);
			}
			map.put("mid", session.getAttribute("mid"));
			// 전체 글 개수
	        int buyListCnt = myPageService.buylistCnt(map);
	        
	        // 페이징 객체
	        Paging paging = new Paging();
	        paging.setCri(cri);
	        paging.setTotalCount(buyListCnt);    
	        map.put("cri", cri);
	        System.out.println(map);
			List<Map<String, Object>> list = myPageService.buylist(map);
			model.addAttribute("list", list);
			model.addAttribute("paging", paging);
			model.addAttribute("buyListCnt", buyListCnt);
			return "/mypage/buy";
		} else {
			return "redirect:/login";
		}
	}
	
	@GetMapping("/rent")
	public String rent(Model model, @RequestParam Map<String, Object> map, HttpSession session, Criteria cri,
			@RequestParam(name="cate", required = false, defaultValue = "0") int cate) {
		System.out.println(map);
		if(session.getAttribute("mid") != null) {
			if(!map.containsKey("cate") || map.get("cate").equals(null) || map.get("cate").equals("")) {
				map.put("cate", 2);
			}
			map.put("mid", session.getAttribute("mid"));
			// 전체 글 개수
	        int rentListCnt = myPageService.rentlistCnt(map);
	        
	        // 페이징 객체
	        Paging paging = new Paging();
	        paging.setCri(cri);
	        paging.setTotalCount(rentListCnt);    
	        map.put("cri", cri);
	        System.out.println(map);
			List<Map<String, Object>> list = myPageService.rentlist(map);
			model.addAttribute("list", list);
			model.addAttribute("rentListCnt", rentListCnt);
			model.addAttribute("paging", paging);
			return "/mypage/rent";
		} else {
			return "redirect:/login";
		}
	}
	
	@ResponseBody
	@PostMapping("/returnBook")
	public String returnBook(@RequestParam Map<String, Object> map, HttpSession session) {
		System.out.println(map);
		if(session.getAttribute("mid") != null) {
			map.put("mid", session.getAttribute("mid"));
			myPageService.returnBook(map);
			return "/mypage/rent";
		} else {
			return "redirect:/login";
		}
	}
	
	@GetMapping("/board")
	public String board(Model model, @RequestParam Map<String, Object> map, Criteria cri,
			@RequestParam(name="cate", required = false, defaultValue = "0") int cate, HttpSession session) {
		if(session.getAttribute("mid") != null) {
			map.put("mid", session.getAttribute("mid"));
			if(!map.containsKey("cate") || map.get("cate").equals(null) || map.get("cate").equals("")) {
				map.put("cate", 0);
			}
			// 전체 글 개수
	        int boardListCnt = myPageService.boardlistCnt(map);
	        
	        // 페이징 객체
	        Paging paging = new Paging();
	        paging.setCri(cri);
	        paging.setTotalCount(boardListCnt);    
	        map.put("cri", cri);
	        System.out.println(map);// {mid=bbbb, cate=0, cri=Criteria [page=1, perPageNum=10]}
	        System.out.println(boardListCnt);
	        List<Map<String, Object>> list = myPageService.boardlist(map);
	        
	        model.addAttribute("list", list);    
	        model.addAttribute("paging", paging);    
			return "/mypage/board";
		} else {
			return "redirect:/login";
		}
	}
	
	@ResponseBody
	@PostMapping("/detail")
	public String detail(@RequestParam(value = "bno", required = true, defaultValue = "0") int bno
			, HttpSession session) throws JsonProcessingException {
		if(session.getAttribute("mid") != null) {
			Map<String, Object> map = myPageService.bdetail(bno);
			
			ObjectMapper mapp = new ObjectMapper();
			String json = mapp.writeValueAsString(map);
			return json;
		} else {
			return "redirect:/login";
		}
	}
	
	@GetMapping("/bedit")
	public String bedit(@RequestParam(value = "bno", required = true, defaultValue = "0") int bno
			, @RequestParam Map<String, Object> map, HttpSession session, Model model) {
		System.out.println(map);// {bno=72, cate=0, page=1}
		if(session.getAttribute("mid") != null) {
			map.put("mid", session.getAttribute("mid"));
			Map<String, Object> detail = myPageService.bdetail(bno);
			model.addAttribute("detail", detail);
			model.addAttribute("cate", map.get("cate"));
			model.addAttribute("page", map.get("page"));
			return "/mypage/bedit";
		} else {
			return "redirect:/login";
		}
	}
	
	@PostMapping("/bedit")
	public String edit(@RequestParam Map<String, Object> map, HttpSession session) {
		System.out.println(map);// {title=ㅅㅈㄷ굓ㄷㄳ, content=<p><br></p>, bno=72}
		if(session.getAttribute("mid") != null) {
			myPageService.bedit(map);
			return "redirect:/mypage/board?cate=" + map.get("cate") + "&page=" + map.get("page");
		} else {
			return "redirect:/login";
		}
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam(value = "bno", required = true, defaultValue = "0") int bno
			, @RequestParam Map<String, Object> map, HttpSession session) {
		// System.out.println(bno);
		if(session.getAttribute("mid") != null) {
			map.put("bno", bno);
			map.put("mid", session.getAttribute("mid"));
			System.out.println(map);
			myPageService.bdelete(map);
			return "redirect:/mypage/board?cate=" + map.get("cate") + "&page=" + map.get("page");
		} else {
			return "redirect:/login";
		}
	}
	
	@GetMapping("/comment")
	public String comment(Model model, @RequestParam Map<String, Object> map, Criteria cri,
			@RequestParam(name="cate", required = false, defaultValue = "0") int cate, HttpSession session) {
		if(session.getAttribute("mid") != null) {
			map.put("mid", session.getAttribute("mid"));
			if(!map.containsKey("cate") || map.get("cate").equals(null) || map.get("cate").equals("")) {
				map.put("cate", 0);
			}
			// 전체 글 개수
	        int commentListCnt = myPageService.commentlistCnt(map);
	        
	        // 페이징 객체
	        Paging paging = new Paging();
	        paging.setCri(cri);
	        paging.setTotalCount(commentListCnt);    
	        map.put("cri", cri);
	        System.out.println(map);// {mid=bbbb, cate=0, cri=Criteria [page=1, perPageNum=10]}
	        List<Map<String, Object>> list = myPageService.commentlist(map);
	        
	        model.addAttribute("list", list);    
	        model.addAttribute("paging", paging);
			return "/mypage/comment";
		} else {
			return "redirect:/login";
		}
	}
	
	@ResponseBody
	@PostMapping("/cdetail")
	public String cdetail(@RequestParam(value = "cno", required = true, defaultValue = "0") int cno
			, HttpSession session) throws JsonProcessingException {
		if(session.getAttribute("mid") != null) {
			Map<String, Object> map = myPageService.cdetail(cno);
			
			ObjectMapper mapp = new ObjectMapper();
			String json = mapp.writeValueAsString(map);
			return json;
		} else {
			return "redirect:/login";
		}
	}
	
	@GetMapping("/cedit")
	public String cedit(@RequestParam(value = "cno", required = true, defaultValue = "0") int cno
			, Map<String, Object> map, HttpSession session, Model model) {
		// System.out.println(bno);
		if(session.getAttribute("mid") != null) {
			map.put("cno", cno);
			map.put("mid", session.getAttribute("mid"));
			Map<String, Object> detail = myPageService.cdetail(cno);
			model.addAttribute("detail", detail);
			return "/mypage/comment";
		} else {
			return "redirect:/login";
		}
	}
	
	@ResponseBody
	@PostMapping("/cedit")
	public String cedit(@RequestParam Map<String, Object> map, HttpSession session) {
		System.out.println(map);// {comment=마이페이지 댓글쓰기 수정, cno=86}
		if(session.getAttribute("mid") != null) {
			int result = myPageService.cedit(map);
			System.out.println(result);
			JSONObject json = new JSONObject();
			json.put("result", result);
			return json.toString();
		} else {
			return "redirect:/login";
		}
	}
	
	@GetMapping("/cdelete")
	public String cdelete(@RequestParam(value = "cno", required = true, defaultValue = "0") int cno
			, Map<String, Object> map, HttpSession session) {
		// System.out.println(bno);
		if(session.getAttribute("mid") != null) {
			map.put("cno", cno);
			map.put("mid", session.getAttribute("mid"));
			System.out.println(map);
			myPageService.cdelete(map);
			return "redirect:/mypage/comment";
		} else {
			return "redirect:/login";
		}
	}
	
	@GetMapping("/info")
	public String info(Model model, @RequestParam Map<String, Object> map, HttpSession session) {
		if(session.getAttribute("mid") != null) {
			map.put("mid", session.getAttribute("mid"));
			Map<String, Object> info = myPageService.info(map);
			model.addAttribute("info", info);
			return "/mypage/info";
		} else {
			return "redirect:/login";
		}
	}
	
	@ResponseBody
	@PostMapping("/phoneCheck")// 휴대폰 문자보내기
	public String sendSMS(@RequestParam(name="phone", required = false) String phone, HttpSession session) {
		if(session.getAttribute("mid") != null) {
			System.out.println(phone);
			int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);//난수 생성
	
			smsUtil.sendOne(phone, randomNumber);
			return String.valueOf(randomNumber);
		} else {
			return "redirect:/login";
		}
	}
	
	/*@ResponseBody
	@PostMapping("/phoneSave")
	public String phoneSave(@RequestParam(name="phone", required = false) String phone, HttpSession session) {
		if(session.getAttribute("mid") != null) {
			System.out.println("phonSave : " + phone);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("phone", phone);
			map.put("mname", session.getAttribute("mname"));
			myPageService.phoneSave(map);
			return "redirect:/mypage/info";
		} else {
			return "redirect:/login";
		}
	}*/
	
	@ResponseBody
	@PostMapping("/idchk")
	public String idchk(@RequestParam(name="id", required = true) String id, HttpSession session) {
		System.out.println(id);
		if(session.getAttribute("mid") != null) {
			System.out.println("idchk" +id);
			int count = myPageService.idchk(id);
			JSONObject json = new JSONObject();
			json.put("count", count);
			System.out.println(count);
			return json.toString();
		} else {
			return "redirect:/login";
		}
	}
	
	@ResponseBody
	@PostMapping("/emailchk")
	public String emailchk(@RequestParam(name="email", required = true) String email, HttpSession session) {
		System.out.println(email);
		if(session.getAttribute("mid") != null) {
			int count = myPageService.emailchk(email);
			JSONObject json = new JSONObject();
			json.put("count", count);
			System.out.println(count);
			return json.toString();
		} else {
			return "redirect:/login";
		}
	}
	
	@PostMapping("/infoChange")
	public String infoChange(@RequestParam Map<String, Object> map, HttpSession session) {
		System.out.println(map);// {postcode=0, address=서울, detailAddress=11, extraAddress= (신사동)}
		// 아무것도 없을 때 : {id=, pw=, postcode=, address=, detailAddress=, extraAddress=, birth=, emailId=dddd, selectEmailDomain=0, emailDomain=}
		if(session.getAttribute("mid") != null) {
			String address = (String) map.get("address");
			String postcode = (String) map.get("postcode");
			String detailAddress = (String) map.get("detailAddress");
			String extraAddress = (String) map.get("extraAddress");
			String id = (String) map.get("id");
			String pw = (String) map.get("pw");
			String birth = (String) map.get("birth");
			String emailBefore = (String) map.get("emailId");
			String selectEmailDomain = (String) map.get("selectEmailDomain");
			String emailDomain = (String) map.get("emailDomain");
			String phone = (String) map.get("phone");
			System.out.println(id + " " +pw);
			
			if(id != null && !id.isEmpty() || pw != null && !pw.isEmpty() || 
					birth != null && !birth.isEmpty() || address != null && !address.isEmpty() &&
					postcode != null && !postcode.isEmpty() &&
					detailAddress != null && !detailAddress.isEmpty() &&
					extraAddress != null && !extraAddress.isEmpty() ||
					emailBefore != null && !emailBefore.isEmpty() &&
					selectEmailDomain != null && !selectEmailDomain.isEmpty() ||
					phone != null && !phone.isEmpty()) {
				
				if(postcode != null && !postcode.isEmpty() &&
						detailAddress != null && !detailAddress.isEmpty() &&
						extraAddress != null && !extraAddress.isEmpty()) {
					
					String addr = address + " " + postcode + " " + detailAddress + " " + extraAddress;
					map.put("addr", addr);
				}
				
				if(emailBefore != null && !emailBefore.isEmpty() &&
						selectEmailDomain != null && !selectEmailDomain.isEmpty()) {
					String email = "";
					if(selectEmailDomain.equals("5")) {
						email = emailBefore + "@" + emailDomain;
					} else {
						email = emailBefore + "@" + selectEmailDomain;
					}
					map.put("email", email);
				}
				map.put("mno", session.getAttribute("mno"));
				System.out.println(map);
				myPageService.infoChange(map);
				return "redirect:/mypage/info";
			}
			return "redirect:/mypage/info?error=empty";
			
		} else {
			return "redirect:/login";
		}
	}
	
	@GetMapping("/out")
	public String out(Model model, HttpSession session) {
		if(session.getAttribute("mid") != null) {
			String id = (String) session.getAttribute("mid");
			myPageService.out(id);
			session.invalidate();
			return "redirect:/";
		} else {
			return "redirect:/login";
		}
	}
}