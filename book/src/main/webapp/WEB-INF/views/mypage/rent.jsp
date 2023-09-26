<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %> 
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
<title>우리동네 | 동네북</title>
<!--  
    Favicons
    =============================================
    -->
<link rel="apple-touch-icon" sizes="57x57"
	href="../assets/images/favicons/apple-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60"
	href="../assets/images/favicons/apple-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="../assets/images/favicons/apple-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76"
	href="../assets/images/favicons/apple-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="../assets/images/favicons/apple-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120"
	href="../assets/images/favicons/apple-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144"
	href="../assets/images/favicons/apple-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152"
	href="../assets/images/favicons/apple-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180"
	href="../assets/images/favicons/apple-icon-180x180.png">
<link rel="icon" type="image/png" sizes="192x192"
	href="../assets/images/favicons/android-icon-192x192.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="../assets/images/favicons/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="../assets/images/favicons/favicon-96x96.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="../assets/images/favicons/favicon-16x16.png">
<link rel="manifest" href="/manifest.json">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage"
	content="../assets/images/favicons/ms-icon-144x144.png">
<meta name="theme-color" content="#ffffff">
<!--  
    Stylesheets
    =============================================
    
    -->
<!-- Default stylesheets-->
<link href="../assets/lib/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Template specific stylesheets-->
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Volkhov:400i"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800"
	rel="stylesheet">
<link href="../assets/lib/animate.css/animate.css" rel="stylesheet">
<link
	href="../assets/lib/components-font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="../assets/lib/et-line-font/et-line-font.css"
	rel="stylesheet">
<link href="../assets/lib/flexslider/flexslider.css" rel="stylesheet">
<link href="../assets/lib/owl.carousel/dist/assets/owl.carousel.min.css"
	rel="stylesheet">
<link
	href="../assets/lib/owl.carousel/dist/assets/owl.theme.default.min.css"
	rel="stylesheet">
<link href="../assets/lib/magnific-popup/dist/magnific-popup.css"
	rel="stylesheet">
<link href="../assets/lib/simple-text-rotator/simpletextrotator.css"
	rel="stylesheet">
<!-- Main stylesheet and color file-->
<link href="../assets/css/style.css" rel="stylesheet">
<link id="color-scheme" href="../assets/css/colors/default.css"
	rel="stylesheet">
<style type="text/css">
.gray{
	background-color: #81D8D0;
}

.delay-write{
	font-size: large;
	font-weight: bolder;
}
</style>	
</head>
<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">
	<%@ include file="../menu.jsp"%>
	<div style="margin-top: 100px;"></div>
	<main>
		<div class="page-loader">
			<div class="loader">Loading...</div>
		</div>
		<div class="main">
	<div class="container">
		<div class="row">
			<div class="col-sm-6 col-sm-offset-3">
				<h1 class="module-title font-alt">대여 내역</h1>
			</div>
			
		</div>
		
	</div>
	
	<section class="module-small">
	<div class="module-subtitle font-alt">
		<c:if test="${rentListCnt ne 0}"> 총 대출 건수 : ${rentListCnt }개</c:if>
	</div>
		<div class="container">
		<div class="col-sm-2 mb-sm-20">
			<button class="btn" onclick="location.href='./rent'">전체보기</button>
		</div>
			<form action="./rent" method="get" class="row">
				<div class="col-sm-2 mb-sm-20">
					<select class="form-control" name="cate" id="cate">
						<option selected="selected" value="2">전체보기</option>
						<option value="0">예약</option>
						<option value="1">최근 1개월</option>
						<option value="3">최근 3개월</option>
						<option value="6">최근 6개월</option>
					</select>
				</div>
				<div class="col-sm-2 mb-sm-20">
					<select class="form-control" name="searchN">
						<option selected="selected" value="title">책제목</option>
						<option value="writer">저자</option>
					</select>
				</div>
				<div class="col-sm-4">
				<div class="search-box">
					<input class="form-control" type="text" name="searchV"
						required="required" placeholder="Search..">
					<button class="search-btn" type="submit">
						<i class="fa fa-search"></i>
					</button>
				</div>
				</div>
			</form>
		</div>
	</section>
	<c:choose>
		<c:when test="${rentListCnt eq 0}">
			<section class="module-small">
				<div class="container">
					<h2 style="text-align: center;">대여도서가 없습니다.</h2>
				</div>
			</section>
		</c:when>
		<c:otherwise>
	<div class="container">
		<div class="col-sm-13">
			<div class="menu" style="text-align: center;">
				<div class="row" style="font-size: large;font-weight: bold;">
					<span class="menu-price font-alt col-sm-2">책제목</span>
					<span class="menu-price font-alt col-sm-2">저자</span>
					<span class="menu-price font-alt col-sm-2">대여일</span>
					<span class="menu-price font-alt col-sm-2">반납일</span>
					<span class="menu-price font-alt col-sm-2">반납여부</span>
				</div>
				<hr>
				<c:forEach items="${list }" var="row">
					<div class="row" style="margin-bottom: 5px;">
						<span class="menu-price font-alt col-sm-2">
							<a href="../bookdetail?bkno=${row.bkno}"><img src="/img/bookimg/${row.bkimg }" alt="Blog-post Thumbnail"/></a>${row.bkname}
						</span>
						<span class="menu-price font-alt col-sm-2">${row.bkwrite}</span>
						<span class="menu-price font-alt col-sm-2">${row.rsdate}</span>
						<span class="menu-price font-alt col-sm-2">${row.rddate}</span>
						<span class="menu-price font-alt col-sm-2">
						
						<c:set var="currentDate" value="<%= new java.util.Date() %>" />
						<c:set var="dateFormat" value="yyyy-MM-dd" />
						<c:set var="formattedDate">
						    <fmt:formatDate pattern="${dateFormat}" value="${currentDate}" />
						</c:set>
						
							<c:choose>
								<c:when test="${row.rdel eq 1}">
									<c:choose>
										<c:when test="${row.rddate lt formattedDate}">
											<span class="delay-write widget-posts-title font-alt">연체중</span>
											<span><button class="<c:if test="${row.rddate lt formattedDate && row.rdel eq 1}">gray</c:if> returnBook" type="button" data-rno="${row.rno}">반납</button></span>
										</c:when>
										<c:otherwise>
											<c:if test="${row.rsdate gt formattedDate }">
												<span class="widget-posts-title font-alt">예약중</span>
											</c:if>
											<c:if test="${row.rsdate le formattedDate }">
												<span class="widget-posts-title font-alt">대출중</span>
												<span><button class="returnBook" type="button" data-rno="${row.rno}">반납</button></span>
											</c:if>	
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									<span class="widget-posts-title font-alt">반납완료</span>
								</c:otherwise>
							</c:choose>
						</span>
					</div>
				</c:forEach>
		</div>
	</div>
	<ul class="paging">
				    <c:if test="${paging.prev}">
				        <span><a href='<c:url value="/mypage/rent?page=${paging.startPage-1}"/>'>이전</a></span>
				    </c:if>
				    <c:if test="${paging.endPage gt 1}">
						<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
					        <span><input class="page" type="button" value="${num}"></input></span>
						</c:forEach>
				    </c:if>
				    <c:if test="${paging.next && paging.endPage>0}">
				        <span><a href='<c:url value="/mypage/rent?page=${paging.endPage+1}"/>'>다음</a></span>
				    </c:if>
				</ul>
			</div>
			</c:otherwise>
		</c:choose>
		<div class="scroll-up"><a href="#totop"><i class="fa  fa-chevron-up"></i></a></div>
	</div>
	</main>
	<!--  
    JavaScripts
    =============================================
    -->
	<script src="../assets/lib/jquery/dist/jquery.js"></script>
	<script src="../assets/lib/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="../assets/lib/wow/dist/wow.js"></script>
	<script
		src="../assets/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
	<script src="../assets/lib/isotope/dist/isotope.pkgd.js"></script>
	<script src="../assets/lib/imagesloaded/imagesloaded.pkgd.js"></script>
	<script src="../assets/lib/flexslider/jquery.flexslider.js"></script>
	<script src="../assets/lib/owl.carousel/dist/owl.carousel.min.js"></script>
	<script src="../assets/lib/smoothscroll.js"></script>
	<script
		src="../assets/lib/magnific-popup/dist/jquery.magnific-popup.js"></script>
	<script
		src="../assets/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
	<script src="../assets/js/plugins.js"></script>
	<script src="../assets/js/main.js"></script>
	
<script type="text/javascript">
$(function() {
 	// URL에서 cate 매개변수를 가져와서 기본값으로 설정
    var defaultCate = getParameterByName('cate');
    $('#cate').val(defaultCate);
    
	$('#cate').on('change', function(){
		var cate = $('#cate').val();
		$.ajax({
			url:'./rent',
			type:'get',
			data:{cate:cate},
			success:function(data){
				location.href="./rent?cate=" + cate;
				
			},
			error:function(error){
				alert('에러');
			}
		});
	});
	
	$(document).on('click', '.page', function(){
	    var cate = $('#cate').val();
	    if(cate == null){
			cate = 2;
		}
	    var page = $(this).val();
	    $.ajax({
	        url: './rent',
	        type: 'get',
	        data: { cate: cate, page: page },
	        success: function(data) {
	            location.href = "./rent?cate=" + cate + "&page=" + page;
	        },
	        error: function(error) {
	            alert('에러');
	        }
	    });
	});
	
    function getParameterByName(name, url) {
    	const urlParams = new URL(location.href).searchParams;
    	return urlParams.get(name);
    }
    
    $(document).on('click','.returnBook', function(){
    	var rno = $(this).data('rno');
    	var defaultCate = getParameterByName('cate');
    	var defaultPage = getParameterByName('page');
        $('#cate').val(defaultCate);
    	var cate = $('#cate').val();
	    if(cate == null){
			cate = 2;
		}
	    var page = defaultPage;
	    if(page == null){
	    	page = 1;
	    }
    	$.ajax({
    		url:'./returnBook',
			type:'post',
			data:{rno:rno,cate:cate,page:page},
			success:function(data){
				location.href="./rent?cate=" + cate + "&page=" + page;
			},
			error:function(error){
				alert('에러');
			}
    	});
    });
});
</script>
</body>
</html>