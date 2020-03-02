<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>TempCat</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="<c:url value="/resources/assets/css/main.css"/>" />
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header">
			<h1>
				<a href="index.html">Blog Contents</a>
			</h1>
			<nav class="links">
				<ul>
					<li><a href="#">Intro</a></li>
					<li><a href="<c:url value="/board/noticeboardlist"/>">Notice Board</a></li>
					<li><a href="<c:url value="/board/freeboardlist"/>">Free Board</a></li>
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
			<h2 style="text-align: center;">Notice Board</h2>
			<c:if test="${sessionScope.id=='1'}">
				<ul class="actions">
					<li><a href="noticewrite" class="button large">글쓰기</a></li>
					<li><a href="#" class="button large">Large</a></li>
				</ul>
			</c:if>
			<h4>Alternate</h4>
			<div class="table-wrapper">
				<table class="alt">
					<thead>
						<tr>
							<th>Num</th>
							<th>Nickname</th>
							<th>Post</th>
							<th>Date</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>Item One</td>
							<td>Ante turpis integer aliquet porttitor.</td>
							<td>29.99</td>
						</tr>
						<tr>
							<td>1</td>
							<td>Item Two</td>
							<td>Vis ac commodo adipiscing arcu aliquet.</td>
							<td>19.99</td>
						</tr>
						<tr>
							<td>1</td>
							<td>Item Three</td>
							<td>Morbi faucibus arcu accumsan lorem.</td>
							<td>29.99</td>
						</tr>
						<tr>
							<td>1</td>
							<td>Item Four</td>
							<td>Vitae integer tempus condimentum.</td>
							<td>19.99</td>
						</tr>
						<tr>
							<td>1</td>
							<td>Item Five</td>
							<td>Ante turpis integer aliquet porttitor.</td>
							<td>29.99</td>
						</tr>
						<tr>
							<td>1</td>
							<td>Item One</td>
							<td>Ante turpis integer aliquet porttitor.</td>
							<td>29.99</td>
						</tr>
						<tr>
							<td>1</td>
							<td>Item Two</td>
							<td>Vis ac commodo adipiscing arcu aliquet.</td>
							<td>19.99</td>
						</tr>
						<tr>
							<td>1</td>
							<td>Item Three</td>
							<td>Morbi faucibus arcu accumsan lorem.</td>
							<td>29.99</td>
						</tr>
						<tr>
							<td>1</td>
							<td>Item Four</td>
							<td>Vitae integer tempus condimentum.</td>
							<td>19.99</td>
						</tr>
						<tr>
							<td>1</td>
							<td>Item Five</td>
							<td>Ante turpis integer aliquet porttitor.</td>
							<td>29.99</td>
						</tr>
					</tbody>

				</table>
				<ul class="actions pagination">
					<li><a href="" class="disabled button large previous">Previous Page</a></li>
					<li><a href="#" class="button fit">1</a></li>
					<li><a href="#" class="button fit">2</a></li>
					<li><a href="#" class="button fit">3</a></li>
					<li><a href="#" class="button fit">4</a></li>
					<li><a href="#" class="button fit">5</a></li>
					<li><a href="#" class="button large next">Next Page</a></li>
				</ul>
			</div>


			<section>
				<h3>Buttons</h3>
				<ul class="actions">
					<li><a href="#" class="button large">Large</a></li>
					<li><a href="#" class="button">Default</a></li>
					<li><a href="#" class="button small">Small</a></li>
				</ul>
				<ul class="actions fit">
					<li><a href="#" class="button fit">Fit</a></li>
					<li><a href="#" class="button fit">Fit</a></li>
					<li><a href="#" class="button fit">Fit</a></li>
				</ul>
				<ul class="actions fit small">
					<li><a href="#" class="button fit small">Fit + Small</a></li>
					<li><a href="#" class="button fit small">Fit + Small</a></li>
					<li><a href="#" class="button fit small">Fit + Small</a></li>
				</ul>
				<ul class="actions">
					<li><a href="#" class="button icon solid fa-download">Icon</a></li>
					<li><a href="#" class="button icon solid fa-upload">Icon</a></li>
					<li><a href="#" class="button icon solid fa-save">Icon</a></li>
				</ul>
				<ul class="actions">
					<li><span class="button disabled">Disabled</span></li>
					<li><span class="button disabled icon solid fa-download">Disabled</span></li>
				</ul>
			</section>



			<!-- -- -->
			<!-- Pagination -->
			<ul class="actions pagination">
				<li><a href="" class="disabled button large previous">Previous Page</a></li>
				<li><a href="#" class="button large next">Next Page</a></li>
			</ul>

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
				<p>Mauris neque quam, fermentum ut nisl vitae, convallis maximus nisl. Sed mattis nunc id lorem euismod amet placerat. Vivamus porttitor magna enim, ac accumsan tortor cursus at phasellus sed ultricies.</p>
				<ul class="actions">
					<li><a href="#" class="button">Learn More</a></li>
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
				<p class="copyright">
					&copy; Untitled. Design:
					<a href="http://html5up.net">HTML5 UP</a>
					. Images:
					<a href="http://unsplash.com">Unsplash</a>
					.
				</p>
			</section>

		</section>

	</div>

	<!-- Scripts -->
	<script src="<c:url value="/resources/assets/js/jquery.min.js"/>"></script>
	<script src="<c:url value="/resources/assets/js/browser.min.js"/>"></script>
	<script src="<c:url value="/resources/assets/js/breakpoints.min.js"/>"></script>
	<script src="<c:url value="/resources/assets/js/util.js"/>"></script>
	<script src="<c:url value="/resources/assets/js/main.js"/>"></script>

</body>
</html>