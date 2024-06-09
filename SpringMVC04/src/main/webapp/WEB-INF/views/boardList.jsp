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
function goForm(){

	$("#listForm").css("display", "none")
	$("#registerForm").css("display", "block")
}


function goList(){

	$("#listForm").css("display", "block")
	$("#registerForm").css("display", "none")
	
}
 
 function goInsert(){

	 var form_data=$("#registerContent").serialize();//직렬화해서 form 안의 내용을 키와 값으로 가져옴
	 $.ajax({
		url:"boradInsert.do",
		type:"post",
		data:form_data,
		success:loadList,
		error:()=>{
			alert("게시글 등록에러")
		},
	 })
 }

 function loadList(){

	 location.reload();//화면 새로고침

	 goForm()
	 
 }
 
 function goContents(idx){
	 var countnum=$("#count_"+idx).text();
	
	 if($("#text_"+idx).css("display")=="none"){
		 $("#text_"+idx).css("display", "table-row")
		  $.ajax({
			 url:"countUpdate.do",
			 type:"get",
			 data: {"idx":idx},
			 success : function(){
				 var num=Number(countnum)+1;
				 $("#count_"+idx).text(num) ; 
			 },
		     error:function (){
		    	 alert("조회수 업데이트 실패")
		     }
		 }) 
	 }else{
		 $("#text_"+idx).css("display", "none")
	 }	
 }
 
 function c_delete(idx){
	var result=confirm("삭제하시겠습니까")
	if(result){
		 $.ajax({
			 url :"boardRemove.do",
			 type :"get",
			 data : {"idx": idx},
			 success :loadList,
			 error :function (){alert("삭제실패");}	
		 })
	 } 
 }
 
 function modifyForm(idx){
	 //alert("cc")
	 $("#title_"+idx).attr("type", "text");
	 $("#anker_"+idx).remove();
	 $("#modify_"+idx).html("저장"); //input -> val()   button  ->> .html() span -->> text()
	 $("#modify_"+idx).attr("onclick", "modify("+idx+")");
	

 }
 
 function modify(idx){
	 alert("cc");
	 let title=$("#title_"+idx).val();
	 let contents=$("#contents_"+idx).val();
	 
	 $.ajax({
		url:"boardModify.do", 
		type:"post",
		data:{"idx" :idx, "title":title, "contents":contents},
		success:modifySu,
		error:function(){
			alert("수정실패")}
	 })
 }
 
 
 function modifySu(data){
	 alert("수정이 완료되었습니다");
	 loadList();
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
		<div id="listForm" class="panel panel-default">
			<div class="panel-heading  ">
				<div class="vertical-alignment row">
					<div class="col-sm-8">
						<h2>&nbsp;&nbsp;&nbsp;&nbsp;게시물 목록</h2>
					</div>
					<div class="col-sm-4 align-self-center">
						<br> <br>

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
									<td><input type="hidden" class="form-control"  value="${vo.title }" id="title_${vo.idx }" name="title_${vo.idx }">
										<span id="anker_${vo.idx }">
											<a  href="javascript:goContents(${vo.idx })">${vo.title }</a>
										</span>
									</td>
									<td ><span id="count_${vo.idx }">${vo.count }</span></td>
									<td>${vo.writer }</td>
									<td>${vo.indate.substring(0,10) }</td>
									<%-- <td><fmt:formatDate value="${vo.indate}" pattern="yyyy-MM-dd" /> </td> --%>
								</tr>
								<tr id="text_${vo.idx }" style="display:none">
									<td colspan="1">내용</td>
									<td colspan="4"><textarea id="contents_${vo.idx }" rows="7" class="form-control">${vo.contents }</textarea>
									<br>
									<button id="modify_${vo.idx }" class="btn btn-default btn-sm" onclick="modifyForm(${vo.idx })">수정하기</button>&nbsp;&nbsp;
									<button class="btn btn-default btn-sm" onclick="c_delete(${vo.idx })">삭제</button>
									<span id="reset01"></span>
									</td>
									
									
								</tr>

							</c:forEach>
						</tbody>

					</table>
					<button id="regbtn" type="button" onclick="goForm()"
						class="btn btn-sm btn-primary pull-right">게시물 작성</button>
				</div>
			</div>
		</div>
		<div id="registerForm" class="panel panel-default"
			style="display: none;">
			<div class="panel-heading">

				<h3>게시물 작성하기</h3>

			</div>
			<div class="panel-body">
				<form id="registerContent">
					<div class="form-group">
						<label for="title">제목</label> <input type="text"
							class="form-control" id="title" name="title">
					</div>
					<div class="form-group">
						<label for="contents">내용</label>
						<textarea cols="30" rows="10" class="form-control" id="contents"
							name="contents"></textarea>
					</div>

					<div class="form-group">
						<label for="writer">작성자</label> <input type="text"
							class="form-control" id="writer" name="writer">
					</div>

					<button type="button" onclick="goInsert()" class="btn btn-default">등록</button>
					<button type="reset" class="btn btn-default btn-sm">취소</button>
					<button type="button" onclick="goList()" class="btn btn-default">목록으로</button>

				</form>
			</div>
		</div>
	</div>
</body>
</html>