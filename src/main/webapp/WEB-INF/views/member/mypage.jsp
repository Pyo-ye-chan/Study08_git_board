<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="//t1.kakaocdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>Insert title here</title>

<style>
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}


.container {
	width: 640px;
	margin: 40px auto;
	background-color: #fff;
	border: 1px solid #d8e3f5;
	border-radius: 16px;
	box-shadow: 0 8px 24px rgba(0, 0, 0, 0.08);
	overflow: hidden;
}

.title {
	width: 100%;
	height: 64px;
	line-height: 64px;
	font-size: 24px;
	font-weight: bold;
	background: linear-gradient(135deg, cornflowerblue, #5a8dee);
	color: white;
	text-align: center;
}

.middle {
	width: 100%;
	overflow: hidden;
	padding: 28px 24px 18px;
}

.left {
	width: 30%;
	float: left;
}

.right {
	width: 70%;
	float: left;
}

.left > div,
.right > div {
	width: 100%;
	min-height: 56px;
	margin-bottom: 10px;
	display: flex;
	align-items: center;
}

.left > div {
	padding-left: 12px;
	font-weight: bold;
	font-size: 15px;
	color: #444;
}

.right > div {
	padding-right: 8px;
	gap: 8px;
}

.right input[type="text"] ,
.right input[type="password"] {
	width: 100%;
	height: 40px;
	padding: 0 12px;
	border: 1px solid #cfd8e3;
	border-radius: 8px;
	outline: none;
	font-size: 14px;
	
}

.right input[type="text"]:focus,
.right input[type="password"]:focus {
	border-color: cornflowerblue;
	box-shadow: 0 0 0 3px rgba(100, 149, 237, 0.15);
}

#id,
#zipcode {
	width: 230px;
}

.right input[type="button"],
.right input[type="submit"] {
	height: 40px;
	padding: 0 16px;
	border-radius: 8px;
	cursor: pointer;
	border: 1px solid #5a8dee;
	background-color: white;
	color: #4a76d1;
	font-weight: bold;

}

.right input[type="button"]:hover,
.right input[type="submit"]:hover {
	background-color: #edf4ff;
}

.feet {
	width: 100%;
	clear: both;
	display: flex;
	justify-content: center;
	gap: 12px;
	padding: 10px 24px 24px;
}

.btns {
	display: flex;
	gap: 12px;
}

#updateBtn,
#backBtn,
#completeBtn,
#cancelBtn {
	width: 150px;
	height: 44px;
	font-size: 15px;
	font-weight: bold;
	border-radius: 10px;
	cursor: pointer;
	border: 1px solid #c9d3e0;
	background-color: white;
	color: #333;
	
}

#updateBtn:hover,
#backBtn:hover,
#cancelBtn:hover {
	background-color: #f3f6fb;
}

#completeBtn {
	border: 1px solid cornflowerblue;
	background-color: cornflowerblue;
	color: white;
}

#completeBtn:hover {
	background-color: #4f7fe6;
}

.readonly {
	border: none !important;
	background: transparent !important;
	color: #444;
	padding-left: 0 !important;
	box-shadow: none !important;
}

.edit {
	border: 1px solid #cfd8e3 !important;
	background: white !important;
	padding-left: 12px !important;
}

a {
	text-decoration: none;
}
</style>
</head>
<body>

	<form action="/member/update">
		<div class="container">
			<div class="title">My page</div>

			<div class="middle">
				<div class="left">
					<div>ID</div>
					<div>이름</div>
					<div>전화번호</div>
					<div>이메일</div>
					<div>우편번호</div>
					<div>주소</div>
					<div>상세주소</div>
					<div>가입날짜</div>
				</div>

				<div class="right">
					<div><input type="text" class="readonly" id="id" name="id" value="${inform.id}" readonly></div>				
					<div><input type="text" class="readonly" id="name" name="name" value="${inform.name}" readonly></div>				
					<div><input type="text" class="editable readonly" id="phone" name="phone" value="${inform.phone}" readonly></div>
					<div><input type="text" class="editable readonly" id="email" name="email" value="${inform.email}" readonly></div>
					<div>
					<input type="text" class="editable readonly" id="zipcode" name="zipcode" value="${inform.zipcode}" readonly>
					<input type="button" id="searchBtn" style="display: none" value="찾기">
					</div>
					<div><input type="text" class="editable readonly" id="address1" name="address1" value="${inform.address1}" readonly></div>
					<div><input type="text" class="editable readonly" id="address2" name="address2" value="${inform.address2}" readonly></div>
					<div><input type="text" class="readonly" id="join_date" name="join_date" value="${inform.join_date}" readonly></div>
				</div>
			</div>

			<div class="feet">
				<div class="btns">
                <input type="button" id="updateBtn" value="수정하기">
                <input type="submit" id="completeBtn" value="수정완료" style="display: none;">
           		</div>
            	<div class="btns">
                <a href="/member/back"><input type="button" id="backBtn" value="뒤로가기"></a>
                <a href="/member/mypage"><input type="button" id="cancelBtn" value="취소" style="display: none;"></a>
           		 </div>
			</div>
		</div>
		</form>
		<script>
			$("#updateBtn").on("click", function(){			
				$("#updateBtn").css({"display": "none"});
				$("#backBtn").css({"display": "none"});

				$("#completeBtn").css({"display": "inline"});
				$("#cancelBtn").css({"display": "inline"});
				
				$("#searchBtn").css({"display": "inline"});
	
				$(".readonly").attr("readonly", false);				
				$(".editable").addClass("edit").removeClass("readonly");
			});
			
			$("#completeBtn").on("click", function(){				
				$("#updateBtn").css({"display": "inline"});
				$("#backBtn").css({"display": "inline"});

				$("#completeBtn").css({"display": "none"});
				$("#cancelBtn").css({"display": "none"});
				
				$("#searchBtn").css({"display": "none"});
	
				$(".readonly").attr("readonly", true);			
				$(".editable").addClass("readonly").removeClass("edit");
			});
			
			let searchBtn = document.getElementById("searchBtn");
			
			let zipcode = document.getElementById("zipcode");
			let address1 = document.getElementById("address1");
			let address2 = document.getElementById("address2");
			
			searchBtn.onclick = function() {
				new kakao.Postcode({
					oncomplete : function(data) {
						let addr = "";

						if (data.userSelectedType === "R") {
							addr = data.roadAddress;
						} else {
							addr = data.jibunAddress;
						}

						zipcode.value = data.zonecode;
						address1.value = addr;
						address2.focus();
					}
				}).open();
			};
		</script>
		

</body>
</html>