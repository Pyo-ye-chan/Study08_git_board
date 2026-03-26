<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<title>Insert title here</title>
<style>
*{
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}


div{
    border: none;
}

.container{
    width: 1200px;
    margin: 40px auto;
    background-color: white;
    border: 1px solid #dbe3f0;
    border-radius: 12px;
    overflow: hidden;
}

.title{
    font-size: 28px;
    font-weight: bold;
    padding: 22px 0;
    text-align: center;
    background-color: cornflowerblue;
    color: white;
}

.content{
    padding: 25px 30px 30px;
}

.header{
    display: flex;
    background-color: #edf3ff;
    border: 1px solid #d6e4ff;
    border-radius: 8px 8px 0 0;
    font-weight: bold;
}

.header .headline{
    flex: 1;
    padding: 14px 10px;
    text-align: center;
    border-right: 1px solid #d6e4ff;
}

.header .headline:last-child{
    border-right: none;
}

.header .headline:nth-child(2){
    flex: 3;
}

.list{
    border: 1px solid #e5e7eb;
    border-top: none;
    border-radius: 0 0 8px 8px;
    overflow: hidden;
}

.contents{
    display: flex;
    align-items: center;
    justify-content: center;
    min-height: 56px;
    padding: 0 12px;
    border-bottom: 1px solid #eef1f5;
    background-color: white;
    color: #666;
    font-size: 15px;
}



.btn{
    margin-top: 22px;
    text-align: right;
}

.btns{
    padding: 11px 22px;
    cursor: pointer;
    border: none;
    border-radius: 8px;
    background-color: cornflowerblue;
    color: white;
    font-size: 15px;
    font-weight: bold;
    transition: 0.2s;
}



.number{
    margin-top: 24px;
    text-align: center;
    font-size: 15px;
    letter-spacing: 2px;
}

.insert{
    display: flex;
}

.insert .contents{
    flex: 1;
    padding: 14px 10px;
    text-align: center;
    border-right: 1px solid #d6e4ff;
}

.insert .contents:last-child{
    border-right: none;
}

.insert .contents:nth-child(2){
    flex: 3;
}
</style>
</head>
<body>
<div class="container">
    <div class="title">회원게시판</div>
    <div class="content">
        <div class="header">
            <div class="headline">글번호</div>
            <div class="headline">제목</div>
            <div class="headline">작성자</div>
            <div class="headline">작성일</div>
            <div class="headline">조회수</div>
        </div>
        <div class="list">
      		<c:forEach var="i" items="${list }">
            <div class="insert">    
      		<div class="contents">${i.seq }</div>
            <div class="contents"><a href="/board/detail?seq=${i.seq }&view_count=${i.view_count}" id="link">${i.title }</a></div>
            <div class="contents">${i.writer }</div>
            <div class="contents">${i.write_date }</div>
            <div class="contents">${i.view_count }</div>
            </div>         
            </c:forEach>
        </div>
        <div class="btn">
        <a href="/members/back"><button class="btns" id="listBtn">메인</button></a>
        <a href="/board/writeform"><button class="btns" id="writeBtn">글쓰기</button></a>
        </div>
        <div class="number">
        
        </div>
    </div>
</div>
<script>
	let recordCountPerPage = ${recordCountPerPage};
	let naviCountPerPage = ${naviCountPerPage};
	let recordTotalCount = ${recordTotalCount};
	let currentPage = ${currentPage};
	
	// js에서는 정수와 실수를 구분하지 않음
	// let pageTotalCount = (int)Math.ceil((double)${recordTotalCount} / ${recordCountPerPage};
	let pageTotalCount = Math.ceil(recordTotalCount / recordCountPerPage);
			
	let startNavi = Math.floor((currentPage - 1) / naviCountPerPage) * naviCountPerPage + 1;
	let endNavi = startNavi + naviCountPerPage - 1;
	
	if(endNavi > pageTotalCount) {
		endNavi = pageTotalCount;
	}
	
	let needPrev = true;
	let needNext = true;
	
	if(startNavi == 1){needPrev = false;}
	if(endNavi == pageTotalCount){needNext = false;}
	
	if(needPrev){
		let prev = $("<a>");
		prev.attr("href", "/board/list?cpage="+(startNavi-1));
		prev.html("<<")
		$(".number").append(prev);
	}

	
	for(let i = startNavi; i <= endNavi; i++){
		let navi = $("<a>");
		navi.attr("href", "/board/list?cpage="+i);
		navi.html(" " + i);
		$(".number").append(navi);
	}
	
	if(needNext){
		let next =$("<a>");
		next.attr("href", "/board/list?cpage="+(endNavi+1));
		next.html(" >>");
		$(".number").append(next);
	}
	
	console.log("현재 페이지 : " + currentPage);
	console.log("시작 Navi : " + startNavi);
	console.log("끝 Navi : " + endNavi);
</script>
</body>
</html>