<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
.write-container {
	width: 800px;
	margin: 50px auto;
	text-align: center;
}

.write-table th {
	width: 150px;
	background-color: #c2c1c1;
    border: 1px solid black;
    border-radius: 4px;
	background-color: #c2c1c1;
}

.write-table{
	width: 100%;
}

textarea {
	width: 100%;
	box-sizing: border-box;
	height: 200px;
}

input[type="text"], textarea {
	width: 100%;
	padding: 10px;
	border: 1px solid #8a8a8a;
	border-radius: 4px;
	box-sizing: border-box; /* 패딩 포함 너비 계산 */
	font-size: 14px;
}
</style>
</head>
<body>
<div class="write-container">
		<h2>게시판 글쓰기</h2>

		<form action="/boards/write" method="post">
			<table class="write-table">
				<tr>
					<th>제목</th>
					<td><input type="text" name="title" placeholder="제목을 입력하세요"
						required></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="writer" value="${loginID}"
						readonly class="readonly-input"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="contents" placeholder="내용을 입력하세요" required></textarea>
					</td>
				</tr>
			</table>

			<div class="btn-box">
				<input type="hidden" value="${cpage }" name="cpage">
				<button type="submit" class="submit-btn">등록</button>
				<button type="button" class="cancel-btn"
					onclick="location.href='/boards/list">취소</button>
			</div>
		</form>
	</div>
</body>
</html>