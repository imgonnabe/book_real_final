package com.book.web.booklist;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.book.web.zzim.ZzimService;

@Controller
public class BooklistController {
	
	@Autowired
	private BooklistService booklistService; 
	@Autowired
	private ZzimService zzimService;
	@Autowired
    private JdbcTemplate jdbcTemplate;

	/*--------------------------------------------------------범식-----------------------------------------------------------*/
	
	@GetMapping("/booklist")
	public String booklist(Model model, 
		@RequestParam(name = "bkcate", required = false, defaultValue = "0") int bkcate,
		@RequestParam Map<String, Object> map,
		HttpSession session,
		@RequestParam(name = "page", defaultValue = "1") int page, // 현재 페이지
        @RequestParam(name = "pageSize", defaultValue = "8") int pageSize // 페이지 크기
		){
		
		if(!(map.containsKey("bkcate")) || map.get("bkcate").equals(null) || map.get("bkcate").equals("")){
			map.put("bkcate", 0);
		}
		
		// 책 목록갯수
	    int totalBookCount = booklistService.getTotalBookCount(map);
	    
	    //System.out.println(totalBookCount);

	    // 페이징 정보계산
	    int totalPage = (int) Math.ceil((double) totalBookCount / pageSize);
	    if (page < 1) {
	        page = 1;
	    }
	    if (page > totalPage) {
	        page = totalPage;
	    }
	    int startRow = (page - 1) * pageSize;
	    int endRow = startRow + pageSize;
	    
//		System.out.println("카테고리 :" + bkcate );
//		System.out.println("검색 :" + map );
//		System.out.println("시작 페이지 : " + startRow);
//		System.out.println("끝 페이지 : " + endRow);
		
		//베스트셀러
		List<BooklistDTO> booktop = booklistService.booktop();
		model.addAttribute("booktop", booktop);

		//책 목록 불러오기
	    map.put("startRow", startRow);
	    map.put("endRow", endRow);
	    map.put("pageSize", pageSize);
	    List<Map<String, Object>> booklist = booklistService.booklist(map);
		model.addAttribute("booklist", booklist);
	    model.addAttribute("currentPage", page);
	    model.addAttribute("totalPage", totalPage);
	    
	    
	    // 찜한 책목록 불러오기
	    String mid = (String) session.getAttribute("mid");
	    List<Integer> zzimBooklist = zzimService.zzimBooklist(mid);
	    model.addAttribute("zzimBooklist", zzimBooklist);
		
		
		return "booklist";
	}
	
	
	@GetMapping("/bookdetail")
	public String bookdetail(@RequestParam("bkno") int bkno,Model model,HttpSession session,@RequestParam Map<String,Object> map) {
		
		//책 상세페이지
		Map<String, Object> bookdetail = booklistService.bookdetail(bkno);
		model.addAttribute("bookdetail", bookdetail);
		
		//베스트셀러
		List<BooklistDTO> booktop = booklistService.booktop();
		model.addAttribute("booktop", booktop);
		
		//베스트대여
		List<BooklistDTO> bookrtop = booklistService.bookrtop();
		model.addAttribute("bookrtop", bookrtop);
		
	    // 찜한 책목록 불러오기
	    String mid = (String) session.getAttribute("mid");
	    List<Integer> zzimBooklist = zzimService.zzimBooklist(mid);
	    model.addAttribute("zzimBooklist", zzimBooklist);
	    
	    //렌탈,구매 리스트 불러오기
	    List<String> booktrade = booklistService.booktrade(bkno);
	    model.addAttribute("booktrade", booktrade);
	    
        List<String> bookrental = booklistService.bookrental(bkno);
	    model.addAttribute("bookrental", bookrental);
	    
	    //리뷰
		map.put("bkno", bkno);
		List<Map<String, Object>> reviewsList = booklistService.reviewsList(map);
		model.addAttribute("reviewsList",reviewsList);
		
		
	    /*--------------------------------------------------------승현-----------------------------------------------------------*/
	    //렌탈 데이터
		Map<String, Object> rentaldata = booklistService.rentaldata(bkno);
		model.addAttribute("rentaldata", rentaldata);
	    
		//연체
		if(session.getAttribute("mid") != null) {
			map.put("mid", session.getAttribute("mid"));
			List<Map<String, Object>> overdue = booklistService.overdue(map);
			//System.out.println(overdue);
			model.addAttribute("overdue", overdue);
		}
		/*-----------------------------------------------------------------------------------------------------------------------*/
	    
		
		return "bookdetail";
	}
	
	//리뷰등록
	@PostMapping("/addreview")
	public String addReview(@RequestParam Map<String,Object>map, HttpSession session) {
		
		String mid = (String) session.getAttribute("mid");
		map.put("mid", mid);
		booklistService.addReview(map);
		
		return "redirect:/bookdetail?bkno="+map.get("bkno");
	}
	
	//리뷰삭제
	@ResponseBody
	@PostMapping("/rdelR")
	public String rdel(@RequestParam Map<String,Object> map , HttpSession session) {
		JSONObject json = new JSONObject();
		int result = booklistService.rdel(map);
		json.put("result", result);
		return json.toString();
	}
	
	
	//책등록 페이지 이동
	@GetMapping("/admin/booknotice")
	public String booknotice(HttpSession session) {
		if(session.getAttribute("mid") != null && (int)session.getAttribute("mgrade") == 2) {
			return "/admin/booknotice";
		} else {
			return "redirect:/index";
		}
	}
	
	//책등록
	@PostMapping("/admin/bookWrite")
	public String bookWrite(@RequestParam("upFile") MultipartFile upfile, @RequestParam Map<String, Object> map,HttpSession session) {
		if(session.getAttribute("mid") != null && (int)session.getAttribute("mgrade") == 2) {
			if (!upfile.isEmpty()) {
				HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes())
						.getRequest();
				String path = request.getServletContext().getRealPath("/img/bookimg");
	
				//이미지 저장 
				//UUID uuid = UUID.randomUUID();
				LocalDateTime ldt = LocalDateTime.now();
				String format = ldt.format(DateTimeFormatter.ofPattern("YYYYMMddHHmmss"));
				String realFileName = format + upfile.getOriginalFilename();
	
				File newFileName = new File(path, realFileName);
				try {
				} catch (Exception e) {
					e.printStackTrace();
				}
				try {
					FileCopyUtils.copy(upfile.getBytes(), newFileName);
				} catch (IOException e) {
					e.printStackTrace();
				}
				map.put("upFile", realFileName);
			}
			
			booklistService.bookWrite(map);
	
			//bkno 가져오기
			int bkno = jdbcTemplate.queryForObject("SELECT LAST_INSERT_ID()", Integer.class);
			String mid = (String) session.getAttribute("mid");
			map.put("mid", mid);
			map.put("bkno", bkno);
			booklistService.bookWrite2(map);
	
			return "redirect:/admin/booknotice";
		} else {
			return "redirect:/index";
		}
	}
	/*-----------------------------------------------------------------------------------------------------------------------*/
	
	
	/*--------------------------------------------------------상민-----------------------------------------------------------*/
	
	  @ResponseBody
	   @PostMapping("/cart")
	   public String detail2(CartDTO dto, HttpSession session) {
	        JSONObject json = new JSONObject();
	      
	      dto.setMid((String) session.getAttribute("mid"));
	      System.out.println("dto값은"+dto);

	   
	      List<Map<String, Object>> cartList = booklistService.cart(dto);

	      // System.out.println(cartList);

	      boolean matchingItemFound = false;

	      for (int i = 0; i < cartList.size(); i++) {
	         if (cartList.get(i).get("bkno").equals(dto.getBkno())) {
	            booklistService.cart2(dto);
	         
	            matchingItemFound = true;
	            break;
	         
	         }
	      }

	      if (!matchingItemFound) {
	         // If no matching item is found, proceed to detail2
	         booklistService.detail2(dto);
	         
	      }

	      
	      
	     
	        
	      return json.toString();
	   }

	   @GetMapping("/cart")
	   public String cart(Model model, HttpSession session) {
	      CartDTO dto = new CartDTO();
	      dto.setMid((String) session.getAttribute("mid"));
	      List<Map<String, Object>> cart = booklistService.cart(dto);
	      model.addAttribute("cart", cart);

	      
	      
	      List<Map<String, Object>> coupon = booklistService.coupon(dto);
	        model.addAttribute("coupon", coupon);
	   
	      return "/cart";
	   }

	   @ResponseBody
	   @GetMapping("/delete")
	   public String delete(@RequestParam Map<String, Object> map) {

	      int result = booklistService.delete(map);
	      int result2 = booklistService.delete2(map);

	      JSONObject json = new JSONObject();
	      json.put("result", result);

	      return json.toString();

	   }

	   @GetMapping("/purchase")
	   public String purchase(Model model, HttpSession session, @RequestParam("mtotal") int mtotal) {

	      List<Map<String, Object>> map = booklistService.purchase((String) session.getAttribute("mid"));


	        model.addAttribute("mtotal", mtotal);
	      // System.out.println(map);
	      model.addAttribute("map", map);

	      return "/purchase";
	   }

	   @PostMapping("/purchase")
	   public String transaction(CartDTO cart, HttpSession session,@RequestParam Map<String, Object> map) {

	      cart.setMid((String) session.getAttribute("mid"));
	     
	      List<Map<String, Object>> cartlist = booklistService.cart(cart);

	   
	      for (int i = 0; i < cartlist.size(); i++) {

	         booklistService.stockupdate(cartlist.get(i));

	      }

	      for (int i = 0; i < cartlist.size(); i++) {
	      
	         
	         if(Integer.parseInt((String)map.get("unchangedtotal"))>Integer.parseInt((String) map.get("mintotal"))) {
	            
	            cartlist.get(i).put("tdel", 1);
	            
	            booklistService.insert(cartlist.get(i));
	            
	            
	         }else {
	            
	            cartlist.get(i).put("tdel", 0);
	         booklistService.insert(cartlist.get(i));
	         }
	      }

	      for (int i = 0; i < cartlist.size(); i++) {
	         booklistService.delete3(cartlist.get(i));

	      }
	      String mid = (String) session.getAttribute("mid");
	      booklistService.updateCoupon(mid);
	      

	      return "redirect:/booklist";
	   }


}
	
	
	
	
	
	
	/*-----------------------------------------------------------------------------------------------------------------------*/
	
	
	

