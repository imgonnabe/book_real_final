<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous"></script>
<style type="text/css">
.toggle {
	width: 100%;
	height: 50px;
	margin: 0 auto;
	display: table;
}

/*switch styles*/
div.btn-container {
	display: table-cell;
	vertical-align: middle;
	text-align: center;
}

label {
	font-size: 13px;
	color: #424242;
	font-weight: 500;
}

.toggle-switch {
	display: inline-block;
	margin: 0px;
	position: relative;
}

.toggle-switch-inner {
	margin: 0px;
	width: 140px;
	height: 30px;
	background: #E0E0E0;
	border-radius: 26px;
	overflow: hidden;
	position: relative;
	transition: all 0.3s ease;
	display: block;
}

.toggle-switch-inner:before {
	content: attr(data-on);
	position: absolute;
	font-size: 12px;
	font-weight: 500;
	top: 7px;
	right: 20px;
}

.toggle-switch-inner:after {
	content: attr(data-off);
	width: 70px;
	height: 26px;
	background: #fff;
	border-radius: 26px;
	position: absolute;
	left: 2px;
	top: 2px;
	text-align: center;
	transition: all 0.3s ease;
	box-shadow: 0px 0px 6px -2px #111;
	padding: 5px 0px;
}

.toggle-switch input[type="checkbox"] {
	width: 50px;
	height: 25px;
	opacity: 0;
	position: absolute;
	top: 0;
	z-index: 1;
	margin: 0px;
}

.toggle-switch input[type="checkbox"]:checked+.toggle-switch-inner:after
	{
	content: attr(data-on);
	left: 68px;
}

.toggle-switch input[type="checkbox"]:checked+.toggle-switch-inner:before
	{
	content: attr(data-off);
	right: auto;
	left: 20px;
}

hr {
  padding: 0;
  border: none;
  border-top: medium double #8c8c8c;
  color: #8c8c8c;
  text-align: center;
}

hr:after {
  content: "§";
  display: inline-block;
  position: relative;
  top: -0.7em;
  font-size: 1.5em;
  padding: 0 0.25em;
  background: #fff;
}

.delay{
	background-color: #E2E2E2;
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
			<div class="toggle">
				<div class="btn-container">
					<label class="switch toggle-switch"> <input type="checkbox"
						name="color_mode" id="color_mode" value="1"> <label
						for="color_mode" data-on="추천" data-off="알림"
						class="toggle-switch-inner"></label>
					</label>
				</div>
			</div>
			<!-- 알림이 표시될 영역 -->
			<div class="main">
			  <div class="alarm container">
			    <div class="row" id="notification-area">
			    <div class="col-sm-7 col-sm-offset-3">
			        <div class="menu" id="menu">
			        <c:set var="currentDate" value="<%= new java.util.Date() %>" />
                            <c:set var="dateFormat" value="yyyy-MM-dd" />
                            <c:set var="formattedDate">
                                <fmt:formatDate pattern="${dateFormat}" value="${currentDate}" />
                            </c:set>
			          <c:forEach items="${rlist}" var="row">
			            <c:if test="${row.rddate ne null}">
			              <div class="row" onclick="location.href='./rent'">
			                <div class="delay alarm-row menu-title font-alt col-sm-10">'${row.bkname}'이 연체되었습니다.<br> 
			                  반납일은 ${row.rddate}입니다.<hr></div>
			              </div>
			            </c:if>
			          </c:forEach>
			          <c:forEach items="${rlist}" var="row">
			            <c:if test="${row.rsdate ne null && row.rsdate le formattedDate}">
			              <div class="row date-element" data-date="${row.rsdate}" onclick="location.href='./rent'">
			                <div class="alarm-row menu-title font-alt col-sm-10">${row.rsdate}<br>
			                  '${row.bkname}'을 대여했습니다.<hr></div>
			              </div>
			            </c:if>
			          </c:forEach>
			          <c:forEach items="${rlist}" var="row">
			            <c:if test="${row.rsdate ne null && row.rsdate gt formattedDate}">
			              <div class="row date-element" data-date="${row.rsdate}" onclick="location.href='./rent'">
			                <div class="alarm-row menu-title font-alt col-sm-10">${row.rsdate}에
			                  '${row.bkname}'을 예약했습니다.<hr></div>
			              </div>
			            </c:if>
			          </c:forEach>
			          <c:forEach items="${rlist}" var="row">
			            <c:if test="${row.rddate_return ne null}">
			              <div class="row date-element" data-date="${row.rddate_return}" onclick="location.href='./rent'">
			                <div class="alarm-row menu-title font-alt col-sm-10">${row.rddate_return}<br>
			                  '${row.bkname}'을 반납했습니다.<hr></div>
			              </div>
			            </c:if>
			          </c:forEach>
			          <c:forEach items="${tlist}" var="row">
			           <c:if test="${row.total != previousTotal}">
			            <div class="row date-element" data-date="${row.tdate}" onclick="location.href='./buy'">
			              <div class="alarm-row menu-title font-alt col-sm-10">${row.tdate}&nbsp;(${row.tgroup })<br>
			                <fmt:formatNumber value="${row.total}" pattern="#,###"/>원 결제완료<hr></div>
			            </div>
			          </c:if>
			          <c:set var="previousTotal" value="${row.total}" />
			          </c:forEach>
			        </div>
			    </div>
			    </div> 
			  </div>
			</div>

				<!-- 추천 -->
				<div class="container recommend">
					<div class="row">
						<div class="col-sm-6 col-sm-offset-3">
							<div class="module-title font-alt">구매했던 책 카테고리 추천</div>
						</div>
					</div>
					<div class="row">
						<div class="owl-carousel text-center" data-items="5"
							data-pagination="false" data-navigation="false">
							<c:forEach items="${list }" var="row">
								<div class="owl-item">
									<div class="col-sm-12">
										<div class="ex-product">
											<a href="../bookdetail?bkno=${row.bkno}"><img
												src="/img/bookimg/${row.bkimg}" alt="Leather belt" /></a>
											<h4 class="shop-item-title font-alt">
												<a href="../bookdetail?bkno=${row.bkno}">${row.bkname}</a>
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
				
				<div class="scroll-up"><a href="#totop"><i class="fa fa-chevron-up"></i></a></div>
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
		$(document).ready(function() {
			$(".recommend").hide();
			$(".scroll-up").show();

			$(document).on("change", "#color_mode", function() {
				colorModePreview(this);
			})
		});

		function colorModePreview(event) {
			if ($(event).prop("checked") == true) {
				$(".recommend").show();
				$(".alarm").hide();
			} else if ($(event).prop("checked") == false) {
				$(".recommend").hide();
				$(".alarm").show();
			}
		}
		
		// SSE 연결 및 알림 표시 로직
		const eventSource = new EventSource('/notifications/main');
		const eventSource2 = new EventSource('/mypage/main/sse');

		eventSource.onmessage = function(event) {
			const notification = event.data;
			// 알림을 notification-area에 추가하는 코드 작성
			const notificationArea = document
					.getElementById('notification-area');
			const notificationElement = document.createElement('p');
			notificationElement.textContent = notification;
			notificationElement.classList.add('menu-title');
			notificationArea.appendChild(notificationElement);
		};
	
	  // 날짜를 추출하여 비교하기 위한 함수
	  function extractDate(dateString) {
	    const parts = dateString.split('-');
	    if (parts.length === 3) {
	      const year = parseInt(parts[0]);
	      const month = parseInt(parts[1]);
	      const day = parseInt(parts[2]);
	      return new Date(year, month - 1, day); // js에서 월은 0부터 시작하므로 -1을 해준다.
	    }
	    return null;
	  }
	
	  // 최근 날짜로 정렬하는 함수
	  function sortByRecentDate() {
	    const dateElements = document.querySelectorAll('.date-element');
	    const dateArray = Array.from(dateElements);// 배열로 변환
	
	    dateArray.sort(function(a, b) {
	      const dateA = extractDate(a.getAttribute('data-date'));
	      const dateB = extractDate(b.getAttribute('data-date'));
	      if (dateA && dateB) {
	        return dateB - dateA; // 최근 날짜순으로 정렬
	      }
	      return 0;
	    });
	
	    const menu = document.getElementById('menu');
	    dateArray.forEach(function(element) {
	      menu.appendChild(element);
	    });
	  }
	
	  // 페이지 로드 시 최근 날짜로 정렬
	  window.addEventListener('load', sortByRecentDate);
	</script>
	
</body>
</html>