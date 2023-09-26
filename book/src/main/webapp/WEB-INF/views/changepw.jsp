<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
 <meta http-equiv="X-UA-Compatible">
 <meta name="viewport" content="width=device-width, initial-scale=1">
<title>우리동네 | 동네북 | 비밀번호수정</title> 
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
 	<link href="assets/css/style.css" rel="stylesheet">
    <link id="color-scheme" href="assets/css/colors/default.css" rel="stylesheet">
	<script src="./js//jquery-3.7.0.min.js"></script>
	<style type="text/css">
		body {
			margin: 0;
			padding: 0
		}
		
		.changeBox {
			margin-top: 100px;
		}
		
		input {
			background-color: white;
			border-radius: 5px;
			width: 300px;
			height: 30px;
			padding-left: 10px;
			margin: 10px;
			outline: none;
		}
		
		span {
			margin: 8px;
			color: tomato;
		}
		
		button {
			background-color: black;
			color: white;
			border: none;
		    border-radius: 5px;
		    padding: 10px 20px; 
		    font-size: 13px;
		    cursor: pointer;
			width: 80px;
			margin-top: 10px;
			text-align: center;
		}

	
	</style>
<script type="text/javascript">

	$(function() {
		
		let check = false;
		let ischeck;
		
		$(".again").hide();
		$(".longer").hide();

		
		$("#editbtn").click(function() {
			let mpw = $("#mpw").val();
			let mpw2 = $("#mpw2").val();
			let mid = $("#mid").val();

			if (mpw != null && mpw2 != null) {
			
				$(".again").hide();
				$(".longer").hide();
				
				if (mpw != mpw2) {
					alert("비밀번호를 다시 입력해 주세요");
					$(".again").show();
					return false;
				}
				$(".again").hide();
				
				if (mpw.length < 4) {
					alert("비밀번호를 다시 입력해 주세요");
					$(".longer").show();
					return false;
				}
				
				$.ajax({
					url : "./editpw",
					type : "post",
					data : {
						"mid" : mid,
						"mpw" : mpw
					},
					dataType : "json",
					success : function(data) {
						if (data.result == 1) {
							alert("비밀번호가 변경되었습니다.");
							window.opener.location.href = "/login";
							window.close();
						}
					},
					error : function(error) {

					}
				});

			} else {
				alert('수정할 비밀번호를 입력하세요');
			}

		});
		
		
		$("#reset").click(function() {
			window.opener.location.href = "/login";
			window.close();
		});
		

	});
</script>

</head>
<body>
	
	 <div class="changeBox" align="center">
		<div class = "pwBox1">
			<input type="password" name="mpw" id="mpw" placeholder="비밀번호 입력"/>
		</div>
		<div class = "pwBox2">
			<input type="password" name="mpw2" id="mpw2" placeholder="비밀번호 확인"/>
		</div>
			<input type="hidden" value="${mid}" name="mid" id="mid"/>
		<div class="check">
			<span class="again">비밀번호가 일치하지 않습니다.</span>
			<span class="longer">4글자 이상 입력해주세요.</span>
		</div>
		<div class = "btnbox">
			<button type="submit" id="editbtn">변경</button>
			<button type="button" id="reset">취소</button>
		</div>
	</div>


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