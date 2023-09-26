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
<link href="../css/booklist.css" rel="stylesheet">
<script type="text/javascript">
 

	
</script>
<!-- --------------------------------------------------- 상단 ---------------------------------------------------------------- -->
</head>
<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">
	<%@ include file="../menu.jsp"%>
	<div style="margin-top: 100px;"></div>
	<main>
      <div class="main">
          <div class="container">

          </div>
        <div class="container">
			<div class="row">
		        <div class="col-sm-6 col-sm-offset-3">
		      		<h1 class="module-title font-alt">책추가</h1>
		        </div>
		    </div>
		</div>
        <section class="module-small">
        <hr class="divider-w">
          <div class="container">
                    <div class="comment-form mt-30">
                      <h4 class="comment-form-title font-alt">책 추가</h4>
                      <form action="./bookWrite" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
                        <div class="row">
                          <div class="col-sm-4">
                            <div class="form-group">
                               도서명
                              <label class="sr-only" for="name">도서명</label>
                              <input class="form-control" id="name" type="text" name="name" placeholder="도서명"/>
                            </div>
                          </div>
                          <div class="col-sm-4">
                            <div class="form-group">
                                저자
                              <label class="sr-only" for="write">저자</label>
                              <input class="form-control" id="write" type="text" name="write" placeholder="저자"/>
                            </div>
                          </div>
                          <div class="col-sm-4">
                            <div class="form-group">
                                 가격
                               <input class="form-control" id=price type="number" name="price" placeholder="가격"/>
                            </div>
                          </div>
                          <div class="col-sm-4">
                            <div class="form-group">
                                 출판사
                               <input class="form-control" id=bkpublisher type="text" name="bkpublisher"  placeholder="출판사"/>
                            </div>
                          </div>
                          <div class="col-sm-4">
                            <div class="form-group">
                                 구매재고
                               <input class="form-control" id=bstock type="number" name="bstock"  placeholder="재고"/>
                            </div>
                          </div>
                          <div class="col-sm-4">
                            <div class="form-group">
                                 대여가능여부
                               <select class="form-control" name="rdel" id="rdel">
					             <option selected="selected" value="0">대여가능</option>
					             <option value="1">대여불가</option>
				                </select>
                            </div>
                          </div>
                          <div class="col-sm-4">
                            <div class="form-group">
                                 카테고리
                               <select class="form-control" name="cate" id="cate">
					             <option selected="selected" value="0">장르선택</option>
					             <option value="1">소설</option>
								<option value="2">시/에세이</option>
								<option value="3">자기계발</option>
								<option value="4">컴퓨터/IT</option>
								<option value="5">생활(요리/건강)</option>
				                </select>
                            </div>
                          </div>
                          
                          <div class="col-sm-5">
                            <div class="form-group">
                              간략정보
                              <textarea class="form-control" id="scontent" name="scontent" rows="4" placeholder="정보"></textarea>
                            </div>
                          </div>
                          <div class="col-sm-3">
                            <div style="margin-top: 30px;" class="form-group">
                            <input type="file" name="upFile">
                            </div>
                          </div>
                          <div class="col-sm-12">
                            <div class="form-group">
                              상세정보
                              <textarea class="form-control" id="content" name="content" rows="4" placeholder="정보"></textarea>
                            </div>
                          </div>
                          <div class="col-sm-12">
                            <button class="btn btn-round btn-d" type="submit">추가하기</button>
                          </div>
                        </div>
                      </form>
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
	
		function validateForm() {
			var name = $('#name').val().trim();
            var write = $('#write').val().trim();
            var price = $('#price').val().trim();
            var bkpublisher = $('#bkpublisher').val().trim();
            var bstock = $('#bstock').val().trim();
            var rdel = $('#rdel').val().trim();
            var cate = $('#cate').val().trim();
            var scontent = $('#scontent').val().trim();
            var content = $('#content').val().trim();
			// 전부 입력 안됐을 때
	          if(name === '' || write === '' || price === '' || bkpublisher === '' ||
	        		  bstock === '' || rdel === '' || cate === '' || scontent === '' || content === ''){
	        	  alert('책정보를 전부 입력해주세요.');
	        	  return false;
	          }
			return true;
		}
	
	</script>
  </body>
</html>