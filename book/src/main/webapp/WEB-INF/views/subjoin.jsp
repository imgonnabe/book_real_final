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
    <title>우리동네 | 동네북 | 추가정보입력</title>
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
    <link rel="stylesheet" href="./css/subjoin.css">
	<script src="./js/jquery-3.7.0.min.js"></script>
	<style type="text/css">
	
		.subjoin-div{
			box-sizing : border-box;
			border-radius: 5%;
			margin: 100px auto;
			padding: 20px;
			font-size:15px;
			background-color:#F2F2F2;
			width: 500px;
		}
		
		h1 {
		    font-weight: bold; 
		    font-size: 40px; 
		    color: black;
		}
		
		label{
			margin: 15px 15px 15px -10px;
			padding-right: 10px;
		    text-align: right;
		    vertical-align: middle;
		    width: 15%;
			float: left;
		}
		
		input{
		    background-color:white;
		    border-radius: 5px;
		    width: 70%;
		    height: 50px;
		    padding-left: 10px;
		 	border:none;
		  	outline:none;
		}
		
		#mid, #mname, #maddr, #maddr1, #memail{
			margin: 0 10px 20px 5px;
		}
		
		#autoInfo{
			margin-left: 100px;
			margin-bottom: 35px;
			text-align: center;
		}
		#autoInfo span{
			text-align: center;
			color: tomato;
			font-size: small;
		}
		#joinjoin, #joinCancel{
			float: inherit;
		}
		button{
			background-color: black;
			color: white;
			border: none;
		    border-radius: 5px;
		    padding: 10px 25px; 
		    font-size: 16px;
		    cursor: pointer;
		}
		
	</style>
	
	<script type="text/javascript">
		$(function(){
			
			$("#joinCancel").click(function(){
				window.location.href = "/logout";
			});
			
		});
	</script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
		window.onload = function(){
		    document.getElementById("maddr").addEventListener("click", function(){ //주소입력칸을 클릭하면
		        //카카오 지도 발생
		        new daum.Postcode({
		            oncomplete: function(data) { //선택시 입력값 세팅
		                document.getElementById("maddr").value = data.address; // 주소 넣기
		              /*   document.querySelector("maddr1").focus(); //상세입력 포커싱 */
		            }
		        }).open();
		    });
		}
	</script>

  </head>
  
  <!-- --------------------------------------------------- 상단 ---------------------------------------------------------------- -->   
   <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
    <main>
      <div class="main">
      
       <hr class="divider-w">
        <section class="module-small"></section>
        
        <form action="/login/subjoin" method="post">
		<div class="subjoin-div" align="center">
			<div>
			
				<h1>추가정보입력</h1>
			</div>
			
			<div>
				<label for="mid">아이디</label>
				<div>
					<input type="text" name="mid" id="mid" value="${sessionScope.mid}" disabled/>
				</div>
			</div>
					<label for="mname">이름</label>
					<div>
						<div>
							<c:choose>
           						<c:when test="${sessionScope.mname ne null}">
           							<input type="text" name="mname" id="mname" value="${sessionScope.mname }" readonly/>
           						</c:when>
           						<c:otherwise>
									<input type="text" name="mname" id="mname" placeholder="이름을 입력해 주세요"/>
           						</c:otherwise>
       						</c:choose>
						</div>
					</div>
					<div>
						<label for="memeil">이메일</label>
						<div class="">
							<c:choose>
								<c:when test="${memail ne null}">
									<input type="text" name="memail" id="memail" value="${memail }" readonly/>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${sessionScope.withN ne 2}"><span>네이버 계정이 올바른지 확인필요</span></c:when>
										<c:when test="${sessionScope.withK ne 1}"><span>카카오 계정이 올바른지 확인필요</span></c:when>
										<c:otherwise>
											<input type="text" name="memail" id="memail" value="${memail }" disabled/>
 											<span>올바르지 않은 접근경로</span>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
						</div>
						<div id="autoInfo"><span>연동된 계정의 정보가 자동으로 입력됩니다.</span></div>
					</div>
					<div>
						<div>
							<label for="maddr">* 주소</label>
							<input type="text" name="maddr" id="maddr" placeholder="주소를 입력해 주세요"/>
						</div>
						<div>
							<label for="maddr1"></label>
						    <input type="text" name="maddr" id="maddr1" placeholder="상세주소를 입력해 주세요"/>
						</div>
						<input type="hidden" name="mphone" value="${mphone }"/>
					</div>
		
					<div class="subbtnBox" align="center">
						<button type="button" id="joinCancel">취소</button>
						<button type="submit" id="joinjoin">가입</button>
					</div>

		</div>
	</form>
        
        <section class="module"></section>          
                
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