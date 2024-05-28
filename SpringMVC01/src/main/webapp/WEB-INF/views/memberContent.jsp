<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.co.spring.model.*"%>
<%
// MemberVO vo=(MemberVO)request.getAttribute("vo");
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css'>
<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>
<script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js'></script>
<script type="text/javascript">
	function update() {
	
		if ($("#file").val() != null) {//파일이 첨부되었을 경우
			var formData = new FormData();
			formData.append("file", $("input[name=file]")[0].files[0] );
			alert("파일추가중")
			//input태그중 이름이 file인 첫번째값을 formData에 file이라는 이름으로추가 함
			$.ajax({
				url: "<c:url value='/fileAdd.do'/>",
				type:"post",
				data:formData,
				processData:false,
				contentType:false,
				success:function(data){
					alert("데이터 넘어옴")
					$("#filename").val(data);
					document.form01.action = "${ctx}/memberUpdate.do?mode=fileUpdate";
					document.form01.submit();
				},
				error:function(){
					alert("파일 첨부실패")
				}
			})
			
			
		}else{
			document.form01.action = "${ctx}/memberUpdate.do?mode=update";
			document.form01.submit();
		}

		
	}

	function formReset() {
		alert("리셋")
		document.form01.reset();

	}

	function getFile(filename) {

		location.href = "<c:url value='/fileGet.do'/>?filename=" + filename
	}

	function deleteFile(num, filename) {
		alert(deleteFile);
		location.href = "<c:url value='/fileDelete.do'/>?filename=" + filename
				+ "&num=" + num

	}
</script>
</head>
<body>
	<div class="container">
		<div class="panel panel-default">
			<div class="panel-heading">
				<c:if test="${sessionScope.userName ==vo.name}">
					<img alt="이미지" src='<c:out value="file_repo/${vo.filename}"/> ' width="60px" height="60px">
				${sessionScope.userName }님의 수정 가능한 정보입니다.
				
				</c:if>
				<c:if test="${sessionScope.userName !=vo.name && sessionScope.userName!=null}">
				${sessionScope.userName }님의 열람가능한 정보입니다
				</c:if>
				<c:if test="${sessionScope.userName==null}">
				방문자님의 열람가능한 정보입니다
				</c:if>

			</div>
			<div class="panel-body">
				<form method="post" id="form01" name="form01">
					<input type="hidden" name="num" value="${vo.num}" />
					<input type="hidden" name="filename"  id="filename" value="${vo.filename}" />
					<table class='table table-bordered'>
						<c:if test="${vo!=null}">
							<tr>
								<td colspan="2">${vo.name}회원상세정보</td>
							</tr>
							<tr>
								<td>번호</td>
								<td>${vo.num}</td>
							</tr>
							<tr>
								<td>아이디</td>
								<td>${vo.id}</td>
							</tr>
							<tr>
								<td>비밀번호</td>
								<td>${vo.pass}</td>
							</tr>
							<tr>
								<td>이름</td>
								<td>${vo.name}</td>
							</tr>
							<tr>
								<td>나이</td>
								<td>
									<input type="text" name="age" value="${vo.age}" />
								</td>
							</tr>
							<tr>
								<td>이메일</td>
								<td>
									<input type="text" name="email" value="${vo.email}" />
								</td>
							</tr>
							<tr>
								<td>전화번호</td>
								<td>
									<input type="text" name="phone" value="${vo.phone}" />
								</td>
							</tr>
							<tr>
								<td>첨부파일</td>
								<td>

									<input type="file" name="file" id="file">
									<c:if test="${vo.filename!=null}">
										<a href="javascript:getFile('${vo.filename}')"> <c:out value='${vo.filename }' />
										</a>
									</c:if>

									<c:if test="${sessionScope.userId !=null && sessionScope.userId==vo.id}">
										<a href="javascript:deleteFile(' ${vo.num}', ' ${vo.filename }')"><span class="glyphicon glyphicon-remove"></span></a>
									</c:if>
								</td>
							</tr>
						</c:if>

					</table>
				</form>

				<div class="panel-footer" style="text-align: 'right'">

					<c:if test="${sessionScope.userId==vo.id}">
						<input type="button" value="수정하기" class='btn btn-primary'  onclick="update()" />
					</c:if>
					<input type="button" value="취소" class='btn btn-warning' onclick="formReset()" />
					<input type="button" value="리스트" onclick="location.href='${ctx}/memberList.do'" class='btn' />
				</div>

			</div>
		</div>
	</div>
</body>
</html>