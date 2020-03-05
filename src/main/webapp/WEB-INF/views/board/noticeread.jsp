<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<c:url value="" />
<html>
<head>
<title>TempCat</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="<c:url value="/resources/assets/css/main.css"/>" />
<script src="<c:url value="/resources/js/jquery-3.4.1.js/"/>"></script>
</head>
<body class="single is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header">
			<h1>
				<a href="index.html">Future Imperfect</a>
			</h1>
			<nav class="links">
				<ul>
					<li><a href="#">Lorem</a></li>
					<li><a href="#">Ipsum</a></li>
					<li><a href="#">Feugiat</a></li>
					<li><a href="#">Tempus</a></li>
					<li><a href="#">Adipiscing</a></li>
				</ul>
			</nav>
			<nav class="main">
				<ul>
					<li class="search"><a class="fa-search" href="#search">Search</a>
						<form id="search" method="get" action="#">
							<input type="text" name="query" placeholder="Search" />
						</form></li>
					<li class="menu"><a class="fa-bars" href="#menu">Menu</a></li>
				</ul>
			</nav>
		</header>

		<!-- Menu -->
		<section id="menu">

			<!-- Search -->
			<section>
				<form class="search" method="get" action="#">
					<input type="text" name="query" placeholder="Search" />
				</form>
			</section>

			<!-- Links -->
			<section>
				<ul class="links">
					<li><a href="#">
							<h3>Lorem ipsum</h3>
							<p>Feugiat tempus veroeros dolor</p>
						</a></li>
					<li><a href="#">
							<h3>Dolor sit amet</h3>
							<p>Sed vitae justo condimentum</p>
						</a></li>
					<li><a href="#">
							<h3>Feugiat veroeros</h3>
							<p>Phasellus sed ultricies mi congue</p>
						</a></li>
					<li><a href="#">
							<h3>Etiam sed consequat</h3>
							<p>Porta lectus amet ultricies</p>
						</a></li>
				</ul>
			</section>

			<!-- Actions -->
			<section>
				<ul class="actions stacked">
					<li><a href="#" class="button large fit">Log In</a></li>
				</ul>
			</section>

		</section>


		<!-- Post -->
		<article class="post">
			<header>
				<div class="title">
					<h2>
						<a href="#">${requestScope.nBoard.title }</a>
					</h2>
					<p>Lorem ipsum dolor amet nullam consequat etiam feugiat</p>
				</div>
				<div class="meta">
					<time class="published" datetime="2015-11-01">${requestScope.nBoard.inputdate }</time>
					<a href="#" class="author">
						<span class="name">${requestScope.nBoard.nickname}</span>
						<img src="<c:url value="/resources/images/avatar.jpg"/>" alt="" />
					</a>
				</div>
			</header>
			<span class="image featured">
				<img src="<c:url value="/resources/images/pic01.jpg"/>" alt="" />
			</span>

			<p>${requestScope.nBoard.contents }</p>
			<footer>
				<ul class="stats">
					<li><a href="#">General</a></li>
					<li><a id="heart" class="icon solid fa-heart" onclick="addHeart()">${requestScope.nBoard.heart }</a></li>
					<li><a href="#" class="icon solid fa-comment">128</a></li>
				</ul>
			</footer>
		</article>

		<!--Reply -->
		<article class="post">
			<h2 style="text-align: center;">Reply</h2>
			<hr>

			<c:forEach var="i" items="${requestScope.replyList }">
				<header id="header-${i.num }">
					<div class="title">
						<h2>
							<a>${i.contents }</a>
						</h2>
						<!-- <p>Lorem ipsum dolor amet nullam consequat etiam feugiat</p> -->
						<c:if test="${sessionScope.id==i.id }">
							<input type="button" class="button small" value="Delete Reply" onclick="deletereply('${i.num}')" style="float: right;" />
							<input type="button" class="button small" value="Update Reply" onclick="updatereply('${i.num}')" style="float: right;" />
						</c:if>
					</div>
					<div class="meta">
						<time class="published" datetime="2015-11-01">${i.inputdate }</time>
						<a href="#" class="author">
							<span class="name">${i.nickname}</span>
							<img src="<c:url value="/resources/images/avatar.jpg"/>" alt="" />
						</a>
					</div>
				</header>
			</c:forEach>
			<header>
				<ul class="actions pagination">
					<li style="margin-left: 20px;"><input id="previous" type="button" class="button large previous" value="Previous Page" onclick="PreviousPage()"></li>
					<c:forEach var="i" begin="${nav.startPageGroup }" end="${nav.endPageGroup }">
						<li style="margin-left: 20px;"><input type="button" class="button fit" value="${i }" onclick="paging(${i})"></li>
					</c:forEach>
					<li style="margin-left: 20px;"><input id="next" type="button" class="disabled button large next" value="Next Page" onclick="NextPage()"></li>
				</ul>
			</header>
			<header id="myheader">
				<div class="title">
					<h2 class="col-6 col-12-xsmall">
						<form action="nreplywrite" id="myreply" method="post" style="margin-bottom: 0px;">
							<p style="margin-bottom: 0px; display: inline-block;">writing</p>
							<input type="button" class="button small" value="Send Reply" onclick="sendreply()" style="float: right;" />
							<input type="text" name="contents" id="contents" placeholder="Comment.." />
							<input type="hidden" id="id" name="id">
							<input type="hidden" id="nickname" name="nickname">
							<input type="hidden" id="noticenum" name="noticenum">
						</form>
					</h2>
				</div>
				<!-- 버튼이랑 글씨가 커지는건 헤더안이기때문. -->
				<div class="meta">
					<time class="published" datetime="2015-11-01">Insert your reply</time>
					<a href="#" class="author">
						<span class="name">${sessionScope.nickname}</span>
						<img src="<c:url value="/resources/images/avatar.jpg"/>" alt="" />
					</a>
				</div>
			</header>

		</article>
	</div>

	<!-- Footer -->
	<section id="footer">
		<ul class="icons">
			<li><a href="#" class="icon brands fa-twitter">
					<span class="label">Twitter</span>
				</a></li>
			<li><a href="#" class="icon brands fa-facebook-f">
					<span class="label">Facebook</span>
				</a></li>
			<li><a href="#" class="icon brands fa-instagram">
					<span class="label">Instagram</span>
				</a></li>
			<li><a href="#" class="icon solid fa-rss">
					<span class="label">RSS</span>
				</a></li>
			<li><a href="#" class="icon solid fa-envelope">
					<span class="label">Email</span>
				</a></li>
		</ul>
		<p class="copyright">
			&copy; Untitled. Design:
			<a href="http://html5up.net">HTML5 UP</a>
			. Images:
			<a href="http://unsplash.com">Unsplash</a>
			.
		</p>

	</section>
	<script type="text/javascript">
    if(${nav.currentGroup>0}){
    	$('#previous').attr('class', 'button large previous')  
    	        }
    else{
        $('#previous').attr('class', 'disabled button large previous')  
    } 
    
    if(${nav.endPageGroup==nav.totalPageCount}){
    	$('#next').attr('class', 'disabled button large next')  
    }
    else{
        $('#next').attr('class', 'button large next')  
    } 
    function paging (e) {
        var currentPage = e;
        //커런트페이지를 넘겨주면 그에따라 리스트를 열개 재선정하여 셀렉트를 해와야된다
        location.href = 'noticeread?noticenum=${requestScope.nBoard.noticenum}&currentPage=' + currentPage;
    }
    function NextPage () {
        
        location.href = 'noticeread?noticenum=${requestScope.nBoard.noticenum}&currentPage=' + ${nav.currentPage + 5};
    }
    function PreviousPage (e) {
        
        location.href = 'noticeread?noticenum=${requestScope.nBoard.noticenum}&currentPage=' + ${nav.currentPage - 5};
    }
        function deletereply (num) {
            location.href = 'nreplydelete?num=' + num + '&noticenum=${requestScope.nBoard.noticenum}'
        }

        function sendreply () {
            var contents = document.getElementById('contents').value
            if(contents.length<1 || contents.length>2000){
                alert('댓글은 1~2000자 사이로 입력해주세요.');
                return false;
            }
            //id, nickname, noticenum, contents
            $('#id').val('${sessionScope.id}');
            $('#nickname').val('${sessionScope.nickname}');
            $('#noticenum').val('${requestScope.nBoard.noticenum}');
            
            $('#myreply').submit();
            /*//비동기식 댓글리드 > 실패 $.ajax({
                 url : 'nreplywrite',
                 type : 'POST',
                 data : {
                     id : '${sessionScope.id}',
                     nickname : '${sessionScope.nickname}',
                     noticenum : '${requestScope.nBoard.noticenum}',
                     contents : comment
                 },
                 success : function (list) {
                     $("#replyList").load(window.location.href + "#replyList");
                     
                 },
                 error : function (e) {
                     alert(JSON.stringify(e));
                 }
             });
             
            } */
            /*   function addHeart () {
                  var heart = ${requestScope.nBoard.heart}+1;
                  $('#heart').html(${requestScope.nBoard.heart+1 })
                  $.ajax({
                      url : 'noticeheart',
                      data : {
                          heart : heart
                      },
                      type : get
                  })*/
        }

        var updateflag = 0;
        //리턴눌러서 원래대로돌리거나, 댓글수정했을때 0
        var h2;
        function updatereply (num) {
            var h = "";
            h2 = "";
            if(updateflag == 1){
                alert('동시에 댓글을 수정할 수 없습니다.')
                return false;
            }
            updateflag = 1;
            h += "<div class='title'>"
            h += "<h2 class='col-6 col-12-xsmall'>"
            h += "<form action='nreplyupdate' id='myreply2' method='post' style='margin-bottom: 0px;''>"
            h += "<p style='margin-bottom: 0px; display: inline-block;'>writing</p>"
            h += "<input type='button' class='button small' value='Send Reply' onclick='updatereply2(" + num + ")' style='float: right;' />"
            h += "<input type='button' class='button small' value='Return' onclick='returnreply(" + num + ")' style='float: right;' />"
            h += "<input type='text' name='contents' id='updatecontents' placeholder='Comment..' />"
            h += "<input type='hidden' id='num2' name='num' value = '"+num+"'>"
            h += "<input type='hidden' id='id2' name='id'>"
            h += "<input type='hidden' id='nickname2' name='nickname'>"
            h += "<input type='hidden' id='noticenum2' name='noticenum'>"
            h += "</form>"
            h += "</h2>"
            h += "</div>"
            h += "<div class='meta'>"
            h += "<time class='published' datetime='2015-11-01'>Insert your reply</time>"
            h += "<a href='#' class='author'>"
            h += "<span class='name'>${sessionScope.nickname}</span>"
            h += "<img src='<c:url value='/resources/images/avatar.jpg'/>' alt='' />"
            h += "</a>"
            h += "</div>"
            h2 = $('#header-' + num).html();
            $('#header-' + num).html(h);
            
        }

        function returnreply (num) {
            updateflag = 0;
            $('#header-' + num).html(h2);
        }

        function updatereply2 (num) {
            updateflag = 0;
            //업데이트- 콘텐츠랑 인풋데이트
            $('#id2').val('${sessionScope.id}');
            $('#nickname2').val('${sessionScope.nickname}');
            $('#noticenum2').val('${requestScope.nBoard.noticenum}');
            $('#myreply2').submit();
           
        }
    </script>
	<!-- Scripts -->
	<script src="<c:url value="/resources/assets/js/jquery.min.js"/>"></script>
	<script src="<c:url value="/resources/assets/js/browser.min.js"/>"></script>
	<script src="<c:url value="/resources/assets/js/breakpoints.min.js"/>"></script>
	<script src="<c:url value="/resources/assets/js/util.js"/>"></script>
	<script src="<c:url value="/resources/assets/js/main.js"/>"></script>

</body>
</html>