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
<title>우리동네 | 동네북</title>
<!--  
    Favicons
    =============================================
    -->
<link rel="apple-touch-icon" sizes="57x57"
	href="assets/images/favicons/apple-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60"
	href="assets/images/favicons/apple-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="assets/images/favicons/apple-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76"
	href="assets/images/favicons/apple-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="assets/images/favicons/apple-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120"
	href="assets/images/favicons/apple-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144"
	href="assets/images/favicons/apple-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152"
	href="assets/images/favicons/apple-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180"
	href="assets/images/favicons/apple-icon-180x180.png">
<link rel="icon" type="image/png" sizes="192x192"
	href="assets/images/favicons/android-icon-192x192.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="assets/images/favicons/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="assets/images/favicons/favicon-96x96.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="assets/images/favicons/favicon-16x16.png">
<link rel="manifest" href="assets/images/favicons/manifest.json">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage"
	content="assets/images/favicons/ms-icon-144x144.png">
<meta name="theme-color" content="#ffffff">
<!--  
    Stylesheets
    =============================================
    -->
<!-- Default stylesheets-->
<link href="assets/lib/bootstrap/dist/css/bootstrap.min.css"
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
<link href="assets/lib/animate.css/animate.css" rel="stylesheet">
<link href="assets/lib/components-font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="assets/lib/et-line-font/et-line-font.css" rel="stylesheet">
<link href="assets/lib/flexslider/flexslider.css" rel="stylesheet">
<link href="assets/lib/owl.carousel/dist/assets/owl.carousel.min.css"
	rel="stylesheet">
<link
	href="assets/lib/owl.carousel/dist/assets/owl.theme.default.min.css"
	rel="stylesheet">
<link href="assets/lib/magnific-popup/dist/magnific-popup.css"
	rel="stylesheet">
<link href="assets/lib/simple-text-rotator/simpletextrotator.css"
	rel="stylesheet">
<!-- Main stylesheet and color file-->
<link href="assets/css/style.css" rel="stylesheet">
<link id="color-scheme" href="assets/css/colors/default.css"
	rel="stylesheet">

<link href="../css/main.css" rel="stylesheet">

<script type="text/javascript">
	
</script>
<style type="text/css">


</style>
<!-- --------------------------------------------------- 상단 ---------------------------------------------------------------- -->

</head>
<body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
	<%@ include file="menu.jsp"%>
	<main>
		<div class="main">
			<section class="module-small" style="margin-bottom: -3%">
			</section>
			<div class="welcome_banner_inner">
				<div class="swiper-container">
					<ul class="swiper-wrapper">
						<li class="swiper-slide" style="margin-left: 13%; width: 90">
							<div class="owl-carousel" data-items="1" data-pagination="false" data-navigation="false">
						<c:forEach items="${bannerlist }" var="row">
							  <div class="owl-item">
							   <span class="banner_title">
								${row.batext }
							   </span> 
									<div class="col-sm-12">
										<img src="../img/banner/${row.baimg }" alt="배너이미지"/>
									</div>
								</div>
							</c:forEach>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<hr class="divider-w">

			
	    <section class="module-small">
          <div class="container" style="width: 100%">
  <!--  ----------- 왼쪽 사이드바 ------------------------------------------------------------------ -->

 <!--  ----------- 중앙 본문 ------------------------------------------------------------------ -->
              <div class="col-sm-12" >
              <div class="container">
					<div class="row">
					   <div class="col-sm-12">
					   <img src="../img/page/ad1.png"  style="width:560px; height: 170px; border-radius:20px;"/>
					   <img src="../img/page/ad2.png"  style="width:560px; height: 170px; border-radius:20px; margin-left: 14px;"/>
					   </div>			   
					</div>
					
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
											<span class="bestnumber">${loop.index + 1}</span> 
											<a href="./bookdetail?bkno=${row.bkno}">
											<img src="/img/bookimg/${row.bkimg}" class="bestimg"/></a>
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
					<div class="row">
						<div class="col-sm-6">
							<h3></h3>
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
												src="/img/bookimg/${row.bkimg}" class="bestimg" /></a>
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
					   <div class="row">
						<div class="col-sm-6">
							<h3></h3>
						</div>
					   </div>
					</div>
					</div>
			<c:if test="${sessionScope.mid ne null }">
				  <div class="row"  style="background-color: #f5faf2; border-radius:20px; margin-top: 5%; min-height: 470px;">
					<div class="row" style="width: 90%; margin-left: 50px;">
					<div class="row">
						<div class="col-sm-10">
							<h3 class="best-title" style="margin-top: 35px;margin-bottom: 35px;">
							안녕하세요 ${sessionScope.mname}님 대여중인 책이 
							<c:choose>
							<c:when test="${rentlist[0].count eq null}">
							없습니다.
							</c:when>
							<c:otherwise>
							있습니다.
							</c:otherwise>
							</c:choose>
							</h3>
						 </div>
						<div class="col-sm-2" style="margin-top: 35px;">
							<a href="/mypage/rent">대여내역 확인하기 ></a>
					    </div>
					</div>
					<div class="row">
					<c:choose>
                       <c:when test="${rentlist[0].count eq null}">
					    <div class="shop-item">
					     <h2 style="text-align: center;">대여 내역이 없습니다.</h2>
					    </div>
					    </c:when>
					    <c:otherwise>
						<c:forEach items="${rentlist }" var="row">
						<div class="shop-item">
								<a href="./bookdetail?bkno=${row.bkno}"><img style="height: 300px;" src="/img/bookimg/${row.bkimg }" /></a>
							<h3 class="shop-item-title font-alt"><a href="./bookdetail?bkno=${row.bkno}">${row.bkname}</a>
							</h3>
							<a href="./booklist?searchN=write&searchV=${row.bkwrite}"><h6>${row.bkwrite}</h6></a>
				    	 </div>
							</c:forEach>
					    </c:otherwise>
					  </c:choose>
						</div>
					</div>
					</div>
					</c:if>
					
                </div>
              
   <!--  ----------- 오른쪽 사이드바 ------------------------------------------------------------------ -->
            </div>
            </div>
          </section>

			<!-- --------------------------------------------------- 하단 풋---------------------------------------------------------------- -->

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
		<div class="scroll-up">
			<a href="#totop"><i class="fa  fa-chevron-up"></i></a>
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
</body>
</html>