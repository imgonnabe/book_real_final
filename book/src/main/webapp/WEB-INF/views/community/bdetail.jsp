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
<title>내용</title>
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
    	margin-left: 30px;
    }
	.post-thumbnail{
		text-align: center;
	}
	.con{
		
		padding: 60px;
		}
	.head{
		margin : 6px;
		border-bottom : solid 1px;
		
		
	}
	.title{
	float:left; width: 65%
	}
	.name{
		 left: 100px; width:35%
	}
	.post-entry{
		margin: 5px; 
		border-bottom: solid 1px;
		min-height: 300px;
		
	}
	
	.comment1{
		margin : 5px;
		height : 80px;
	}
	textarea{
		width: 80%;
	}
	.commentBody{
		margin : 5px;
		min-height: 30px;
	}
	.post-meta{
	     font-size: 15px;
	}
	.comment-avatar{
	  margin-left: -70px;
	  width: 70px;
	}
</style>
<script src="../js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
function del() {
	let chk = confirm("삭제하시겠습니까?"); //참  거짓으로 나옵니다.

	if(chk) {
		location.href ="/community/bdelete?board=${bdetail.bcate}&bno=${bdetail.bno }";
	}
}
function edit(){
	let chk2 = confirm("수정하시겠습니까?");
	
	if(chk2){
		location.href="/community/edit?board=${bdetail.bcate}&bno=${bdetail.bno }"
	}
}

function commentN(){
		alert("댓글을 작성하려면 로그인이 필요합니다");
		let chk3 = confirm("로그인하시겠습니까?");
		
		if(chk3){
			location.href="../login"
		}	
	
	
}
</script>
<script type="text/javascript">
$(function(){
	$(".cdel").click(function(){
		if(confirm("댓글을 삭제하시겠습니까?")){
			let cno = $(this).parent().siblings(".cno").text();
			let comments=$(this).parent().parents(".comment-content");
			
			$.ajax({
				url:"./cdelR",
				type:"post",
				data:{bno:${bdetail.bno}, cno:cno},
				dataType: "json",
				success:function(data){
					if(data.result==1){
						comments.remove();
					}else{
						alert("통신에 문제가 발생했습니다.")
					}
				},
				error:function(error){
					alert("에러가 발생했습니다.");

				}
			});
			
		}
	});	
	$(".cedit").click(function(){
		if(confirm("댓글을 수정하시겠습니까?")){
		 //alert("수정하기");
		let cno = $(this).parent().siblings(".cno").text();
		let comment =$(this).parent().siblings(".comment-body").text();
		
		
		let recommentB='<div class="recommentB">';
		recommentB += '<form action="./cedit" method="post">';
		recommentB += '<textarea id="rcta" name="recomment">'+comment+'</textarea>';
		recommentB += '<input type="hidden" id="bno" name="bno" value="${bdetail.bno}">';
		recommentB += '<input type="hidden" id="cno" name="cno" value="'+cno+'">';
		recommentB += '<input type="hidden" id="board" name="board" value="${param.board}">';
		recommentB += '<button type="submit" id="recomment">댓글수정하기</button>';
		recommentB += '</form>';
		recommentB += '</div>';
		
		let commentDIV = $(this).parents(".comment-content");
		commentDIV.after(recommentB);
		commentDIV.remove();
		}
	});
	
});
</script>
</head>

 <!-- --------------------------------------------------- 상단 ---------------------------------------------------------------- -->   
  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
  <%@ include file="../menu.jsp"%>
    <main>
      <div class="main">
        <hr class="divider-w">
        
        <section class="module-small">
          <div class="container">

          </div>
        </section>
       <hr class="divider-w">
          <div class="container con" style="width: 100%; margin-bottom: 50px; margin-top:50px;">
			<div class="col-sm-1 col-md-1 sidebar " style= "margin-top:400px; margin-left: -45px;">
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
             
             <div class="col-sm-8 col-sm-offset-1">
          	      <div class="post">
                  <div class="post-thumbnail">
                 <c:choose>
                 <c:when test="${param.board eq 1 }"><img src="../board/자유게시판.jpg" style="width: 600px;  height : 300px" class="rounded"></c:when>
            	 <c:when test="${param.board eq 2 }"><img src="../board/독후감.jpg" style="width: 300px;  height : 300px" class="rounded"></c:when>
            	 <c:when test="${param.board eq 3 }"><img src="../board/모임.jpg" style="width: 600px;  height : 300px" class="rounded"></c:when>
            	 <c:when test="${param.board eq 4 }"><img src="../board/도서 소식.jpg" style="width: 600px;  height : 300px" class="rounded"></c:when>
            	 </c:choose></div>
                  <div class="post-header">
                    <h1 class="post-title">${bdetail.btitle}</h1>	
                    <div class="post-meta">By&nbsp;<b>${bdetail.mid }</b>| ${bdetail.bdate } | Comments : ${bdetail.commentcount}  | <a href="board?board=${bdetail.bcate}">${bdetail.stitle} </a>|&nbsp;<a href="#"></a>
						<c:if test="${sessionScope.mid eq bdetail.mid}">
						<button onclick="edit()">수정하기</button>
						</c:if>
						<c:if test="${sessionScope.mid eq bdetail.mid || sessionScope.mgrade eq 2}">
						<button onclick="del()">삭제하기</button>
						</c:if></div>
                    </div>
                  
                  <div class="post-entry">
                   	${bdetail.bcontent }
                  </div>
                </div>
			 <!-- 댓글 창  -->
		<div class="comments">
			<c:choose>
			<c:when test="${fn:length(commentsList) gt 0 }">
			<h4 class="comment-title"> ${bdetail.commentcount}개 댓글이 있습니다</h4>
			<div class="comment clearfix">
			<c:forEach items="${commentsList }" var="c" >
				<div class ="comment-content clearfix">
			    <div class="comment-avatar">
					<img src="../img/grade/grade1.png" alt="avatar" />
				</div>
				<div class="comment-author"><b>${c.mid}</b></div>
				<div class="comment-body"> ${c.comment } </div>
				<div class="cno" style="display: none;">${c.cno}</div>
				<div class="comment-meta"><fmt:formatDate pattern="yyyy-MM-dd" value="${c.cdate }"/>
				<c:if test="${sessionScope.mid eq c.mid}"><button class="cedit">수정하기</button></c:if>
				<c:if test="${sessionScope.mid eq c.mid || sessionScope.mgrade eq 2}">
					<button class="cdel">삭제하기</button></c:if>
				</div>
				</div>
			</c:forEach>
			</div>
			</c:when>
			<c:otherwise>
			<h4 class="comment-title">댓글이 없습니다</h4>	
			</c:otherwise>
			</c:choose>
		</div>
       <!-- 댓글 창  -->
       <!-- 댓글 작성 창 -->
       <div class="comment-form">
       <h4 class="comment-form-title">댓글을 작성하세요</h4>
       <c:choose>
			<c:when test="${sessionScope.mid ne null}">
			<div class="comment1">
			<form action="./comment" method="post">
			 <div class="form-group">
				<textarea name="comment" class="form-control" rows="4" placeholder="Comment" ></textarea>
			</div>
				<button class="btn btn-round btn-d" type="submit" id="comment">댓글쓰기</button>
				<input type="hidden" name ="bno" value="${bdetail.bno}">
				<input type="hidden" name ="board" value="${param.board}">
			</form>
			</div>
			</c:when>
			<c:otherwise><button onclick="commentN()" >댓글쓰기</button></c:otherwise>
			</c:choose>
		</div>	
       </div>
    	
    </div>

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