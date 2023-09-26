<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
    
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--  
    Document Title
    =============================================
    -->
    <title>Titan | Multipurpose HTML5 Template</title>
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
    <link href="../css/booklist.css" rel="stylesheet">
    <style type="text/css">
    
    </style>
    <script type="text/javascript">

    window.onload = function() {
   
     //카테고리 선택하면 페이지 바로이동
      let selectElement = document.querySelector("select[name='bkcate']");
      let currentBkcate = getUrlParameter('bkcate');
      if (currentBkcate) {
        selectElement.value = currentBkcate;
      }
      
      //카테고리 유지
      let searchN = document.getElementById("searchN");
      let searchNvalue = getUrlParameter('searchN');
      if (searchNvalue) {
    	  searchN.value = searchNvalue;
      }
      
     //검색값 유지
      let searchV = document.getElementById("searchV");
      let searchVvalue = getUrlParameter('searchV');
      if (searchVvalue) {
    	  searchV.value = searchVvalue;
      }
    
     //페이지값 유지
      let pageSize = document.getElementById("pageSize");
      let pageSizevalue = getUrlParameter('pageSize');
      if (pageSizevalue) {
    	  pageSize.value = pageSizevalue;
      }
    };
    
    function resetPage() {
        let pageSize = document.getElementById("pageSize");
        pageSize.value = ""; 

        let searchN = document.getElementById("searchN");
        searchN.value = ""; 

        let searchV = document.getElementById("searchV");
        searchV.value = ""; 

        window.location.href = "/booklist?bkcate=0";
    }
    

    function getUrlParameter(name) {
      name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
      let regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
      let results = regex.exec(location.search);
      return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
    }
    
    //페이징
    function pageSizeSelect(selectElement) {
    	  let pagesizesele = selectElement.value;
    	  let currentURL = window.location.href;
    	  let newURL;

    	  if (currentURL.includes('pageSize=')) {
    	    newURL = currentURL.replace(/(pageSize=)[^\&]+/, 'pageSize=' + pagesizesele);
    	  } else {
    	    let separator = currentURL.includes('?') ? '&' : '?';
    	    newURL = currentURL + separator + 'pageSize=' + pagesizesele;
    	  }

    	  window.location.href = newURL;
    	}

    function rePage(selectElement) {
      let selectedValue = selectElement.value;
        let url = './booklist?bkcate=' + selectedValue;
        window.location.href = url;
    }
    
    
    function addPageToURL(pageNumber) {
    	
    	  let currentURL = window.location.href;
    	  
    	  let hasPageParam = currentURL.includes('page=');

    	  if (hasPageParam) {
    	    let updatedURL = currentURL.replace(/(page=)[^\&]+/, 'page=' + pageNumber);
    	    window.location.href = updatedURL;
    	  } else {
    	    let separator = currentURL.includes('?') ? '&' : '?';
    	    let newURL = currentURL + separator + 'page=' + pageNumber;
    	    window.location.href = newURL;
    	  }
    	}
    
    </script>
  </head>
  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
  <%@ include file="menu.jsp"%>
    <main>
      <div class="main">
       <%
        String[] bpimgs = {"bp1.jpg", "bp2.jpg", "bp3.jpg", "bp4.jpg"};
        %>
       <hr class="divider-w">
          <div class="container">
            <div class="row" style="margin-top: 60px; margin-bottom: 15px">
              <div class="owl-carousel text-center" data-items="1" data-pagination="false" data-navigation="false">
             <% for (String bpimg : bpimgs) { %>
                <div class="owl-item">
                  <div class="col-sm-12">
                    <img src="../img/page/<%= bpimg %>" alt="이미지"  style="border-radius:20px;"/>
                  </div>
                </div>
               <% } %>
              </div>
            </div>
          </div>
        <hr class="divider-w">
        <!-- 필터 , 검색옵션 -->
        <section class="module-small" style="margin-top: -35px; margin-bottom: -35px;">
          <div class="container">
          <div class="col-sm-12">
              <div class="col-sm-3">
			    <button class="btn" onclick="resetPage()">전체보기</button>
		      </div>
            <form action="./booklist" method="get" class="row">
              <div class="col-sm-2">
                <select class="form-control" name="bkcate">
                  <option selected="selected" value="0">전체장르</option>
		            <option value="1">소설</option>
					<option value="2">시/에세이</option>
					<option value="3">자기계발</option>
					<option value="4">컴퓨터/IT</option>
					<option value="5">생활(요리/건강)</option>
                </select>
              </div>
              <div class="col-sm-2">
                <select class="form-control" name="searchN" id="searchN">
                  <option selected="selected" value="all">전체조건</option>
                  <option value="name">책이름</option>
                  <option value="write">저자</option>
                </select>
              </div>
              <%-- <input type="hidden" name="bkcate" value="${param.bkcate }" > --%>
              <div class="col-sm-4">
                    <div class="search-box">
                      <input class="form-control" type="text" name="searchV" id="searchV" placeholder="검색..."/>
                      <button class="search-btn" type="submit"><i class="fa fa-search"></i></button>
                    </div>
              </div>
            </form>
            </div>
          </div>
        </section>
        <hr class="divider-w">
  
        <!-- 본문 책리스트 -->
 
        <section class="module-small">
          <div class="container" style="width: 100%">
              <div class="col-sm-1 col-md-1 sidebar">
                <div class="pSize">
                  <select class="form-control" name="pageSize" id="pageSize" onchange="pageSizeSelect(this)" >
                   <option selected="selected" value="8">8개씩 보기</option>
                   <option value="16">16개씩 보기</option>
                   <option value="32">32개씩 보기</option>
                  </select>
                 </div>
                <div class="widget">
                <h4><b>카테고리</b></h4>
                  <h3 class="widget-title"></h3>
                  <ul class="">
                    <li ><a href="./booklist?bkcate=0">  전체 도서</a></li>
                      <li><a href="/booklist?bkcate=1">- 소설</a></li>
                      <li><a href="/booklist?bkcate=2">- 시/에세이</a></li>
                      <li><a href="/booklist?bkcate=3">- 자기계발</a></li>
                      <li><a href="/booklist?bkcate=4">- 컴퓨터/IT</a></li>
                      <li><a href="/booklist?bkcate=5">- 생활(요리/건강)</a></li>
                  </ul>
                  <h3 class="widget-title"></h3>
                </div>
<%--                 <div class="widget">
                  <h5 class="widget-title font-alt">최근본 책</h5>
                  <ul class="widget-posts">
                  <c:forEach items="${booktop }" var="list"> 
                    <li class="clearfix">
                      <div class="widget-posts-image"><a href="#"><img src="/img/bookimg/${list.bkimg}"/></a></div>
                      <div class="widget-posts-body">
                        <div class="widget-posts-title"><a href="#">${list.bkname}</a></div>
                        <div class="widget-posts-meta">${list.bkwrite}</div>
                      </div>
                    </li>
                    </c:forEach>
                  </ul>
                </div> --%>
              </div>

             <div class="col-sm-8 col-sm-offset-1">
            <div class="row multi-columns-row">
              <c:if test="${booklist[0].count eq null or booklist[0].count eq 0}">
               <h2>검색 결과가 없습니다.</h2>
              </c:if>
              <c:forEach items="${booklist }" var="row">         
              <div class="col-sm-3 col-md-3 col-lg-3">
                <div class="shop-item">
                  <div class="shop-item-image">
                  <img style="height: 418px;" src="/img/bookimg/${row.bkimg}" alt="책이미지"/>
                  <img class="zheart" id="zheart-${row.bkno}" src="../img/icon/zzheart.png" data-img-bkno="${row.bkno}" style="display: none"/>
                    <div class="shop-item-detail" ><a class="btn btn-round btn-b" href="./bookdetail?bkno=${row.bkno}">
                    상세보기</a><br><br>
                    <a class="btn btn-round btn-b toggleheart" id="toggleheart-${row.bkno}" data-bkno="${row.bkno}">
                    찜하기</a>
                    </div>
                  </div>
                  <h3 class="shop-item-title font-alt"><a href="./bookdetail?bkno=${row.bkno}">${row.bkname}</a></h3>
                  <div class="shop-item-write">
                  <a href="./booklist?searchN=write&searchV=${row.bkwrite }">
                  ${row.bkwrite}
                  </a>
                  </div>
                  <fmt:formatNumber value="${row.bkprice}" pattern="#,###"/>원
                </div>
              </div>
              </c:forEach>
            </div>
			</div>
			</div>
			<!-- 페이징 -->
			<div class="rowPagin">
				<div class="col-sm-12">
					<div class="pagination font-alt">
						<c:if test="${currentPage > 1}">
							<a href="javascript:void(0);" onclick="addPageToURL(1)"><i
								class="fa fa-angle-double-left"></i></a>
							<a href="javascript:void(0);"
								onclick="addPageToURL(${currentPage - 1})"><i
								class="fa fa-angle-left"></i></a>
						</c:if>
						<c:forEach var="pageNo" begin="1" end="${totalPage}">
							<c:choose>
								<c:when test="${pageNo == currentPage}">
									<a class="active">${pageNo}</a>
								</c:when>
								<c:otherwise>
									<a href="javascript:void(0);" onclick="addPageToURL(${pageNo})">${pageNo}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${currentPage < totalPage}">
							<a href="javascript:void(0);"
								onclick="addPageToURL(${currentPage + 1})"><i
								class="fa fa-angle-right"></i></a>
							<a href="javascript:void(0);"
								onclick="addPageToURL(${totalPage})"><i
								class="fa fa-angle-double-right"></i></a>
						</c:if>
					</div>
				</div>
			</div>
        </section>

			<!-- 하단 풋 -->

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
    	
    	document.addEventListener("DOMContentLoaded", function () {
    	    const likeButtons = document.querySelectorAll("[data-bkno]");
    	    const zzimBookNumbers = ${zzimBooklist};
    	    

    		   
    	    likeButtons.forEach(function (button) {
    	        const bkno = button.getAttribute("data-bkno");

    	        if (zzimBookNumbers.includes(parseInt(bkno))) {
    	        	const heartImage = document.querySelector('[data-img-bkno="'+bkno+'"]');
    	            heartImage.style.display = "inline";
    	        }

    	        button.addEventListener("click", function (event) {
    	          if(${sessionScope.mid == null}){
    		            alert("로그인 해주세요")
    	            }else{
    	            event.preventDefault();

    	             const bkno = button.getAttribute("data-bkno");
    	             const heartImage = document.querySelector('[data-img-bkno="'+bkno+'"]');

    	            if (heartImage) {
    	                if (heartImage.style.display === "none" || heartImage.style.display === "") {
    	                    heartImage.style.display = "inline";
    	                    sendAjaxRequest(bkno, "INSERT");
    	                } else {
    	                    heartImage.style.display = "none";
    	                    sendAjaxRequest(bkno, "DELETE");
    	                }
    	            }
     	           }
    	        });
    	    });
    	    
    	});
    	

    	function sendAjaxRequest(bkno, action) {
    	    const xhr = new XMLHttpRequest();
    	    const url = `/booklist`; 
    	    
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


    <script src="../assets/lib/jquery/dist/jquery.js"></script>
    <script src="../assets/lib/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="../assets/lib/wow/dist/wow.js"></script>
    <script src="../assets/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
    <script src="../assets/lib/isotope/dist/isotope.pkgd.js"></script>
    <script src="../assets/lib/imagesloaded/imagesloaded.pkgd.js"></script>
    <script src="../assets/lib/flexslider/jquery.flexslider.js"></script>
    <script src="../assets/lib/owl.carousel/dist/owl.carousel.min.js"></script>
    <script src="../assets/lib/smoothscroll.js"></script>
    <script src="../assets/lib/magnific-popup/dist/jquery.magnific-popup.js"></script>
    <script src="../assets/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
    <script src="../assets/js/plugins.js"></script>
    <script src="../assets/js/main.js"></script>
  </body>
</html>