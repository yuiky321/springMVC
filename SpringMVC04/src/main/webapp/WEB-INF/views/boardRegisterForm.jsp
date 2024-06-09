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
			location.href="${ctx}/boardRegisterForm.do"
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
			<div class="panel-heading">

				<h3>게시물 작성하기</h3>

			</div>
			<div class="panel-body">
				<form action="${ctx }/register.do" method="post">
					<div class="form-group">
						<label for="title">제목</label> 
						<input type="text"
							class="form-control" id="title" name="title">
					</div>
					<div class="form-group">
						<label for="contents">내용</label> 
						<textarea cols="30" rows="10"
							class="form-control" id="contents" name="contents"></textarea>
					</div>
					
					<div class="form-group">
						<label for="writer">작성자</label> 
						<input type="text"
							class="form-control" id="writer" name="writer">
					</div>
					
					<button type="submit" class="btn btn-default">등록</button>
					<button type="reset" class="btn btn-default">취소</button>
					<button type="button" onclick="location.href='${ctx}/list.do'"class="btn btn-default">목록으로</button>
	
				</form>
			</div>
		</div>
	</div>
</body>
</html>