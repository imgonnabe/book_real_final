<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
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
	 <!-- Google Charts 라이브러리 로드 -->
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<style type="text/css">
.gray{
	background-color: gray;
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
						<h1 class="module-title font-alt">매출액</h1>
					</div>
				</div>
			</div>
			
  			<section class="module-small">
				<div class="container">
					<div class="col-sm-2 mb-sm-20">
						<button class="btn" onclick="location.href='./sales?cate=0'">전체보기</button>
					</div>
				<form action="./main" method="get" class="row">
					<div class="col-sm-2 mb-sm-20">
						<select class="form-control" name="cate" id="cate"
							onclick="cateChange()">
								<option selected="selected" value="0">전체</option>
								<option value="1">소설</option>
								<option value="2">시/에세이</option>
								<option value="3">자기계발</option>
								<option value="4">컴퓨터/IT</option>
								<option value="5">생활(요리/건강)</option>
						</select>
					</div>
				</form>
				</div>
			</section>
  			<c:choose>
				<c:when test="${list[0].count eq null}">
					<section class="module-small">
						<div class="container">
							<h2 style="text-align: center;">매출액이 없습니다.</h2>
						</div>
					</section>
				</c:when>
			<c:otherwise>
			<div class="container">
				<div class="row">
  					<div id="chart_div" style="width:100%; height: 500px;"></div>
  				</div>
  			</div>
  			<div style="margin-top: 10px;"></div>
			<div class="container">
					<div class="col-sm-9 col-sm-offset-2">
						<div style="text-align: center;" class="menu">
							<div class="row" style="font-size: large;font-weight: bold;">
								<span class="menu-title font-alt col-sm-3">카테고리</span>
								<span class="menu-title font-alt col-sm-3">거래날짜</span>
								<span class="menu-title font-alt col-sm-3">매출</span>
							</div><hr>
							<c:forEach items="${list }" var="row">
								<div class="row">
									<span class="menu-detail font-serif col-sm-3">${row.bkcate}</span>
									<span class="menu-title font-alt col-sm-3">${row.ttdate}</span>
									<span class="menu-title font-alt col-sm-3"><fmt:formatNumber value="${row.total}" pattern="#,###"/>원</span>
								</div>
							</c:forEach>
						</div>
					<%-- <ul class="paging">
					    <c:if test="${paging.prev}">
					        <span><a href='<c:url value="/admin/sales?page=${paging.startPage-1}"/>'>이전</a></span>
					    </c:if>
						<c:if test="${paging.endPage gt 1}">
							<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
						        <span><input class="page" type="button" value="${num}"></input></span>
							</c:forEach>
					    </c:if>
					    <c:if test="${paging.next && paging.endPage>0}">
					        <span><a href='<c:url value="/admin/sales?page=${paging.endPage+1}"/>'>다음</a></span>
					    </c:if>
					</ul> --%>
				</div>
			</div>
			</c:otherwise>
		</c:choose>
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
	    
		$(document).on('change', '#cate', function(){
			var cate = $('#cate').val();
			$.ajax({
				url:'./sales',
				type:'get',
				data:{cate:cate},
				success:function(data){
					location.href="./sales?cate=" + cate;
					
				},
				error:function(error){
					alert('에러');
				}
			});
		});
		
		$(document).on('click', '.page', function(){
		    var cate = $('#cate').val();
		    if(cate == null){
 				cate = 0;
 			}
		    var page = $(this).val();
		    $.ajax({
		        url: './sales',
		        type: 'get',
		        data: { cate: cate, page: page },
		        success: function(data) {
		            location.href = "./sales?cate=" + cate + "&page=" + page;
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
	    
	});
	</script>
	
	<script type="text/javascript">
	google.charts.load('current', {packages: ['corechart', 'bar']});
	google.charts.setOnLoadCallback(drawTrendlines);
	
	function drawTrendlines() {
	    // 날짜와 카테고리별 판매 데이터를 저장할 객체 생성
	    var arr = {};
	
	    <c:forEach items="${list}" var="a">
	        var date = '${a.ttdate}';
	        var categoryCode = ${a.bkcate};
	        var total = ${a.total};
	        var category;
			
	     	// 카테고리 코드에 따라 카테고리 이름 설정
            if (categoryCode === 1) {
                category = '소설';
            } else if (categoryCode === 2) {
                category = '시/에세이';
            } else if (categoryCode === 3) {
                category = '자기계발';
            } else if (categoryCode === 4) {
                category = '컴퓨터/IT';
            } else if (categoryCode === 5) {
                category = '생활(요리/건강)';
            }
	        
	        // 객체가 존재하지 않으면 초기화
	        if (!arr[date]) {
	            arr[date] = {};
	        }
	
	        // 카테고리 합계가 없으면 초기화
	        if (!arr[date][category]) {
	            arr[date][category] = 0;
	        }
	
	        // 해당 카테고리 및 날짜에 합계 추가
	        arr[date][category] += total;
	    </c:forEach>
	
	    // 데이터 테이블 생성
	    var data = new google.visualization.DataTable();
	    data.addColumn('string', '날짜'); // 날짜를 나타내기 위해 string 으로 변경
	
	    // 동적으로 각 카테고리에 대한 열을 추가합니다.
	    var categoryList = [];
	
	    for (var date in arr) {
            for (var category in arr[date]) {
                if (!categoryList.includes(category)) {
                    categoryList.push(category);
                    data.addColumn('number', category);
                }
            }
        }
	
	    // 데이터 테이블에 데이터 행을 추가합니다.
	    for (var date in arr) {
	        var rowData = [date];
	
	        for (var i = 0; i < categoryList.length; i++) {
	            var category = categoryList[i];
	            rowData.push(arr[date][category] || 0);
	        }
	
	        data.addRow(rowData);
	    }
	
	    var options = {
	        title: '날짜별 카테고리당 매출액',
	        hAxis: {
	            title: '날짜',
	        },
	        vAxis: {
	            title: '매출액'
	        },
	        legend: { position: 'top' } // 범례를 위쪽에 배치
	    };
	
	    var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
	    chart.draw(data, options);
	}
	</script>

</body>
</html>