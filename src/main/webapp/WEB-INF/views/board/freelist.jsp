<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>TempCat</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="<c:url value="/resources/assets/css/main.css"/>" />
<script src="<c:url value="/resources/js/jquery-3.4.1.js/"/>"></script>
</head>
<body class="is-preload">
	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header">
			<h1>
				<a href="<c:url value="/"/>">Blog Contents</a>
			</h1>
			<nav class="links">
				<ul>
					<li><a href="<c:url value="/intro"/>">Intro</a></li>
					<li><a href="<c:url value="/notice/noticelist"/>">Notice Board</a></li>
					<li><a href="<c:url value="/free/freelist"/>">Free Board</a></li>
				</ul>
			</nav>
			<nav class="main">
				<ul>
					<li class="search"><a class="fa-search" href="#search">Search</a>
						<form id="search" method="get" action="<c:url value="/searchlist"/>">
							<input type="text" name="searchText" placeholder="Title" />
						</form></li>
					<li class="menu"><a class="fa-bars" href="#menu">Menu</a></li>
				</ul>
			</nav>
		</header>

		<!-- Menu -->
		<section id="menu">

			<!-- Search -->
			<section>
				<form id="search" method="get" action="<c:url value="/searchlist"/>">
					<input type="text" name="searchText" placeholder="Title" />
				</form>
			</section>

			<!-- Links -->
			<section>
				<ul class="links">
					<li><a href="<c:url value="/intro"/>">
							<h3>INTRO</h3>
							<p>Introduction to the Producer</p>
						</a></li>
					<li><a href="<c:url value="/notice/noticelist"/>">
							<h3>NOTICE BOARD</h3>
							<p>Only Admin can write</p>
						</a></li>
					<li><a href="<c:url value="/free/freelist"/>">
							<h3>FREE BOARD</h3>
							<p>Everyone can write</p>
						</a></li>
					<li><a href="<c:url value="/request"/>">
							<h3>Send Request</h3>
							<p>About the site or everything else.</p>
						</a></li>
				</ul>
			</section>

			<!-- Actions -->
			<section>
				<c:if test="${sessionScope.id==null}">
					<ul class="actions stacked">
						<li><a href="<c:url value="/member/login"/>" class="button large fit">Log In</a></li>
						<li><a href="<c:url value="/member/signup"/>" class="button large fit">Sign Up</a></li>
					</ul>
				</c:if>
				<c:if test="${sessionScope.id!=null}">
					<ul class="actions stacked">
						<li><a href="<c:url value="/member/profile"/>" class="button large fit">Profile</a></li>
						<li><a href="<c:url value="/member/logout"/>" class="button large fit">Log Out</a></li>
					</ul>
				</c:if>
			</section>

		</section>


		<!-- Main -->
		<div id="main">
			<div style="margin-top: 30px; text-align: center;">
				<h2 style="display: inline;">Free Board</h2>
				<div>
					<c:if test="${sessionScope.id!=null}">
						<input type="button" style="display: inline-block; float: right;" class="button large" value="Write" onclick="freewrite()">
					</c:if>
					<c:if test="${sessionScope.id==null}">
						<input type="button" style="display: inline-block; float: right;" class="button large" value="Log in" onclick="login()">
					</c:if>
					<!-- Search -->
					<section style="width: 30%;">
						<form class="search" method="get" action="freelist">
							<input type="text" name="searchText" style="min-width: 200px;" placeholder="Search" />
						</form>
					</section>
				</div>
			</div>
			<hr>

			<div class="table-wrapper">
				<table class="alt" style="text-align: center;">
					<thead>
						<tr>
							<th style="width: 2px;">Num</th>
							<th style="padding-left: 30px; padding-right: 30px; width: 12px;">Nickname</th>
							<th style="text-align: left;">Title</th>
							<th style="width: 2px;">Hits</th>
							<th style="width: 8px;">Date</th>
						</tr>
					</thead>
					<tbody id="line">
						<c:forEach var="i" items="${requestScope.list }">
							<tr>
								<td>${i.freenum}</td>
								<td>${i.nickname }</td>
								<td style="text-align: left;"><a href="freeread?freenum=${i.freenum }">${i.title }</a></td>
								<td>${i.hits }</td>
								<td>${i.inputdate }</td>
							</tr>
						</c:forEach>
					</tbody>

				</table>

				<ul class="actions pagination">
					<li style="margin-left: 20px;"><input id="previous" type="button" class="disabled button large previous" value="Previous Page" onclick="PreviousPage()"></li>
					<c:forEach var="i" begin="${nav.startPageGroup }" end="${nav.endPageGroup }">
						<li style="margin-left: 20px;"><input type="button" class="button fit" value="${i }" onclick="paging(${i})"></li>
					</c:forEach>

					<li style="margin-left: 20px;"><input id="next" type="button" class="button large next" value="Next Page" onclick="NextPage()"></li>

				</ul>

			</div>

		</div>

		<!-- Sidebar -->
		<section id="sidebar">

			<!-- Intro -->
			<section id="intro">
				<a href="#" class="logo">
					<img src="<c:url value="/resources/images/logo.jpg"/>" alt="" />
				</a>
				<header>
					<h2>Welcom to Tempcat</h2>
					<p>
						Multipurpose responsive site created by
						<a href="https://github.com/JunseokAhn">アンジュンソク</a>
					</p>
				</header>
			</section>


			<!-- About -->
			<section class="blurb">
				<h2>About</h2>
				<p>A space that anyone can freely use whenever they sign up. If you have any questions or requests, please send them to send request.</p>
				<ul class="actions">
					<li><a href="<c:url value="/request"/>" class="button">Send Request</a></li>
				</ul>
			</section>

			<!-- Footer -->
			<section id="footer">
				<ul class="icons">
					<li><a href="https://twitter.com/?lang=ko" class="icon brands fa-twitter">
							<span class="label">Twitter</span>
						</a></li>
					<li><a href="https://www.facebook.com/" class="icon brands fa-facebook-f">
							<span class="label">Facebook</span>
						</a></li>
					<li><a href="https://www.instagram.com/?hl=ko" class="icon brands fa-instagram">
							<span class="label">Instagram</span>
						</a></li>
					<li><a href="<c:url value="/request"/>" class="icon solid fa-envelope">
							<span class="label">Email</span>
						</a></li>
				</ul>

			</section>

		</section>
	</div>
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
        function login(){
            location.href = '<c:url value="/member/login"/>'
        }
        
        function freewrite () {
            location.href = 'freewrite'
        }
        function paging (e) {
            var currentPage = e;
            //커런트페이지를 넘겨주면 그에따라 리스트를 열개 재선정하여 셀렉트를 해와야된다
            location.href = 'freelist?currentPage=' + currentPage+'&searchText=${requestScope.searchText}';
        }

        function NextPage () {
            var devided =  ${nav.currentPage % 5}
          
            switch(devided){
                case 1:
                    location.href = 'freelist?currentPage=' + ${nav.currentPage + 5}+'&searchText=${requestScope.searchText}';
                    break;
                case 2:
                    location.href = 'freelist?currentPage=' + ${nav.currentPage + 4}+'&searchText=${requestScope.searchText}';
                    break;
                case 3:
                    location.href = 'freelist?currentPage=' + ${nav.currentPage + 3}+'&searchText=${requestScope.searchText}';
                    break;
                case 4:
                    location.href = 'freelist?currentPage=' + ${nav.currentPage + 2}+'&searchText=${requestScope.searchText}';
                    break;
                case 0:
                    location.href = 'freelist?currentPage=' + ${nav.currentPage + 1}+'&searchText=${requestScope.searchText}';
                    break;
            }
            
        }
        function PreviousPage (e) {
            var devided = ${nav.currentPage % 5}
 
            switch(devided){
                case 1:
                    location.href = 'freelist?currentPage=' + ${nav.currentPage - 1}+'&searchText=${requestScope.searchText}';
                    break;
                case 2:
                    location.href = 'freelist?currentPage=' + ${nav.currentPage - 2}+'&searchText=${requestScope.searchText}';
                    break;
                case 3:
                    location.href = 'freelist?currentPage=' + ${nav.currentPage - 3}+'&searchText=${requestScope.searchText}';
                    break;
                case 4:
                    location.href = 'freelist?currentPage=' + ${nav.currentPage - 4}+'&searchText=${requestScope.searchText}';
                    break;
                case 0:
                    location.href = 'freelist?currentPage=' + ${nav.currentPage - 5}+'&searchText=${requestScope.searchText}';
               		break;
            }
           
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