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
    <title>우리동네 | 동네북 | 회원정보</title>
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
    <script src="./js//jquery-3.7.0.min.js"></script>
    <style type="text/css">
	    h2 {
	       font-weight: bold; 
	       font-size: 35px; 
	       color: black;
	       margin-bottom: 10px;
	   }
	   
	   .userBox{
	      box-sizing : border-box;
	      margin: 100px auto;
	      padding: 20px;
	      font-size:15px;
	      width: 700px;
	   }
	   
	   input{
	       background-color:white;
	       width: 70%;
	       height: 50px;
	       border: none;
	       border-bottom: 1px solid black;
	       border-radius: 3px;
	       outline:none;
	       margin: 10px;
	   }
	   .noInfo{
		   	opacity: 30%
	   }
	   
	   label{
	       margin: 17px 0px 17px 10px;
	       padding-right: 10px;
	       text-align: left;
	       vertical-align: middle;
	       width: 100px;
	   }
	   
	   button{
	      background-color: black;
	      color: white;
	      border: none;
	      border-radius: 5px;
	      padding: 10px 25px; 
	      font-size: 16px;
	      cursor: pointer;
	      margin-top: 10px;
	      float: left;
	   }
	   .autobtnBox, .editbtnBox{
	      direction: column;
	   }
	   #toInfo{
	   	float: right;
	   	margin: 10px 40px 0px 0px;
	   }
	   
	   #outauto{
	   	float: left;
	   	margin: 30px 30px 0 40px;
	   	border-bottom: 1px gray solid;
	   	color: gray;
	   }
	   
    </style>
    
<script type="text/javascript">

function kakaoLogout(){
	location.href="https://kauth.kakao.com/oauth/logout?client_id=3ecca13d973c6d11e752a114a1e14922&logout_redirect_uri=http://localhost/logout/kakao";
	window.location.href = "/logout";
}

function naverLogout(){
	window.location.href = "https://nid.naver.com/nidlogin.logout";
}

	$(function(){
	
		let sid = getCookie("SuserID");
		let setS = getCookie("setS");
		let setY = getCookie("setY");
		
		// 로그아웃버튼 클릭
		$("#logoutbtn").click(function(){
			Logout();
		});
		
		// 자동로그인 해제버튼 클릭
		$("#outauto").click(function(){
			autoLogout();
		});
		
		// 쿠키 삭제
		function delCookie(cookieName){
			let expireDate = new Date();
			expireDate.setDate(expireDate.getDate() - 1);
			document.cookie = cookieName +"="+ "; expires="+ expireDate.toUTCString()
		}
		
		// 쿠키가져오기
		function getCookie(cookieName){
			let cname, cvalue;
			let val = document.cookie.split(";");
			for(let i = 0; i < val.length; i++){
				cname = val[i].substr(0, val[i].indexOf("="));
				cvalue = val[i].substr(val[i].indexOf("=")+1);
				cname = cname.trim();
				
				if(cname == cookieName){
					return cvalue;
				}
			}
		}
		
		// 로그아웃 진행
		function Logout(){
			
			if(${sessionScope.withN eq 2}){	// 네이버로그아웃 이후 로그아웃실행 
				naverLogout();
			} else if(${sessionScope.withK eq 1}){ // 카카오로그아웃 이후 로그아웃실행 
				kakaoLogout();
			} 
				window.location.href = "/logout";	// 일반로그아웃
			
		}
		
		// 자동로그인 해제 진행
		function autoLogout(){

			// auto가 1이라면 0으로 변경
			$.ajax({
				url : "./autologout",
				type : "post",
				data : {sid : sid},
					dataType : "json",
					success : function(data) {
						if(data.result == 1){
							alert("자동로그인이 해제되었습니다.")
							delCookie("SuserID");
							delCookie("setS");
							Logout();
						}
					},
					error : function(error) {
						alert("자동로그인이 해제된 상태입니다.");
						}
				});
		}
		
		// 회원정보 수정으로 이동
		$("#toInfo").click(function(){
			window.location.href = "/mypage/info";		
		});
		
	});
	
</script>

  </head>
  
   <!-- --------------------------------------------------- 상단 ---------------------------------------------------------------- -->   
  
  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
  <%@ include file="menu.jsp"%>
    <main>
      <div class="main">
		  <section class="module-small"></section>
		  
         <div class="userBox" align="center">
               <h2>회원정보</h2>
            <div class="idBox">
               <label for="mid">아이디</label>
               <input type="text" id="mid" value="${info.mid}" readonly />
            </div>
            <div class="nameBox">
               <label for="mname">이름</label>
               <input type="text" id="mname" value="${info.mname}" readonly />
            </div>
            <div class="addrBox">
               <label for="maddr">주소</label>
               <input type="text" id="maddr" value="${info.maddr}" readonly /><br>
            </div>
            <div class="birthBox">
               <label for="mbirth">생년월일</label>
               <input type="date" id="mbirth" value="${info.mbirth}" readonly /><br>
            </div>
            <div class="phoneBox">
            <c:choose>
               <c:when test="${info.mphone eq null}">
                  <label for="mphone">전화번호 : </label>
                  <input class="noInfo"  type="text" id="mphone" value="정보가 없습니다." readonly />
               </c:when>
               <c:otherwise>
                  <label for="mphone">전화번호</label>
                  <input type="text" id="mphone" value="${info.mphone}" readonly />
               </c:otherwise>
            </c:choose>
            </div>
            <div class="emailBox">
               <label for="memail">이메일주소</label>
               <input type="text" id="memail" value="${info.memail}" readonly />
            </div>
            <div class="btnBox">
            <div class="editbtnBox">
               <button type="button" id="toInfo">회원정보수정</button>
            </div>
            <div class="autobtnBox">
      			<a href="#" id="outauto">자동로그인 해제</a>
      		</div>
            </div>

         </div>
        
          <section class="module-small"></section>      
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