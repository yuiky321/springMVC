<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.co.spring.model.*"%>
<%@ page import="java.util.*"%>
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
	$().ready(()=>{
		<c:if test="${!empty msg}">
			alert("${msg}");
			<c:remove var="msg" scope="session"/> /*세션세팅 메세지 삭제  */
		</c:if>
		
	})

  function deleteFn(num){
	  location.href="${ctx}/memberDelete.do?num="+num; // ?num=12
  }
  
  function check(){
	  if ($("#user_id").val()==''){
		  alert("아이디를 입력하세요.")
		  return false;
	  }
	  if ($("#password").val()==''){
		  alert("비밀번호를 입력하세요.")
		  return false;
	  }
	  return true;
  }
  
  
  function logout() {
	location.href="<c:url value='/memberLogout.do'/>"; //컨텍스트 경로 바로 입력됨
	//"${ctx}+/memberLogout.do"
}

  
  function deleteAjaxFn(num){
	  $.ajax({
		  url:"<c:url value='/memberAjaxDelete.do'/>",
		  type:"GET",
		  data:{"num" : num},
		  success:memberAjaxList,
		  error:function(){
			  alert("삭제되지 않았습니다. 확인필요!")
		  }
	  })
  }
//ajax로 리스트 가져오기
  function memberAjaxList(){

  	 
  	   $.ajax({
  		  url:'<c:url value="/memberAjaxList.do"/>',
  		  type:'GET',
  		  dataType:'JSON',
  		  success:resultHtml,
  		  error:function(){
  			  alert('리스트 가져오기 에러');
  		  }
  	  }) 
  	  
  }

  function resultHtml(data){
	 
  	  
  	  var html='<table class="table table-bordered">';
  	  html+='<thead><tr>'
  	  html+='<th>번호</th><th>아이디</th><th>비밀번호</th><th>이름</th><th>나이</th><th>이메일</th><th>전화번호</th><th>삭제</th></tr></thead><tbody>'

  		  /* <c:forEach var="vo" items="${list}">  </c:forEach>*/
  		  $.each(data, function(index, obj){
  			  html+='<tr>';
  			  html+='<td>'+obj.num+'</td>';
  			  html+='<td>'+obj.id+'</td>'		
  			  html+='<td>'+obj.pass+'</td>'
  			  html+='<td>'+obj.name+'</td>';
  			  html+='<td>'+obj.age+'</td>'
  			  html+='<td>'+obj.email+'</td>';
  			  html+='<td>'+obj.phone+'</td>'	
  		
  			  
      	if('${sessionScope.userName}'==obj.name){//sessionScope ''으로 문자로 사용해야함!
      		html+='<td><input type="button" value="삭제" class="btn btn-warning" onclick="deleteAjaxFn('+obj.num+')"></td>'	
      	}else{
      		html+='<td><input type="button" value="삭제" class="btn btn-warning" onclick="deleteAjaxFn('+obj.num+')" disabled="disabled"></td>'
      	}
  		
  	  html+='</tr>'			
  		  })// $.each 끝
  		  html+='</tbody></table>'				
  		  $("#collapse-panel-body").html(html);
  		
  }
</script>
</head>
<body>
	<div class="container">
		<h2>&nbsp;&nbsp;게시판</h2>
		<div class="panel panel-default">

			<div class="panel-heading">
				<c:if test="${sessionScope.userId == '' || sessionScope.userId ==null}">
					<form class="form-inline" action="${ctx}/memberLogin.do" method="post">
						<div class="form-group">
							<label for="user_id">ID:</label>
							<input type="text" class="form-control" id="user_id" name="user_id">
						</div>
						<div class="form-group">
							<label for="password">Password:</label>
							<input type="password" class="form-control" id="password" name="password">
						</div>

						<button type="submit" class="btn btn-default" onclick="return check()">로그인</button>
					</form>
				</c:if>
				<c:if test="${sessionScope.userId  != null}"> 
				'${sessionScope.userName}' 님  환영합니다
					<button type="button" class="btn btn-default" onclick="logout()">로그아웃</button>
				</c:if>


			</div>
			<div class="panel-body">
				<div class="table-responsive">
					<table class="table table-bordered">
						<thead>

							<tr>
								<th>번호</th>
								<th>아이디</th>
								<th>비밀번호</th>
								<th>이름</th>
								<th>나이</th>
								<th>이메일</th>
								<th>전화번호</th>
								<th>이미지</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="vo" items="${list}">
								<tr>
									<td>${vo.num}</td>
									<td>
										<a href="${ctx}/memberContent.do?num=${vo.num}">${vo.id}</a>
									</td>
									<td>${vo.pass}</td>
									<td>${vo.name}</td>
									<td>${vo.age}</td>
									<td>${vo.email}</td>
									<td>${vo.phone}</td>
									<td>
									filename${vo.filename }
									<c:if test="${vo.filename !=null && vo.filename !=''}">
										<img alt="이미지"  src='<c:out value="file_repo/${vo.filename}"/> ' width="60px"  height="60px">
									</c:if>
									</td>
									<c:if test="${sessionScope.userId==vo.id}">
										<td>
											<input type="button" value="삭제" class="btn btn-warning" onclick="deleteFn(${vo.num})">
										</td>
									</c:if>

									<c:if test="${sessionScope.userId!=vo.id }">
										<td>
											<input type="button" value="삭제" class="btn btn-warning" onclick="deleteFn(${vo.num})" disabled="disabled">
										</td>
									</c:if>

								</tr>
							</c:forEach>
							<tr>
								<td colspan="9" align="right">
									<input type="button" value="회원가입" class="btn btn-primary" onclick="location.href='${ctx}/memberRegister.do'" />
								</td>
							</tr>
						</tbody>


					</table>
				</div>

			</div>


			<div class="panel-footer">abc</div>
		</div>


		<div class="panel-group">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" href="#collapse1" onclick="memberAjaxList()">리스트가져오기</a>
					</h4>
				</div>
				<div id="collapse1" class="panel-collapse collapse">
					<div class="panel-body" id="collapse-panel-body">qqqqq</div>
					<div class="panel-footer">Panel Footer</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">

</script>
</html>