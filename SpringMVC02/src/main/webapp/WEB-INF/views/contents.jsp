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
	function modifyForm(){
		alert("클릭")
		$("#title").attr("readonly",false);
		$("#contents").attr("readonly",false);
		if($("#modifyBtn").val()=="수정"){
			$("#modifyBtn").val("저장");
			$("#modifyBtn").attr("onclick", "modifySave()");
			$("#remove").attr("type", "button")
		}
		

	}
	
	function modifySave(){
		alert("저장하기");
		var idx=${vo.idx};
		$("#mofifyForm").submit();
		
		
	}
	
	function remove(idx){
		var result=confirm("현재 글을 삭제하시겠습니까?");
		if(result){
			location.href="${ctx}/remove.do?idx="+idx;
		}else{
			return;
		}
		
		
	}
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

				<h3>게시글 읽기</h3>

			</div>
			<div class="panel-body">
				<form id="mofifyForm" action="${ctx }/modify.do" method="post">
				<input type="hidden"
							id="idx" name="idx" value=${vo.idx } >
					<div class="form-group">
						<label for="title">제목</label> 
						<input type="text"
							class="form-control" id="title" name="title" value=${vo.title } readonly="readonly">
					</div>
					<div class="form-group">
						<label for="contents">내용</label> 
						<textarea cols="30" rows="10"
							class="form-control" id="contents" name="contents" readonly="readonly">${vo.contents }</textarea>
					</div>
					
					<div class="form-group">
						<label for="writer">작성자</label> 
						<input type="text"
							class="form-control" id="writer" name="writer" value=${vo.writer } readonly="readonly">
					</div>
					
					
					<input type="button" id="modifyBtn"  onclick="modifyForm()" class="btn btn-default" value="수정">
					
					<button type="reset" class="btn btn-default">취소</button>
					<input type="hidden" id="remove" onclick="remove(${vo.idx })" class="btn btn-default" value="삭제" >
					<button type="button" class="btn btn-default" onclick="location.href='${ctx}/list.do'">목록으로</button>
					
				</form>
			</div>
		</div>
	</div>
</body>
</html>