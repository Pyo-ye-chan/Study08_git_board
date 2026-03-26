<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="//t1.kakaocdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', sans-serif;
}

body {
	display: flex;
	justify-content: center;
	padding-top: 50px;
	background-color: #f9f9f9;
}

.signup-container {
	width: 600px;
	border: 1px solid #ccc;
	border-radius: 8px;
	overflow: hidden;
	background-color: white;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.header {
	background-color: #50555a;
	color: white;
	text-align: center;
	padding: 15px;
	font-size: 1.2rem;
	font-weight: bold;
}

form {
	padding: 20px 40px;
}

.input-row {
	display: flex;
	align-items: center;
	margin-bottom: 15px;
}

.input-row label {
	width: 100px;
	text-align: right;
	margin-right: 20px;
	font-weight: bold;
	font-size: 0.9rem;
}

.input-row input {
	flex: 1;
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.zipcode-group {
	display: flex;
	flex: 1;
	gap: 10px;
}

.btn-find {
	background-color: #50555a;
	color: white;
	border: none;
	padding: 5px 15px;
	border-radius: 4px;
	cursor: pointer;
}

.footer {
	text-align: center;
	margin-top: 20px;
}

.btn-submit {
	background-color: #50555a;
	color: white;
	border: none;
	padding: 10px 40px;
	border-radius: 4px;
	font-size: 1rem;
	cursor: pointer;
}

#btn-id {
	background-color: #50555a;
	color: white;
	border: none;
	padding: 5px 5px;
	border-radius: 4px;
	cursor: pointer;
	margin-left: 8px;
}

.btn-submit:hover, .btn-find:hover, #btn-id:hover {
	background-color: #d1d1d1;
}

.readonly {
	background-color: #afafaf;
}

.pw-hint {
	flex: 1;
	font-size: 12px;
	color: #d9534f;
	display: flex;
	align-items: flex-start;
}

.pw-hint::before {
	content: "•";
	margin-right: 5px;
	font-weight: bold;
}

.id-serach {
	flex: 1;
	font-size: 12px;
	color: #421cee;
	display: flex;
	align-items: flex-start;
	display: none;
}
</style>
</head>
<body>

	<div class="signup-container">
		<div class="header">회원 가입 정보 입력</div>
		<form action="/member/signup" method="post" id="form">
			<div class="input-row">
				<label>ID</label> <input type="text" name="id"
					placeholder="아이디를 입력하세요" id="input-id">
				<button type="button" id="btn-id">중복 확인</button>
			</div>
			<div class="input-row">
				<label></label>
				<div class="id-serach" id="div-id">사용 가능한 아이디입니다.</div>
			</div>
			<div class="input-row">
				<label>PW</label> <input type="password" name="pw"
					placeholder="비밀번호를 입력하세요" id="input-pw">
			</div>
			<div class="input-row">
				<label>PW 확인</label> <input type="password" name="pw_confirm"
					placeholder="비밀번호를 다시 입력하세요" id="reinput-pw">
			</div>

			<div class="input-row">
				<label></label>
				<div class="pw-hint" id="div-pw">비밀번호는 특수문자, 숫자, 대소문자가 최소 한
					글자씩은 포함되어야 합니다.</div>
			</div>

			<div class="input-row">
				<label>이름</label> <input type="text" name="name"
					placeholder="이름을 입력하세요" id="name">
			</div>
			<div class="input-row">
				<label>전화번호</label> <input type="text" name="phone"
					placeholder="전화번호를 입력하세요" id="phone">
			</div>
			<div class="input-row">
				<label>이메일</label> <input type="email" name="email"
					placeholder="이메일을 입력하세요">
			</div>
			<div class="input-row">
				<label>우편번호</label>
				<div class="zipcode-group">
					<input type="text" name="zipcode" placeholder="우편번호" id="btn-zip"
						readonly class="readonly">
					<button type="button" class="btn-find">찾기</button>
				</div>
			</div>
			<div class="input-row">
				<label>주소</label> <input type="text" name="address1"
					placeholder="주소를 입력하세요" class="full-width readonly" id="btn-add1"
					readonly>
			</div>
			<div class="input-row">
				<label>상세주소</label> <input type="text" name="address2"
					placeholder="상세주소를 입력하세요" class="full-width">
			</div>

			<div class="footer">
				<button type="submit" class="btn-submit">회원가입</button>
			</div>
		</form>
	</div>

	<script>
            $(".btn-find").on("click", function () {
                new kakao.Postcode({
                    oncomplete: function (data) {
                        $("#btn-zip").val(data.zonecode);
                        $("#btn-add1").val(data.roadAddress);
                    }
                }).open();
            });

            $("#btn-id").on("click", function () {
                // 팝업창 띄우는 함수 파라미터 3개 첫번째는 링크 두번째는 팝업창의 이름 세번째는 옵션값 : 위치 크기 등
                // window.open("/members/idCheck?id=" + $("#input-id").val(), "", "top=100,left=100, width=300, height=200");
                // if (!/^(?=.*[a-z])(?=.*[0-9_])?[a-z0-9]{4,12}/.test($("#input-id").val())) {
                //     alert("ID는 영문 소문자, 숫자, _ 포함 4~12자리 이내로 생성 가능합니다.");
                //     document.getElementById("input-id").focus();
                // }else {
                //     alert("사용 가능한 아이디입니다.")
                // }
                
                $.ajax({
                	url:"/members/idCheck?id=" + $("#input-id").val(),
                	dataType:"Json"
                }).done(function(idcheck){
                	if(idcheck == 0){
                		$(".id-serach").html("사용 가능한 아이디입니다.");
                		$(".id-serach").css("color", "#421cee");
                		$(".id-serach").css("display", "inline");
                	}else if(idcheck > 0){
                		$(".id-serach").html("중복된 아이디 입니다.");
                		$(".id-serach").css("color", "#d9534f");
                		$(".id-serach").css("display", "inline");
                	}
                })
            });

            $("#form").on("submit", function () {
                if (!/^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{4,16}$/.test($("#input-pw").val())) {
                    alert("비밀번호는 특수문자, 숫자, 대소문자가 최소 한글자씩은 포함되어야 합니다.")
                    return false;
                }

                if (!/^[가-힣a-zA-Z]{2,6}$/.test($("#name").val())) {
                    alert("이름은 2~6자의 한글 또는 영문만 입력 가능합니다.");
                    return false;
                }

                if (!/^010-?[0-9]{4}-?\d{4}$/.test($("#phone").val())) {
                    alert("전화번호 형식이 올바르지 않습니다. (예: 010-1234-5678)");
                    $("#phone").focus();
                    return false;
                }
                
				if($("#email" != null)){
					if (!/^[a-zA-Z0-9_]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,}$ || *.*/.test($("#email").val())) {
	                    alert("올바른 이메일 주소 형식이 아닙니다.")
	                    return false;
	                }
				}
                
            });

            $("#input-pw, #reinput-pw").on("keyup", function () {
                let pw = $("#input-pw").val();
                let rePw = $("#reinput-pw").val();

                if (pw == "" && rePw == "") {
                    $("#div-pw").html("비밀번호는 특수문자, 숫자, 대소문자가 최소 한글자씩은 포함되어야 합니다.");
                } else if (pw == rePw) {
                    $("#div-pw").html("비밀번호 일치").css("color", "blue");
                } else {
                    $("#div-pw").html("비밀번호 불일치").css("color", "red");
                }
            });

            $("#input-id").on("keyup", function () {
                if (!/^(?=.*[a-z])(?=.*[0-9_])?[a-z0-9]{4,12}/.test($("#input-id").val())) {
                    $("#div-id").html("ID는 영문 소문자, 숫자, _ 포함 4~12자리 이내로 생성 가능합니다.");
                    $("#div-id").css("color", "#d9534f");
                    $("#div-id").css("display", "inline");
                }else {
                    $("#div-id").html("ID 조건이 충족되었습니다.");
                    $("#div-id").css("color", "#421cee");
                }
            });


        </script>

</body>
</html>