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
					<li><a href="#">Intro</a></li>
					<li><a href="<c:url value="/notice/noticelist"/>">Notice Board</a></li>
					<li><a href="<c:url value="/free/freelist"/>">Free Board</a></li>
				</ul>
			</nav>
			<nav class="main">
				<ul>
					<li class="search"><a class="fa-search" href="#search">Search</a>
						<form id="search" method="get" action="<c:url value="/searchlist"/>">
							<input type="text" name="searchText" placeholder="Search" />
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
					<input type="text" name="searchText" placeholder="Search" />
				</form>
			</section>

			<!-- Links -->
			<section>
				<ul class="links">
					<li><a href="#">
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
					<li><a href="#">
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
				<h2 style="display: inline;">Search Result</h2>
				<div>

					<!-- Search -->
					<section style="width: 30%;">
						<form class="search" method="get" action="searchlist">
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
							<th style="padding-left: 30px; padding-right: 30px; width: 10px;">Nickname</th>
							<th style="text-align: left;">Title</th>
							<th style="width: 2px;">Hits</th>
							<th style="width: 8px;">Date</th>
						</tr>
					</thead>
					<tbody id="line">
						<c:forEach var="i" items="${requestScope.list }">
							<tr>
								<td>${i.nickname }</td>
								<c:if test="${i.freenum !=null}">
									<td style="text-align: left;"><a href="freeread?freenum=${i.freenum }">${i.title }</a></td>
								</c:if>

								<c:if test="${i.noticenum !=null}">
									<td style="text-align: left;"><a href="noticeread?noticenum=${i.noticenum }">${i.title }</a></td>
								</c:if>
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

			<%-- <!-- Mini Posts -->
			<section>
				<div class="mini-posts">

					<!-- Mini Post -->
					<article class="mini-post">
						<header>
							<h3>
								<a href="single.html">Vitae sed condimentum</a>
							</h3>
							<time class="published" datetime="2015-10-20">October 20, 2015</time>
							<a href="#" class="author">
								<img src="<c:url value="/resources/images/avatar.jpg"/>" alt="" />
							</a>
						</header>
						<a href="single.html" class="image">
							<img src="<c:url value="/resources/images/pic04.jpg"/>" alt="" />
						</a>
					</article>

					<!-- Mini Post -->
					<article class="mini-post">
						<header>
							<h3>
								<a href="single.html">Rutrum neque accumsan</a>
							</h3>
							<time class="published" datetime="2015-10-19">October 19, 2015</time>
							<a href="#" class="author">
								<img src="<c:url value="/resources/images/avatar.jpg"/>" alt="" />
							</a>
						</header>
						<a href="single.html" class="image">
							<img src="<c:url value="/resources/images/pic05.jpg"/>" alt="" />
						</a>
					</article>

					<!-- Mini Post -->
					<article class="mini-post">
						<header>
							<h3>
								<a href="single.html">Odio congue mattis</a>
							</h3>
							<time class="published" datetime="2015-10-18">October 18, 2015</time>
							<a href="#" class="author">
								<img src="<c:url value="/resources/images/avatar.jpg"/>" alt="" />
							</a>
						</header>
						<a href="single.html" class="image">
							<img src="<c:url value="/resources/images/pic06.jpg"/>" alt="" />
						</a>
					</article>

					<!-- Mini Post -->
					<article class="mini-post">
						<header>
							<h3>
								<a href="single.html">Enim nisl veroeros</a>
							</h3>
							<time class="published" datetime="2015-10-17">October 17, 2015</time>
							<a href="#" class="author">
								<img src="<c:url value="/resources/images/avatar.jpg"/>" alt="" />
							</a>
						</header>
						<a href="single.html" class="image">
							<img src="<c:url value="/resources/images/pic07.jpg"/>" alt="" />
						</a>
					</article>

				</div>
			</section>
 --%>
			<!-- Posts List -->
			<%-- <section>
				<ul class="posts">
					<li>
						<article>
							<header>
								<h3>
									<a href="single.html">Lorem ipsum fermentum ut nisl vitae</a>
								</h3>
								<time class="published" datetime="2015-10-20">October 20, 2015</time>
							</header>
							<a href="single.html" class="image">
								<img src="<c:url value="/resources/images/pic08.jpg"/>" alt="" />
							</a>
						</article>
					</li>
					<li>
						<article>
							<header>
								<h3>
									<a href="single.html">Convallis maximus nisl mattis nunc id lorem</a>
								</h3>
								<time class="published" datetime="2015-10-15">October 15, 2015</time>
							</header>
							<a href="single.html" class="image">
								<img src="<c:url value="/resources/images/pic09.jpg"/>" alt="" />
							</a>
						</article>
					</li>
					<li>
						<article>
							<header>
								<h3>
									<a href="single.html">Euismod amet placerat vivamus porttitor</a>
								</h3>
								<time class="published" datetime="2015-10-10">October 10, 2015</time>
							</header>
							<a href="single.html" class="image">
								<img src="<c:url value="/resources/images/pic10.jpg"/>" alt="" />
							</a>
						</article>
					</li>
					<li>
						<article>
							<header>
								<h3>
									<a href="single.html">Magna enim accumsan tortor cursus ultricies</a>
								</h3>
								<time class="published" datetime="2015-10-08">October 8, 2015</time>
							</header>
							<a href="single.html" class="image">
								<img src="<c:url value="/resources/images/pic11.jpg"/>" alt="" />
							</a>
						</article>
					</li>
					<li>
						<article>
							<header>
								<h3>
									<a href="single.html">Congue ullam corper lorem ipsum dolor</a>
								</h3>
								<time class="published" datetime="2015-10-06">October 7, 2015</time>
							</header>
							<a href="single.html" class="image">
								<img src="<c:url value="/resources/images/pic12.jpg"/>" alt="" />
							</a>
						</article>
					</li>
				</ul>
			</section> --%>

			<!-- About -->
			<section class="blurb">
				<h2>About</h2>
				<p>A space that anyone can freely use whenever they sign up. If you have any questions or requests, please send them to send request.</p>
				<ul class="actions">
					<li><a href="#" class="button">Send Request</a></li>
				</ul>
			</section>

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
				<!-- <p class="copyright">
					&copy; Untitled. Design:
					<a href="http://html5up.net">HTML5 UP</a>
					. Images:
					<a href="http://unsplash.com">Unsplash</a>
					.
				</p> -->
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
     
        function paging (e) {
            var currentPage = e;
            //커런트페이지를 넘겨주면 그에따라 리스트를 열개 재선정하여 셀렉트를 해와야된다
            location.href = 'searchlist?currentPage=' + currentPage;
        }

        function NextPage () {
            
            location.href = 'searchlist?currentPage=' + ${nav.currentPage + 5};
        }
        function PreviousPage (e) {
            
            location.href = 'searchlist?currentPage=' + ${nav.currentPage - 5};
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