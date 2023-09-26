<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멀티보드</title>
 <script src="./js/jquery-3.7.0.min.js"></script>
</head>
<body>

 <h1>보드</h1>
            <div class="container">
               
               	<c:forEach items="${boardList }" var="l">
               		
               		<button onclick="location.href='${l.surl }'">${l.stitle }</button>
               	</c:forEach>
               <h1>multiboard</h1>
               <c:choose>
               <c:when test="${fn:length(list) gt 0 }">
               <table class="table table-dark table-hover table-striped">
               <thead>
               	<tr class="row">
               		<th class="col-1">번호</th>
               		<th class="col-6">제목</th>
               		<th class="col-2">날짜</th>
               		<th class="col-2">글쓴이</th>
               		<th class="col-1">읽음</th>
               	</tr>
               </thead>
               <tbody><c:forEach items="${list}" var="row">
               <tr class="row detail" onclick="location.href='./bdetail?board=${param.board}&bno=${row.bno}'">
               		<td class="col-1">${row.rowNum}</td>
               		<td class="col-6 title">${row.btitle }<c:if test="${row.commentcount  ne 0}">&nbsp;<span class="badge bg-danger">${row.commentcount  }</span></c:if></td>
               		<td class="col-2">${row.bdate }</td>
               		<td class="col-2">${row.mname }</td>
               		<td class="col-1">${row.bread }</td>
                </tr>
               </c:forEach>
               </tbody>
               </table>
               </c:when>
                <c:otherwise>
               	<h1>게시판에 글이 없습니다.</h1>
               </c:otherwise>
               </c:choose>
               <div>
               	<form action="./search" method="get">
               		<select name="searchN">
               			<option value="title">제목</option>
               			<option value="mname">작성자</option>
               			<option value="content">내용</option>
               		</select>
               		<input type="text" name="searchV" required="required">
               		<input type="hidden" name="cate" value=${param.board }>
               		<button type="submit">검색</button>
               	</form>
               
               </div>
               
               <button type="button" onclick="location.href='./bwrite?board=${param.board}'">글쓰기</button>
               
            </div>
</body>
</html>