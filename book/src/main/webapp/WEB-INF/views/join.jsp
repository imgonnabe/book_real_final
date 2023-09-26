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
    <title>우리동네 | 동네북 | 회원가입</title>
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
    <link rel="stylesheet" href="./css/join.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<script src="./js/jquery-3.7.0.min.js"></script>
	<script type="text/javascript">
	
	   $(function() {
		   
	      let isIdChecked = false; // 아이디 중복 검사 여부를 나타내는 변수
	      $("#idCheck").click(function() {
	               let mid = $("#mid").val();
	
	               if (mid == "" || mid.length < 3) {
	                  $("#resultMSG").text("아이디는 3글자 이상이어야 합니다.");
	                  $("#resultMSG").css("font-weight", "bold");
	                  $("#resultMSG").css("font-size", "15pt");
	               } else {
	                  $.ajax({
	                     url : "./checkID",
	                     type : "post",
	                     data : {
	                        "mid" : mid
	                     },
	                     dataType : "json",
	                     success : function(data) {
	                        if (data == 1) {
	                           $("#resultMSG").css("color", "red").text("이미 등록된 아이디입니다.");
	                           isIdChecked = false;
	                        } else {
	                           $("#resultMSG").css("color", "green").text("가입할 수 있습니다.");
	                           isIdChecked = true;
	                        }
	                     },
	                     error : function(request, status, error) {
	                        $("#resultMSG").text("실패시 결과값 : " + error);
	                     }
	                  });
	               }
	               return false;
	            });
	
	      $("#pw2").on('input', function() {
	         let pw1 = $("#pw1").val();
	         let pw2 = $(this).val();
	
	         if (pw1 == pw2) {
	            $("#pwresultForm").css("color","green").text("비밀번호가 일치합니다.");
	            return;
	         } else {
	            $("#pwresultForm").css("color","red").text("비밀번호가 일치하지 않습니다.");
	         }
	      });
	      
	      $("#joinjoin").click(function(){
	         let mid = $("#mid").val();
	         let pw1 = $("#pw1").val();
	         let pw2 = $("#pw2").val();
	         let mname = $("#mname").val();
	         let mphone = $("#mphone").val();
	         let mbrith = $("#mbrith").val();
	         
	          if (!isIdChecked) {
	             Swal.fire("아이디 중복 검사를 실행하세요.");
	              return false; // 회원가입 종료
	           }
	         if (pw1 != pw2) {
	            Swal.fire("비밀번호를 확인하세요.");
	            return false;
	         }
	         if (mname.length > 4 || mname.length == "" || mname.length <= 1) {
	            Swal.fire("이름을 정확히 입력해주세요.");
	            return false;
	         }
	         if (mphone.length != 11) {
	            Swal.fire("핸드폰 번호 11자리를 정확히 입력해주세요.");
	            return false;
	         }
	       if (mbirth.length < 10 ) {
	            Swal.fire("생년월일을 정확히 입력해주세요.");
	            return false; 
	         
	       
	       
	       }
	       
	       
	       // 메일주소검사
	     	let option = $("#selectBox option:selected").val();      // 선택한 메일주소값 뽑아내기
	     	
	     	if(option != "-선택-"){
	     		
		     // gogus228
				let Fmail = $(this).parent('div').siblings(".emailBox").children("#memail").val();
				//alert(Fmail);   
				
				if(Fmail != null && Fmail != ""){
					// hanmail   net
					let items = option.slice(1).split(".");	
					let first = items[0];	// hanmail
					let second = items[1];	// net
					
					// 메일주소 앞부분 입력값검사
					let replaceKorean = /[ㄱ-ㅎㅏ-ㅣ]/gi;
					let replaceChar = /[~!@\#$%^&*\()\-=+_'\;<>\/.\`:\"\\,\[\]?|{}]/gi;
				
					if(Fmail.match(replaceKorean) || Fmail.match(replaceChar)){
						Fmail = Fmail.replace(replaceKorean, "").replace(replaceChar, "");
						Swal.fire("올바른 메일주소를 입력해주세요")
						$("#memail").val("");
						$("#Opt").prop("selected", true);
						return false; 
					}
					
					let Final = Fmail + "@" + first + "." + second;
					console.log(Final);	// gogus228@gmail.com
					let memail = $("#memailF").val(Final);
					Swal.fire({
						   title: '10% 웰컴 할인쿠폰을 받으시겠습니까??',
						   text: '다시 되돌릴 수 없습니다. 신중하세요.',
						   icon: 'success',
						   
						   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
						   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
						   cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
						   confirmButtonText: '받기', // confirm 버튼 텍스트 지정
						   cancelButtonText: '취소', // cancel 버튼 텍스트 지정
						   
						   reverseButtons: true, // 버튼 순서 거꾸로
						   
						}).then(result => {
						   // 만약 Promise리턴을 받으면,
						   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
						   
						      Swal.fire('10%쿠폰 획득하였습니다.','success');
						  
						   }
						   document.getElementById("myForm").submit();
						});
					//alert("memail: " + memail.val());
					
				} else {
					Swal.fire("올바른 메일주소를 입력해주세요");
					return false; 
				} 
			
	     	} else {
				Swal.fire("올바른 메일주소를 입력해주세요");
				return false; 
	     }	
		
	  	});
	       
	 });
	      
	      
	   
	</script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
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
  <%@ include file="menu.jsp"%>
    <main>
   <div class="main">
   <form id="myForm" action="./join" method="post">
      <div class="join-div" align="center">
         <div>
            <h1>회원가입<br></h1>
         </div>
         <div>
            <div class="idBox">
               <input class="input" type="text" name="mid" id="mid" placeholder="아이디를 3글자 이상 입력해 주세요"/>
               <button id="idCheck" type="button" class="idbutton">중복검사</button>
               <br> <span id="resultMSG"></span>
            </div>
            <div class="label-row" style="height:20px" id="resultForm">
               <div class="label-name"></div>
               <div class="label-in">
                  <span id="resultMSG"></span>
               </div>
            </div>
         </div>
         <div>
            <div class="pwBox1">
               <input class="input" type="password" name="mpw1" id="pw1" placeholder="비밀번호를 입력해 주세요"/><br><br>
            </div>
            <div>
               <div class="poBox2">
                  <input class="input" type="password" name="mpw" id="pw2" placeholder="비밀번호를 다시 입력해 주세요"/>
                  <br>
                  <div class="label-row" style="height: 25px" id="pwresultForm">
                     <div class="label-name"></div>
                     <div class="label-in">
                        <span id="pwresultMSG"></span><br>
                     </div>
                  </div>
               </div>
               </div>
         </div>
               <div>
                  <div class="nameBox">
                     <input class="input" type="text" name="mname" id="mname" placeholder="이름을 입력해 주세요"/><br><br>
                  </div>
               </div>
               <div>
                  <div class="addrBox">
                     <input class="input" type="text" name="maddr" id="maddr" placeholder="주소를 입력해 주세요"/><br><br>
                  </div>
               </div>
               <div>
                  <div class="addrBox1">
                     <input class="input" type="text" name="maddr" id="maddr1" placeholder="상세주소를 입력해 주세요"/><br><br>
                  </div>
               </div>
               <div>
                  <div class="birthBox">
                     <input class="input"  type="date" name="mbirth" id="mbirth"/><br><br>
                  </div>
               </div>
               <div>
                  <div class="phoneBox">
                     <input class="input" type="text" name="mphone" id="mphone" placeholder="전화번호를 입력해 주세요"/><br><br>
                  </div>
               </div>
               <div class="emailBox">
					<input class="input" type="text" id="memail" placeholder="이메일을 입력해 주세요" /><br> <br> 
					<select class="selectMail" id="selectBox" name="selectBox">
						<option id="Opt">-선택-</option>
						<option id="naver" value="@naver.com">@naver.com</option>
						<option id="gmail" value="@gmail.com">@gmail.com</option>
						<option id="hanmail" value="@hanmail.net">@hanmail.net</option>
						<option id="kakao" value="@kakao.com">@kakao.com</option>
					</select>
					<input type="hidden" name="memail" id="memailF"/>
				</div>
               	<div>
	               <br>
	               <button class="Jbutton" type="reset">취소</button>
	               <button class="Jbutton" type="button" id="joinjoin">가입</button>
               	</div>

      </div>
   </form>

                
                
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