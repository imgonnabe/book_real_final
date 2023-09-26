package com.book.web.board;

import lombok.Data;
// 페이징 DTO 
@Data
public class PagDTO {
	private int pageNo,contentNo,startPage,endPage,currentblock,lastblock,totalcount;
	private boolean prev,next,pre,nex;
	public PagDTO() {
		this(1,10);
	}
	
	public PagDTO(int pageNo,int contentNo) {
		this.pageNo=pageNo;
		this.contentNo=contentNo;
	}

	 public int calcpage(int totalcount, int contentNo){ 
	        int totalpage = totalcount / contentNo;
	        if(totalcount%contentNo>0){
	            totalpage++;
	        }
	        return totalpage;
	 }
	 public void setCurrentblock(int pageNo) {
	        
	        this.currentblock = pageNo/5;
	        if(pageNo%5>0){
	            this.currentblock++;
	        }
	 }
	 public void setLastblock(int lastblock) {
	       
	        this.lastblock = totalcount / (5*this.contentNo);

	        if(totalcount %(5*this.contentNo)>0){
	            this.lastblock++;
	        }
	    }
	 public void setStartPage(int currentblock) {
	        this.startPage = (currentblock*5)-4;
	    
	     }
	 public void setEndPage(int getlastblock, int getcurrentblock) {
	       
	        if(getlastblock == getcurrentblock){
	            this.endPage = calcpage(getTotalcount(),getContentNo()); // 전체페이지 개수가 오는곳
	        }else{
	            this.endPage = getStartPage()+4;   
	        }
	    }
	 public void prevnext(int pageNo){
	        
	        if(calcpage(totalcount,contentNo)<6){
	            setPrev(false);
	            setNext(false);
	       }else if(pageNo>0 && pageNo<6){
	           setPrev(false);
	           setNext(true);
	       }else if(getLastblock() == getCurrentblock()){
	            setPrev(true);
	            setNext(false);
	        }else{
	            setPrev(true);
	            setNext(true);
	        }
	    }
	public void prenex(int pageNo) {
		  if(pageNo==1 && pageNo == calcpage(getTotalcount(),getContentNo())){
	           setPre(false);
	           setNex(false);
	       }else if(pageNo==1) {
	    	   setPre(false);
	           setNex(true);
	       }
		  
		  else if(pageNo == calcpage(getTotalcount(),getContentNo())){
	            setPre(true);
	            setNex(false);
	        }else{
	            setPre(true);
	            setNex(true);
	        }
	    }
}
