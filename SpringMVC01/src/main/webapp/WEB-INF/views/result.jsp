<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
function getFile(fName){
	location.href="${ctx}/download.do?filename="+fName;
}

</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div class="panel panel-default">
  <div class="panel-heading">다운로드 test</div>
  <div class="panel-body">
  	<table class="table table-hover">
  		<tbody>
  			<tr>
  			<td>아이디</td>
  			<td>${map.id }</td>
  			</tr>
  			<tr>
  			<td>이름</td>
  			<td>${map.name }</td>
  			</tr>
  			<c:forEach var="fName" items="${map.fileList }">
  			<tr>
  			<td>${fName }</td>
  			<td><a href="javascript:getFile('${ fName}')"><span class="glyphicon glyphicon-file"></span></a></td>
  			</tr>
  			</c:forEach>
  		</tbody>
  	
  	</table>
  
  </div>
</div>
</body>
</html>