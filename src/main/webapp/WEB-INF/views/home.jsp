<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <style>
      * {
        box-sizing: border-box;  
      }
      #main {
        margin: auto;
        border: 1px solid dodgerblue;
        border-radius:5px;
        width: 500px;
        height: 200px;
        text-align: center;
        position: relative;
      }
      #title{
        color: dodgerblue;
        font-size: 25px; 
        font-weight: bold;
        position: absolute;
        top:10px;
        left:200px;
      }
      #id{
        position: absolute;
        top:60px;
        left:150px;
      }
      #pw{
        position: absolute;
        top:90px;
        left:142px;
      }
      #btn {
        position: absolute;
        top:130px;
        left:190px; 
      }
      #login{
        width: 70%;
        height: 70%;
        border: none;
        border-radius: 4px;
        background-color: dodgerblue;
        color:white;
      }
      #login:hover{
        width: 70%;
        height: 70%;
        border-radius: 4px;
        border:1px solid dodgerblue;
        background-color: white;
        color:dodgerblue;
        transition-duration: 0.5s;
      }
      #register{
      	width: 70%;
        height: 70%;
        border: none;
        border-radius: 4px;
        background-color: dodgerblue;
        color:white;
      }
      #register:hover{
      	width: 70%;
        height: 70%;
        border-radius: 4px;
        border:1px solid dodgerblue;
        background-color: white;
        color:dodgerblue;;
        transition-duration: 0.5s;
      }
      #toBoardBtn{
      	width:70px;
        height:30px;
        border:1px solid lightgrey; 
    	background-color:white;  
    	margin:10px;
      }
      #toMyPage{
      	width:70px;
        height:30px;
        border:1px solid lightgrey; 
    	background-color:white;  
    	margin:10px;
      }
      #logoutBtn input{
      	width:70px;
        height:30px;
        border:1px solid lightgrey; 
    	background-color:white;  
    	margin:10px;
      }
      #delBtn{
      	width:70px;
        height:30px;
        border:1px solid lightgrey; 
    	background-color:white;  
    	margin:10px;
      }

    </style>
  </head>
  <body>
   <c:choose>
	   <c:when test="${loginID==null}">
	   		<div id="main">
	        <div id="title">Login Box</div>
	        <form action="/member/login" method="post">
		       <div id="input">
		            <div id="id">ID <input name="id" type="text" placeholder="ID"></div>
		            <div id="pw">PW <input name="pw" type="password" placeholder="PW"></div>
		       </div>
		       <div id="btn">
		            <input id=login type="submit" value="로그인">
		            <a href="/members/join"><input id=register type="button" value="회원가입"></a>
		       </div>
	        </form>
			</div>
	   </c:when>
	   <c:otherwise>
	   	  <table border='1' solid black>
	   	  	<th colspan='4'>
			   ${loginID}님 환영합니다.
			   <tr>
			   	   <td>
				   	    <a href="/boards/board"><input id="toBoardBtn" name="guestBook" type="button" value="게시판"></a>
				   </td>
				   	   <td>
					   	    <a href="/members/myPage"><input id="toMyPage" name="myPage" type="button" value="마이페이지"></a>
					   </td>
				   <td>
					   <div id="logoutBtn"> 
					   		<a href="/members/logout"><input id="logoutBtn" name="logoutBtn" type="button" value="Logout"></a>
					   </div>
				   </td>
				   <td>
				   		<a href="/members/delete"><input style="background-color:" type="button" value="회원탈퇴" id="delBtn"></a>
				   </td>
			   </tr>
		  	</th>
		  </table>
		  <script>
		  /*회원 탈퇴 버튼 팝업창 confirm*/
	         $("#delBtn").on("click",function(e){
	        	 let deleteYou = confirm("정말 탈퇴하시겠습니까?");/*true확인 or false취소*/
	        	 if(deleteYou){
	        		 alert("탈퇴 완료 되었습니다.");
	        	 }else{
	        		 alert("[*감사 쿠폰팩 증정!] 감사합니다.");
	        		 e.preventDefault();
	        	 }
	         }) 
	         
	         
		  </script>
	   </c:otherwise>
   </c:choose>
  <br>
    
  </body>
</html>