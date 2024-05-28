<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#regbtn").click(()=>{
			location.href="${ctx}/register.do"
		})
	});
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="panel panel-default">
			<div class="panel-heading  ">
				<div class="vertical-alignment row">
					 <div class="col-sm-8" ><h2 >&nbsp;&nbsp;&nbsp;&nbsp;게시물 목록</h2></div>
					<div class="col-sm-4 align-self-center">
						<br>
						<br>
						<button id="regbtn" type="button"
							class="btn btn-sm btn-primary pull-right">게시물 쓰기</button>
					</div>
				</div>
			</div>
			<div class="panel-body">
				<div class="table-responsive">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>조회수</th>
								<th>작성자</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="vo" items="${list }">
								<tr>
									<td>${vo.idx }</td>
									<td><a href="${ctx }/getContents.do?idx=${vo.idx }">${vo.title }</a></td>
									<td>${vo.count }</td>
									<td>${vo.writer }</td>
									<td>${vo.indate.substring(0,10) }</td>
									<%-- <td><fmt:formatDate value="${vo.indate}" pattern="yyyy-MM-dd" /> </td> --%>
								</tr>

							</c:forEach>
						</tbody>

					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>