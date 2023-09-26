<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>멀티보드</title>
 <!--  
    Favicons
    =============================================
    -->
    <link rel="apple-touch-icon" sizes="57x57" href="../assets/images/favicons/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="../assets/images/favicons/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="../assets/images/favicons/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="../assets/images/favicons/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="../assets/images/favicons/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="../assets/images/favicons/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="../assets/images/favicons/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="../assets/images/favicons/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="../assets/images/favicons/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192" href="../assets/images/favicons/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="../assets/images/favicons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="../assets/images/favicons/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="../assets/images/favicons/favicon-16x16.png">
    <link rel="manifest" href="../assets/images/favicons/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="../assets/images/favicons/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">
    <!--  
    Stylesheets
    =============================================
    -->
    <!-- Default stylesheets-->
    <link href="../assets/lib/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Template specific stylesheets-->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Volkhov:400i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
    <link href="../assets/lib/animate.css/animate.css" rel="stylesheet">
    <link href="../assets/lib/components-font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="../assets/lib/et-line-font/et-line-font.css" rel="stylesheet">
    <link href="../assets/lib/flexslider/flexslider.css" rel="stylesheet">
    <link href="../assets/lib/owl.carousel/dist/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="../assets/lib/owl.carousel/dist/assets/owl.theme.default.min.css" rel="stylesheet">
    <link href="../assets/lib/magnific-popup/dist/magnific-popup.css" rel="stylesheet">
    <link href="../assets/lib/simple-text-rotator/simpletextrotator.css" rel="stylesheet">
    <!-- Main stylesheet and color file-->
    <link href="../assets/css/style.css" rel="stylesheet">
    <link id="color-scheme" href="../assets/css/colors/default.css" rel="stylesheet">
    <style type="text/css">
  	.col-sm-offset-1{
    	margin-left: 10px;
    }	
  
   .fi{
   		text-align: center;
   		margin-bottom: 30px;
   }
   .title{
    	text-align: left;	
    }
    .bb{
    	text-align : center;
    	position : fixed;
    }
    .rowPagin{
    	text-align: center;
    }
  
    .first{
    	margin: 0px;
    }
    .firstb{
    	position:relative;
    	top: 1px;
    }
    .font-alt{
    	margin-bottom : 30px;
    	position: relative;
    	right: 105px;
    }
    .search{
    	margin-bottom: 20px;
    	position: relative;
    	left: 30px;
    }
    .table-size{
    	width:95%;
    	text-align: center;
    }
    .search2{
    	width:100;
    	
    	
    }
    .searchN{
    	width: 13%;
    	height:35px;
    	position:relative;
    	right:4px;
    }
    .searchV{
   		 width: 65%;
   		 height:35px;
   		 position:relative;
    	right:4px;
    }
    .buttonf{
    	width:10%;
    	height: 35px;
    	position:relative;
    	right:4px;
    }
    </style>
<script src="../js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
function page(n){
	let pageNo = n;
	
	if("&searchN=${param.searchN}&searchV=${param.searchV}" == null || ""){
	location.href="./notice?board="+${param.board}+"&pageNo="+pageNo;
	}else{
	location.href="./notice?board=${param.board}&pageNo="+pageNo+"&searchN=${param.searchN}&searchV=${param.searchV}";
	}
}
function login(){
	alert("관리자만 사용가능합니다");


}
function alert2(){
	alert("1대1 문의는 본인이 작성한것만 볼 수 있습니다");
}

</script>
</head>
 <!-- --------------------------------------------------- 상단 ---------------------------------------------------------------- -->   
  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
  <%@ include file="../menu.jsp"%>
    <main>
      <div class="main">
       <hr class="divider-w">
          <div class="container" style="width: 100%; margin-bottom: 50px; margin-top:120px;">
 			<!--  옆 메뉴바  -->
 			<div class="col-sm-1 col-md-1 sidebar" style= "margin-top:150px;">
             <div class="widget">
                <a href="../community/boardM"><h4><b>커뮤니티</b></h4></a>
                  <h3 class="widget-title"></h3>
                  <ul class="icon-list">
                    <li><a href="../community/">전체</a></li>
                    <li><a href="../community/board?board=1">자유게시판</a></li>
                    <li><a href="../community/board?board=2">독후감</a></li>
                    <li><a href="../community/board?board=3">모임&스터디</a></li>
                    <li><a href="../community/board?board=4">도서 소식</a></li>
                  </ul>
                </div>
                
             <div class="widget">
               <a href="../community/noticeM"><h4><b>고객센터</b></h4></a>
                  <h3 class="widget-title"></h3>
                  <ul class="icon-list">
                    <li><a href="../community/notice?board=1">공지사항</a></li>
                    <li><a href="../community/notice?board=2">Q&A</a></li>
                    <li><a href="../community/notice?board=3">1대1 문의</a></li> 
                  </ul>
                </div>
              </div>
           <!--  옆 메뉴바  -->
             
             <div class="col-sm-8 col-sm-offset-1" style="margin-left: 165px;">
 			
            <div class="container">
            	 <div class="fi">
            	 <c:choose>
            	 <c:when test="${param.board eq 1 }"><img src="../board/공지사항.png" style="width: 500px;  height : 200px" class="rounded"></c:when>
            	 <c:when test="${param.board eq 2 }"><img src="../board/qna.png" style="width: 500px;  height : 200px" class="rounded"></c:when>
            	 <c:when test="${param.board eq 3 }"><img src="../board/문의.png" style="width: 500px;  height : 200px" class="rounded"></c:when>
            	 </c:choose>
            	 </div>
               <div class="first">
               	<ul class="filter font-alt" >
               	<c:choose><c:when test="${sessionScope.mgrade eq 2 ||param.board eq 3}"><button type="button" class ="btn btn-border-d btn-round firstb" onclick="location.href='./nwrite?board=${param.board}'">글쓰기</button></c:when>
               <c:otherwise><button type="button" class ="btn btn-border-d btn-round firstb" onclick="login()">글쓰기</button> </c:otherwise> 
               </c:choose> &nbsp;
               <c:forEach items="${nboardList }" var="l"><il><a href="${l.nsurl }">${l.nstitle }</a></il> &nbsp; &nbsp; </c:forEach> 
               &nbsp; &nbsp;<il> ${pag.pageNo} /${pag.endPage } 페이지</il>
                </ul>
               </div>
               
                        <!--   검색창  -->
               
               	<form action="./notice" method="get" class="search">
               		<input type="hidden" name="board" value=${param.board }>
               		<input type="hidden" name="pageNo" value="1">
               		<select name="searchN"  class="searchN" >
               			<option value="title">제목</option>
               			<option value="mid">작성자</option>
               			<option value="content">내용</option>
               		</select>
               		<input type="text" name="searchV" required="required"  class="searchV" >
               		<button type="submit" class="buttonf btn btn-border-d btn-round">검색</button>
               	</form>
               
               <!--   검색창  -->
               
               
               
               <c:choose>
               <c:when test="${fn:length(nlist) gt 0 }">
               <div class="table-size">
               <table class="table table-dark table-hover table-striped">
               <thead>
               	<tr class="row">
               		<th class="col-6 title">제목</th>
               		<th class="col-2 bb">날짜</th>
               		<th class="col-2 bb">글쓴이</th>
               		<th class="col-2 bb">읽음</th>
               	</tr>
               </thead>
               <tbody><c:forEach items="${nlist}" var="row">
               <tr class="row detail"  onclick= <c:choose><c:when test="${row.ncate ne 3  || sessionScope.mid eq row.mid || sessionScope.mgrade eq 2}">"location.href='./ndetail?board=${param.board}&nno=${row.nno}'"</c:when><c:otherwise>"alert2()"</c:otherwise></c:choose> >
               		<td class="col-6 title">${row.ntitle }<c:if test="${row.commentcount  ne 0}">&nbsp;<span class="badge bg-danger">${row.commentcount  }</span></c:if></td>
               		<td class="col-2 bb"><fmt:formatDate pattern="yyyy-MM-dd" value="${row.ndate}"/></td>
               		<td class="col-2 bb">${row.mid}</td>
               		<td class="col-2 bb">${row.nread }</td>
                </tr>
               </c:forEach>
               </tbody>
               </table>
               </div>
               </c:when>
                <c:otherwise>
               	<h1>글이 없습니다.</h1>
               </c:otherwise>
               </c:choose>
             <!--  페이징 -->
              <c:if test="${fn:length(nlist) gt 0 }">
              <div class="rowPagin">
				<div class="col-sm-12">
					<div class="pagination font-alt pn">
               <c:if test="${pag.prev}">
                    <a href="javascript:page(${pag.getStartPage()-1});">
                    <i class="fa fa-angle-double-left"></i></a>
                  </c:if>
               <c:if test="${pag.pre }">
               		<a href="javascript:page(${pag.getPageNo()-1 });">
               		<i class="fa fa-angle-left"></i></a>
               </c:if>  
               	<c:forEach begin="${pag.startPage }" end="${pag.endPage }" var="n">
               	<a href="javascript:page(${n});" class="active">${n }</a>
               	</c:forEach>
               	 <c:if test="${pag.nex }">
               		<a href="javascript:page(${pag.getPageNo()+1 });">
               		<i class="fa fa-angle-right"></i></a>
               </c:if>  
               	<c:if test="${pag.next}">
                    <a href="javascript:page(${pag.getEndPage()+1});">
                    <i class="fa fa-angle-double-right"></i></a>
                  </c:if>
               </div>
             </div>
          </div>
          </c:if>
               
             <!--  페이징 -->
              
      
               
            </div>
              
          </div>
       </div>
        <!--   검색창  -->

                
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