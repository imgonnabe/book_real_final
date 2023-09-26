<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
    
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--  
    Document Title
    =============================================
    -->
    <title>동네북 | 우리동네 동네북</title>
    <!--  
    Favicons
    =============================================
    -->
    <link rel="apple-touch-icon" sizes="57x57" href="assets/images/favicons/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="assets/images/favicons/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="assets/images/favicons/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="assets/images/favicons/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="assets/images/favicons/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="assets/images/favicons/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="assets/images/favicons/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="assets/images/favicons/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="assets/images/favicons/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192" href="assets/images/favicons/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="assets/images/favicons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="assets/images/favicons/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicons/favicon-16x16.png">
    <link rel="manifest" href="assets/images/favicons/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="assets/images/favicons/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">
    <!--  
    Stylesheets
    =============================================
    
    -->
    <!-- Default stylesheets-->
    <link href="assets/lib/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Template specific stylesheets-->
    
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Volkhov:400i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
    <link href="assets/lib/animate.css/animate.css" rel="stylesheet">
    <link href="assets/lib/components-font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="assets/lib/et-line-font/et-line-font.css" rel="stylesheet">
    <link href="assets/lib/flexslider/flexslider.css" rel="stylesheet">
    <link href="assets/lib/owl.carousel/dist/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="assets/lib/owl.carousel/dist/assets/owl.theme.default.min.css" rel="stylesheet">
    <link href="assets/lib/magnific-popup/dist/magnific-popup.css" rel="stylesheet">
    <link href="assets/lib/simple-text-rotator/simpletextrotator.css" rel="stylesheet">
    <!-- Main stylesheet and color file-->
    <link href="assets/css/style.css" rel="stylesheet">
    <link id="color-scheme" href="assets/css/colors/default.css" rel="stylesheet">
    <link href="../css/bookdetail.css" rel="stylesheet">
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <script type="text/javascript">
    
    /* -------  BS --------------------------------------------------------*/
 
    document.addEventListener("DOMContentLoaded", function() {
        var rdelButtons = document.querySelectorAll("#rdel");

        rdelButtons.forEach(function(button) {
            button.addEventListener("click", function() {
                if (confirm("댓글을 삭제하시겠습니까?")) {
                    let reno = this.closest('.comment').querySelector('.reno').textContent;
                    let comments = this.closest('.comment');

                    $.ajax({
                        url: "./rdelR",
                        type: "post",
                        data: { bkno: ${bookdetail.bkno}, reno: reno },
                        dataType: "json",
                        success: function(data) {
                            if (data.result == 1) {
                                comments.remove();
                            } else {
                                alert("통신에 문제가 발생했습니다.")
                            }
                        },
                        error: function(error) {
                            alert("에러가 발생했습니다.");
                        }
                    });
                }
            });
        });
    });
    /* --------------------------------------------------------------------*/
    
    
    </script>
    <script type="text/javascript">
    
    /* -------  BS --------------------------------------------------------*/

    function submitReviewForm() {
        //리뷰목록 확인
        let isUserReviewed = false;
        let reviewAuthors = document.querySelectorAll('.comment-author b');
        for (var i = 0; i < reviewAuthors.length; i++) {
            if (reviewAuthors[i].textContent === "${sessionScope.mid}") {
                isUserReviewed = true;
                break;
            }
        }

        // 로그인여부
        let mid = "${sessionScope.mid}";
        if (!mid) {
            alert("로그인이 필요합니다.");
            return false;
        }

        // 리뷰 1개만
        if (isUserReviewed) {
            alert("이미 리뷰를 작성하셨습니다. 리뷰는 1개만 작성 가능합니다.");
            return false;
        }

        // 구매,대여 내역 확인 리뷰 내용 확인
        let rescore = document.querySelector('select[name="rescore"]').value;
        let recomment = document.querySelector('textarea[name="recomment"]').value;
        let trademid = "${booktrade}";
    	let rentalmid = "${bookrental}";
        
    	if (mid && (trademid.includes(mid) || rentalmid.includes(mid))) {
            if (!rescore || !recomment) {
                alert("평점과 리뷰 내용을 모두 입력하세요.");
                return false;
            }else{
            document.querySelector('#reviewForm').submit();
            return true;
            }
            
    	} else {
    		alert("해당책을 구매/대여시 리뷰 작성가능합니다.");
    	    return false;
    	}
    }
    
    /* --------------------------------------------------------------------*/

    </script>
    
    
    <script type="text/javascript">
  
    /* -------  SH --------------------------------------------------------*/
       //날짜 제한
    $(function(){    	  
        let today = new Date();
        let dd = String(today.getDate()).padStart(2, '0');
		  let mm = String(today.getMonth() +1).padStart(2, '0'); // 1월은 0으로 시작하므로 +1
        let yyyy = today.getFullYear();
        
        today = yyyy + '-' + mm + '-' + dd;
        
		 	console.log(today);
		 	
		 	<c:set var="today" value="${today}" />
			    // 대여일 입력 필드에 현재 날짜 이후로만 입력하도록 설정
			    document.getElementById('rsdate').setAttribute('min', today);
			    
		      
			 // 대여일 입력 이벤트 처리
			    $("#rsdate").change(function () {
			        let rsdate = $(this).val(); // 대여일
			        let rddateInput = $("#rddate");
			        
			        if (rsdate) {
			            let maxRddate = new Date(rsdate);
			            maxRddate.setDate(maxRddate.getDate() +7); // 대여일로부터 7일 이후
		
			            // 반납일 입력 필드에 대여일로부터 7일 이후까지만 입력하도록 설정
			            let maxRddateStr = formatDate(maxRddate);
			            rddateInput.attr('max', maxRddateStr);
			        } else {
			            // 대여일을 선택하지 않았을 경우 반납일 제한 없음
			            rddateInput.removeAttr('max');
			        }
				    document.getElementById('rddate').setAttribute('min', rsdate);
			    });
          
		 	function formatDate(date){
		          let dd = String(date.getDate()).padStart(2, '0');
				  let mm = String(date.getMonth()+1).padStart(2, '0'); // 1월은 0으로 시작하므로 +1
		          let yyyy = date.getFullYear();
		          
		          return yyyy + '-' + mm + '-' + dd;
		 	}
	});
	 //책 대여
    $(function(){
       $("#rental").click(function(){
          let rddate = $("#rddate").val();
          let rsdate = $("#rsdate").val();
          let bkno = ${bookdetail.bkno };
      	let rdel = ${rentaldata.rdel };
      	let mid = "${sessionScope.mid}";

		if(rdel == 0){  
			
			if (rsdate === "" && rddate === "") {
	            alert("날짜를 입력하세요.");
	        } else if (rsdate === "") {
	            alert("대여일을 입력하세요.");
	        } else if (rddate === "") {
	            alert("반납일을 입력하세요.");
	        } else {
          $.ajax({
             url : "./rental",
             type : "POST",
             data : {"rsdate" : rsdate, "rddate" : rddate,   "bkno" : bkno},
             dataType : "json",
             success : function(data) {
                //alert(data.result);
                if(data.result == 1){
             			 alert("대여가 완료 되었습니다"); 
             			window.location.href = "/mypage/rent";
                } else {
                   alert("로그인 후 이용 가능합니다.");
                }
             	},
             error : function(request, status, error) {
                alert("대여실패 : " + error);
             }
          });
      	} 
			
		} else {
			alert("대여중입니다. 대여가 불가능합니다.");
      	} 
       });
    });
   //반납하기
   $(function(){
  	 $("#returnBook").click(function(){
           let bkno = ${bookdetail.bkno };
       	 let rdel = ${rentaldata.rdel };
       	 let mid = "${sessionScope.mid}";
       	 
       	 $.ajax({
               url : "./returnBook",
               type : "POST",
               data : {"bkno" : bkno, "rdel" : rdel, "mid" : mid },
               dataType : "json",
               success: function(data) {
              	 if(data.returnBook == 1){
              		  alert("반납성공");
           				window.location.href = "/mypage/rent";
              	 } else {
              		 alert("반납실패");
              	 }
              	   
              	},
               error : function(request, status, error) {
              	 alert("에러입니다" + error);
              	  console.log("에러 발생: " + request);
               }
            });
  	 }); 
  });
     /* ------------상민--------------------------------------------------------*/

     
     
     
     
     
     
          $(function (){
           $("#basket").click(function() {
              
              let price = ${bookdetail.bkprice };
              let bkimg = '${bookdetail.bkimg }';
              let bkno = ${bookdetail.bkno };
              let amount = parseInt($("#amount").val());
                         
              
             if(amount == 0){
                alert("0개는 구매하실 수 없어요 ^^")
               return false 
             }
              
              if (amount > ${bookdetail.bstock}) {
                 alert("입력값이 현재 재고를 초과합니다.");
             return false;  

              }

             $.ajax({
               url: "./cart", 
               type: "POST",
               data:{"bkno" : bkno, "price" : price, "amount" : amount, "bkimg" : bkimg },
               dataType : "json",
               
               success: function(data) {
                 
                  if(confirm("장바구니에 추가 되었습니다. 장바구니로 이동하시겠습니까?")){   
                  
                     location.href="./cart";
                    
                    }else{
         
                       location.href="./bookdetail?bkno="+${bookdetail.bkno};
                    }
                  
                  
                    },
                    
               error: function() {
                 alert("안된다.");
               }
             
             });
              
             });
           }); 
   </script>
    
    
  </head>
  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
  <%@ include file="menu.jsp"%>
    <main>
      <div class="main">
        <section class="module">
          <div class="container">
            <div class="row"> 
              <div class="col-sm-6 mb-sm-40"><a class="gallery" href="/img/bookimg/${bookdetail.bkimg }"><img src="/img/bookimg/${bookdetail.bkimg }" alt="책이미지"/></a>
              </div>
              <div class="col-sm-6">
                <div class="row">
                  <div class="col-sm-12">
                    <h1 class="product-title font-alt">${bookdetail.bkname }</h1>
                    <img class="zheart" id="zheart" src="../img/icon/heartOff.png"/>
                  </div>
                  <div class="col-sm-12">
                    <h5 class="product-title font-alt">${bookdetail.bkwrite }</h5>
                  </div>
                </div>
                <div class="row mb-20">
                  <div class="col-sm-12">
                  	<c:if test="${not empty reviewsList}">
						<c:set var="totalScore" value="0" />
						<c:set var="totalCount" value="0" />

					    <c:forEach items="${reviewsList}" var="r">
						  <c:if test="${not empty r.rescore}">
							<c:set var="totalScore" value="${totalScore + r.rescore}" />
							<c:set var="totalCount" value="${totalCount + 1}" />
						  </c:if>
						</c:forEach>

						<c:if test="${totalCount > 0}">
							<c:set var="averageScore" value="${totalScore / totalCount}" />
							평점 
							<c:forEach var="i" begin="1" end="5">
								<c:choose>
									<c:when test="${i <= averageScore}">
										<span><i class="fa fa-star star"></i></span>
									</c:when>
									<c:otherwise>
										<span><i class="fa fa-star star-off"></i></span>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:if>
					</c:if>
                  <a class="open-tab section-scroll" href="#reviews" data-toggle="tab">- ${reviewsList[0].count == null ? 0 : reviewsList[0].count}개의 리뷰</a>
                  </div>
                </div>
                <div class="row mb-20">
                  <div class="col-sm-6">
                    <div class="price font-alt"><span class="amount"><fmt:formatNumber value="${bookdetail.bkprice }" pattern="#,###"/>원</span></div>
                  </div>
                </div>
                <div class="row mb-20">
                  <div class="col-sm-12">
                    <div class="description">
                      <p>${bookdetail.bkscontent }</p>
                    </div>
                  </div>
                </div>
                
               <div class="row mb-20"> 
                   <ul class="nav nav-tabs font-alt" role="tablist">
                   <li class="active"><a href="#buy" data-toggle="tab">구매</a></li>
                   <li><a href="#trade" data-toggle="tab">대여</a></li>
                  </ul>
                  
                <div class="tab-content">
                
                <!--  -------  구매 -------------------------------------------------------- -->
                   <div class="tab-pane active" id="buy">
                              <form action="./cart" method="post" id="cartForm">
                                 <input type="hidden" name="bkimg" value="${bookdetail.bkimg }"> 
                                 <input type="hidden" name="price" value="${bookdetail.bkprice }"> 
                                 <input type="hidden" name="bkno" value="${bookdetail.bkno }">
                                 <textarea name="bkscontent" style="display: none">${bookdetail.bkscontent }</textarea>

                                 <c:if test="${sessionScope.mid ne null }">
                                    <div class="col-sm-4 mb-sm-20">
                                       <input class="form-control input-lg" type="number"
                                          id="amount" max="${bookdetail.bstock }" min="1" value="1"
                                          required="required"/>
                                    </div>
                                    <div class="col-sm-8">
                                    <button class="btn btn-lg btn-block btn-round btn-b"
                                          type="button" id="basket">장바구니 담기</button>




                                    </div>
                                 </c:if>
                              </form>
                                 <c:if test="${sessionScope.mid eq null }">
                                    <div class="col-sm-8">
                                       <a class="btn btn-lg btn-block btn-round btn-b">회원만
                                          이용가능합니다.</a>
                                    </div>
                                 </c:if>
                           </div>

                
                <!--  ----------------------------------------------------------------------- -->
                
                <!--  -------  대여 -------------------------------------------------------- -->
                
				<div class="tab-pane" id="trade">
			        <c:if test="${rentaldata.rdel eq 0 }">
						<c:forEach items="${overdue }" var="row">
							<script>
					           var rddate = new Date('${row.rddate}'); // row.rddate를 JavaScript Date 객체로 파싱
					           var today = new Date(); // 현재 날짜를 얻습니다.
					           if (rddate < today) {
					        	   var confirmation = confirm("연체된 책이 있습니다. 반납해 주세요.");
					        	   if(confirmation){
					        		   window.location.href = '/mypage/rent';
					        	   }
					           }
					         </script>
					    </c:forEach>  
			        	<div class="col-sm-6 mb-sm-20">
			              대여일<input class="form-control input-lg" type="date" id="rsdate" name="rsdate"  required="required"/> </div>
			            <div class="col-sm-6 mb-sm-20">
			              반납일<input class="form-control input-lg" type="date" id="rddate" name="rddate"  required="required"/></div>
			            <div class="col-sm-12"><br><a class="btn btn-lg btn-block btn-round btn-b" href="#" id="rental">대여하기</a></div>
	                </c:if>
	                
			        <c:if test="${rentaldata.rdel eq 1 }">
						<c:forEach items="${overdue }" var="row">
							<script>
					           var rddate = new Date('${row.rddate}'); // row.rddate를 JavaScript Date 객체로 파싱
					           var today = new Date(); // 현재 날짜를 얻습니다.
					           if (rddate < today) {
					        	   alert("연체된 책이 있습니다. 반납해 주세요.");
					           }
					           </script>
					    </c:forEach> 
					    <div>대여중...${rentaldata.rddate }일 이후부터 대여가능</div>
						<div class="col-sm-6 mb-sm-20">
						 대여일<input class="form-control input-lg" type="date" id="rsdate" name="rsdate"  required="required"/></div>
						<div class="col-sm-6 mb-sm-20">
						반납일<input class="form-control input-lg" type="date" id="rddate" name="rddate"  required="required"/></div>
						<div class="col-sm-12"><br><a class="btn btn-lg btn-block btn-round btn-b " href="#" id="rental">대여하기</a></div>
						<c:if test="${rentaldata.rdel eq 1 && sessionScope.mid eq rentaldata.mid}">
						<div class="col-sm-12"><br><a class="btn btn-lg btn-block btn-round btn-b" href="#" id="returnBook">반납하기</a></div>
						</c:if>   
			       </c:if>
 			 </div>
                  
                <!--  ----------------------------------------------------------------------- -->
                  
                </div> 
                </div> 
                <div class="row mb-20">
                  <div class="col-sm-12">
                    <div class="product_meta" >태그 : <a href="./booklist?searchN=write&searchV=${bookdetail.bkwrite }" style="color: #0093ff;">#${bookdetail.bkwrite }</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            <!--  -------  리뷰 -------------------------------------------------------- -->
            <div class="row mt-70">
              <div class="col-sm-12">
                <ul class="nav nav-tabs font-alt" role="tablist">
                  <li class="active"><a href="#description" data-toggle="tab">책 정보</a></li>
                  <li ><a href="#reviews" data-toggle="tab">리뷰 (${reviewsList[0].count == null ? 0 : reviewsList[0].count})</a></li>
                </ul>
                <div class="tab-content">
                  <div class="tab-pane active" id="description">
                    <p>${bookdetail.bkcontent }</p>
                  </div>
                  
                  <div class="tab-pane" id="reviews">
                    <div class="comments reviews">                
                <c:choose>
		        <c:when test="${reviewsList[0].count eq null}">
			       <section class="module-small">
				     <div class="container">
					 <h2 style="text-align: center;">리뷰가 없습니다.</h2>
				     </div>
			       </section>
		        </c:when>
	            <c:otherwise>
				<c:forEach items="${reviewsList }" var="r">				
					<div class="comment">
						<div class="comment-avatar">
							<img src="../img/grade/grade${r.mgrade }.png" alt="avatar" />
						</div>
						<div class="comment-content clearfix">
							<div class="comment-author">
								<b>${r.mid }</b>
							</div>
							<div class="comment-meta">
							  <c:forEach var="i" begin="1" end="5">
							      <c:choose>
							          <c:when test="${i <= r.rescore}">
							              <span><i class="fa fa-star star"></i></span>
							          </c:when>
							          <c:otherwise>
							              <span><i class="fa fa-star star-off"></i></span>
							          </c:otherwise>
							      </c:choose>
							  </c:forEach>
							</div>
							<div class="comment-body">
								<p class="recomment">${r.recomment }</p>
							</div>
						    <div class="comment-meta">
								${r.redate }
							</div>
							<c:if test="${sessionScope.mid eq r.mid || sessionScope.mgrade ge 2}">
							    <div>
							    <div class="reno" style="display: none;">${r.reno }</div>
							         <a class="fa fa-trash-o" id="rdel" style="color: red; cursor : pointer;"></a>
							    </div>
							</c:if>
						</div>
					</div>
					</c:forEach>
					</c:otherwise>
					</c:choose>
				  </div>
                    <div class="comment-form mt-30">
                      <h4 class="comment-form-title font-alt">리뷰 쓰기</h4>
                      <form id="reviewForm" action="./addreview" method="post">
                        <div class="row">
                          <div class="col-sm-4">
                            <div class="form-group">
                              <select class="form-control" name="rescore">
                                <option selected="true" disabled="" >평점</option>
                                <option value="1">1점</option>
                                <option value="2">2점</option>
                                <option value="3">3점</option>
                                <option value="4">4점</option>
                                <option value="5">5점</option>
                              </select>
                            </div>
                          </div>
                          <input type="hidden" name="bkno" value="${bookdetail.bkno }">
                          <div class="col-sm-12">
                            <div class="form-group">
                              <textarea class="form-control" id="recomment" name="recomment" rows="4" placeholder="구매,대여자만 리뷰작성 가능합니다."></textarea>
                            </div>
                          </div>
                          <div class="col-sm-12">
                            <button class="btn btn-round btn-d" type="button" onclick="submitReviewForm()" >리뷰 작성</button>
                          </div>
                        </div>
                      </form>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>

        <hr class="divider-w">
        <section class="module-small">
          <div class="container">
            	<div class="row"  style="background-color: #f2f2f2; border-radius:20px; margin-top: 5%;">
					<div class="row" style="width: 90%; margin-left: 50px;">
					<div class="row">
						<div class="col-sm-6">
							<h3 class="best-title" style="margin-top: 35px;margin-bottom: 35px;">이달의 베스트셀러</h3>
						</div>
					</div>
					<div class="row">
						<div class="owl-carousel text-center" data-items="5" data-pagination="false" data-navigation="false">
							<c:forEach items="${booktop }" var="row" varStatus="loop">
								<div class="owl-item">
									<div class="col-sm-12">
										<div class="ex-product">
											<span class="bestnumber">${loop.index + 1}</span> <a
												href="./bookdetail?bkno=${row.bkno}"><img
												src="/img/bookimg/${row.bkimg}" alt="Leather belt" /></a>
											<h4 class="shop-item-title font-alt">
												<a href="./bookdetail?bkno=${row.bkno}">${row.bkname}</a>
											</h4>
											<fmt:formatNumber value="${row.bkprice}" pattern="#,###" />
											원
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
						</div>
					</div>
					</div>
          <div class="row"  style="background-color: #f2f2f2; border-radius:20px; margin-top: 5%;">
					<div class="row" style="width: 90%; margin-left: 50px;">
					<div class="row">
						<div class="col-sm-6">
							<h3 class="best-title" style="margin-top: 35px;margin-bottom: 35px;">급상승! 많이 보고 있는 책 </h3>
						</div>
					</div>
					<div class="row">
						<div class="owl-carousel text-center" data-items="5" data-pagination="false" data-navigation="false">
							<c:forEach items="${bookrtop }" var="row" varStatus="loop">
								<div class="owl-item">
									<div class="col-sm-12">
										<div class="ex-product">
											<span class="bestnumber">${loop.index + 1}</span> <a
												href="./bookdetail?bkno=${row.bkno}"><img
												src="/img/bookimg/${row.bkimg}" alt="Leather belt" /></a>
											<h4 class="shop-item-title font-alt">
												<a href="./bookdetail?bkno=${row.bkno}">${row.bkname}</a>
											</h4>
											<fmt:formatNumber value="${row.bkprice}" pattern="#,###" />
											원
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
						</div>
					</div>
					</div>
          </div>
        </section>
        
        <!-- 풋영역 -->
			<footer class="footer bg-dark">
				<div class="container">
					<div class="row">
						<div class="col-sm-6">
							<p class="copyright font-alt" style="font-size: 11px;">
								&copy; 2023&nbsp;<a href="/main">DongneBook</a>, All Rights
								Reserved
							</p>
						</div>
					</div>
				</div>
			</footer>
      </div>
      <div class="scroll-up"><a href="#totop"><i class="fa  fa-chevron-up"></i></a></div>
    </main>
    <!--  
    JavaScripts
    =============================================
    -->
       <script type="text/javascript">
    	
       var zHeart = document.getElementById("zheart");
       var bkno = "${bookdetail.bkno}"; // 현재 페이지의 bkno 값
       var bkno2 = ${bookdetail.bkno}; 
       

       // 페이지 로딩 시 찜 상태에 따라 하트 이미지 초기 설정
       document.addEventListener("DOMContentLoaded", function () {
           var zzimBookNumbers = ${zzimBooklist}; // 모델에서 전달한 찜한 책의 bkno 배열

           if (zzimBookNumbers.includes(bkno2)) {
               zHeart.src = "../img/icon/heartOn.png";
           } else {
               zHeart.src = "../img/icon/heartOff.png";
           }
       });


       // 하트 이미지 클릭 이벤트
       zHeart.addEventListener("click", function () {
         if(${sessionScope.mid == null}){
            alert("로그인 해주세요")
           }else{
           if (zHeart.src.includes("heartOff.png")) {
               // 클릭 시 찜하기 (INSERT) AJAX 요청 실행
               sendAjaxRequest(bkno, "INSERT");
               zHeart.src = "../img/icon/heartOn.png"; // 이미지 변경
           } else {
               // 클릭 시 찜 취소 (DELETE) AJAX 요청 실행
               sendAjaxRequest(bkno, "DELETE");
               zHeart.src = "../img/icon/heartOff.png"; // 이미지 변경
           }
           }
       });
    	

    	function sendAjaxRequest(bkno, action) {
    	    const xhr = new XMLHttpRequest();
    	    const url = `/bookdetail`; 
    	    
    	    xhr.open("POST", url, true);
    	    xhr.setRequestHeader("Content-Type", "application/json");
    	    
    	    const data = JSON.stringify({ bkno, action });

    	    xhr.onreadystatechange = function () {
    	        if (xhr.readyState === 4 && xhr.status === 200) {
    	            const response = JSON.parse(xhr.responseText);
    	            if (response.success) {
    	                console.log(`찜하기 ${action} 성공`);
    	            } else {
    	                console.error(`찜하기 ${action} 실패`);
    	            }
    	        }
    	    };
    	    xhr.send(data);
    	}
    </script>
    
    
    
    <script src="assets/lib/jquery/dist/jquery.js"></script>
    <script src="assets/lib/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="assets/lib/wow/dist/wow.js"></script>
    <script src="assets/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
    <script src="assets/lib/isotope/dist/isotope.pkgd.js"></script>
    <script src="assets/lib/imagesloaded/imagesloaded.pkgd.js"></script>
    <script src="assets/lib/flexslider/jquery.flexslider.js"></script>
    <script src="assets/lib/owl.carousel/dist/owl.carousel.min.js"></script>
    <script src="assets/lib/smoothscroll.js"></script>
    <script src="assets/lib/magnific-popup/dist/jquery.magnific-popup.js"></script>
    <script src="assets/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
    <script src="assets/js/plugins.js"></script>
    <script src="assets/js/main.js"></script>
  </body>
</html>