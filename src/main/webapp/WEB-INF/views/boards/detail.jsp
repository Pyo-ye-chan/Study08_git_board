<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<title>Insert title here</title>
<style>
* {
	box-sizing: border-box;
}

.main {
	/* border:1px solid black; */
	width: 800px;
	height: 900px;
	margin: auto;
}

.mainTitle {
	text-align: center;
	font-weight: bold;
	font-size: 25px;
	line-height: 100px;
	width: 100%;
	height: 10%;
	margin-top: 10px;
	margin-bottom: 20px;
}

.mainBoard {
/* 	gap: 10px; /* 모든 자식 요소(div) 사이에 10px씩 간격을 자동으로 줍니다 */
	width: 100%;
	height: 80%;
}

.mainBoard div {
	text-align: left;
	/* border:1px solid black; */
}

.boardSeq {
	/* border:1px solid black; */
	width: 100%;
	height: 10%;
	margin-left: 0;
	display: flex;
}

.seq {
	border-top-right-radius: 5px;
	background-color: rgb(244, 244, 245);
	/* border:1px solid black; */
	font-weight: bold;
	font-size: 15px;
	padding: 10px;
	line-height: 20px;
	width: 15%;
	height: 100%;
}

.inputSeq {
	border: 1px solid lightgrey;
	margin: 5px;
	padding: 5px;
	border-radius: 5px;
	width: 80%;
	height: 90%;
}

.boardTitle {
	/* border:1px solid black; */
	width: 100%;
	height: 10%;
	margin-left: 0;
	display: flex;
}

.title {
	background-color: rgb(244, 244, 245);
	font-weight: bold;
	font-size: 15px;
	padding: 10px;
	line-height: 20px;
	width: 15%;
	height: 100%;
}

.inputTitle {
	border: 1px solid lightgrey;
	margin: 5px;
	padding: 5px;
	border-radius: 5px;
	width: 80%;
	height: 90%;
}

.boardWriter {
	/* border:1px solid black; */
	width: 100%;
	height: 10%;
	margin-left: 0;
	display: flex;
}

.writer {
	background-color: rgb(244, 244, 245);
	/* border:1px solid black; */
	font-weight: bold;
	font-size: 15px;
	padding: 10px;
	line-height: 15px;
	width: 15%;
	height: 100%;
}

.inputWriter {
	border: 1px solid lightgrey;
	margin: 5px;
	padding: 5px;
	border-radius: 5px;
	width: 80%;
	height: 90%;
}
.boardFile{
	/* border:1px solid black; */
	width: 100%;
	height: 10%;
	margin-left: 0;
	display: flex;
	margin-bottom:10px;
}

.boardViews {
	/* border:1px solid black; */
	width: 100%;
	height: 10%;
	margin-left: 0;
	display: flex;
}

.inputViews {
	border: 1px solid lightgrey;
	margin: 5px;
	padding: 5px;
	border-radius: 5px;
	width: 80%;
	height: 90%;
}

.views {
	background-color: rgb(244, 244, 245);
	/* border:1px solid black; */
	font-weight: bold;
	font-size: 15px;
	padding: 10px;
	line-height: 15px;
	width: 15%;
	height: 100%;
}

.boardDate {
	/* border:1px solid black; */
	width: 100%;
	height: 10%;
	margin-left: 0;
	display: flex;
}

.inputDate {
	border: 1px solid lightgrey;
	margin: 5px;
	padding: 5px;
	border-radius: 5px;
	width: 80%;
	height: 90%;
}

.date {
	background-color: rgb(244, 244, 245);
	/* border:1px solid black; */
	font-weight: bold;
	font-size: 15px;
	padding: 10px;
	line-height: 15px;
	width: 15%;
	height: 100%;
}

.boardContent {
	/* border:1px solid black; */
	width: 100%;
	height: 50%;
	max-height: 50%;
	margin-left: 0;
	display: flex;
}

.content {
	border-bottom-right-radius: 5px;
	background-color: rgb(244, 244, 245);
	font-weight: bold;
	font-size: 15px;
	padding: 10px;
	width: 15%;
	height: 100%;
	line-height: 20px;
}

.inputContent {
	border: 1px solid lightgrey;
	margin: 5px;
	padding: 5px;
	border-radius: 5px;
	width: 80%;
	height: 97%;
	overflow-y: auto;
}

.btns {
	/* margin: 10px; */
	margin:auto;
	display: flex;
}

.delBtn {
	width: 70px;
	height: 30px;
	border: 1px solid lightgrey;
	background-color: white;
	text-decoration: none; /* 밑줄 제거 */
	color: black;
	margin-left:300px;
}

.delBtn a {
	text-decoration: none; /* 밑줄 제거 */
	color: black;
}

.upBtn {
	width: 70px;
	height: 30px;
	border: 1px solid lightgrey;
	background-color: white;
    margin-left:5px;
    margin-right:10px;
}

.listBtn {
	width: 70px;
	height: 30px;
	border: 1px solid lightgrey;
	background-color: white;
}

.listBtn a {
	text-decoration: none; /* 밑줄 제거 */
	color: black;
}

.upSucBtn {
	width: 70px;
	height: 30px;
	border: 1px solid lightgrey;
	background-color: white;
}

.replyMain {
	border: 1px solid lightgrey;
	width: 100%;
	height: 100px;
	display: flex;
	padding: 5px;
}

.inputReply {
	width: 85%;
	height: 100%;
	max-height: 100%;
}

.replyRegiBtn {
	width: 15%;
	height: 100%;
	border: 1px solid lightgrey;
	background-color: white;
}

.replyList {
/* 	border: 1px solid black; */
	width: 100%;
	height: 50%;
	padding: 5px;
	overflow-y: auto;
}

.rReply {
	width: 100%;
	height: 40%;
	padding: 5px;
}

.top {
	display: flex;
	width: 100%;
	height: 20%;
	align-items: flex-end;
	margin-bottom: 2px;
}

.rUserTitle {
	margin-right: 5px;
	padding: 2px;
	padding-left: 10px;
	width: fit-content;
	border-radius: 3px;
	font-weight: bold;
	width: fit-content;
}

.rDate {
	color: grey;
	margin-left: 5px;
	font-size: 10px
}

.bottom {
	width: 100%;
	height: 80%;
	max-height: 80%;
	padding-left: 10px;
}

.rBtns {
	margin: 10px;
	margin-left: 320px;
	display: flex;
}

.rDelBtn {
	width: 70px;
	height: 30px;
	border: 1px solid lightgrey;
	background-color: white;
	text-decoration: none; /* 밑줄 제거 */
	color: black;
	margin-left: 40px;
}

.rDelBtn a {
	text-decoration: none; /* 밑줄 제거 */
	color: black;
}

.rUpBtn {
	width: 70px;
	height: 30px;
	border: 1px solid lightgrey;
	background-color: white;
	text-decoration: none; /* 밑줄 제거 */
	color: black;
	marign-left: 40px;
}
</style>
</head>
<body>
	<div class="main">
		<form action="/boards/update" class="form">
			<div class="mainTitle">글내용</div>
			<div class="mainBoard">
				<div class="boardSeq">
					<div class="seq">글번호</div>
					<div class="inputSeq">${dto.seq}</div>
				</div>
				<div class="boardTitle">
					<div class="title">제목</div>
					<div name="title" class="inputTitle">${dto.title}</div>
				</div>
				<div class="boardWriter">
					<div class="writer">작성자</div>
					<div name="writer" class="inputWriter">${dto.writer}</div>
				</div>				
				<div class="boardViews">
					<div class="views">조회수</div>
					<div class="inputViews">${dto.view_count}</div>
				</div>
				<div class="boardDate">
					<div class="date">작성일</div>
					<div class="inputDate">${dto.write_date}</div>
				</div>
				<div class="boardContent">
					<div class="content">내용</div>
					<div name="contents" class="inputContent">${dto.contents}</div>
				</div>
				<div class="btns">
					<input type="hidden" name="seq" value="${dto.seq}">

					<c:if test="${loginID==dto.writer}">
						<button type="button" class="delBtn myUp">
							<a href="/boards/deleteContent">삭제</a>
						</button>
						<button type="button" class="upBtn myUp">수정</button>
						<button type="button" class="delBtn myDown" style="display: none">
							<a href="/boards/board">취소</a>
						</button>
						<input type="hidden" name="cPage" value="${currentPage}">
						<button class="upSucBtn myDown" style="display: none">수정완료</button>
						<input type="hidden" name="title" class="title">
						<input type="hidden" name="contents" class="contents">
					</c:if>
					<button type="button" class="listBtn">
						<a href="/boards/board">목록</a>
					</button>
				</div>
			</div>
		</form>
	</div>
	<script>

	</script>
</body>
</html>