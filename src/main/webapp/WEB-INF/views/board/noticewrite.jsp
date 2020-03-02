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
		<section>
			<h3>Form</h3>
			<form method="post" action="#">
				<div class="row gtr-uniform">
					<div class="col-6 col-12-xsmall">
						<input type="text" name="demo-name" id="demo-name" value="" placeholder="Name" />
					</div>
					<div class="col-6 col-12-xsmall">
						<input type="email" name="demo-email" id="demo-email" value="" placeholder="Email" />
					</div>
					<div class="col-12">
						<select name="demo-category" id="demo-category">
							<option value="">- Category -</option>
							<option value="1">Manufacturing</option>
							<option value="1">Shipping</option>
							<option value="1">Administration</option>
							<option value="1">Human Resources</option>
						</select>
					</div>
					<div class="col-4 col-12-small">
						<input type="radio" id="demo-priority-low" name="demo-priority" checked>
						<label for="demo-priority-low">Low</label>
					</div>
					<div class="col-4 col-12-small">
						<input type="radio" id="demo-priority-normal" name="demo-priority">
						<label for="demo-priority-normal">Normal</label>
					</div>
					<div class="col-4 col-12-small">
						<input type="radio" id="demo-priority-high" name="demo-priority">
						<label for="demo-priority-high">High</label>
					</div>
					<div class="col-6 col-12-small">
						<input type="checkbox" id="demo-copy" name="demo-copy">
						<label for="demo-copy">Email me a copy</label>
					</div>
					<div class="col-6 col-12-small">
						<input type="checkbox" id="demo-human" name="demo-human" checked>
						<label for="demo-human">Not a robot</label>
					</div>
					<div class="col-12">
						<textarea name="demo-message" id="demo-message" placeholder="Enter your message" rows="6"></textarea>
					</div>
					<div class="col-12">
						<ul class="actions">
							<li><input type="submit" value="Send Message" /></li>
							<li><input type="reset" value="Reset" /></li>
						</ul>
					</div>
				</div>
			</form>
		</section>

		<!-- Post -->
		<article class="post">
			<header>
				<div class="title">
					<h2 class="col-6 col-12-xsmall">
						<p style="margin-bottom: 0px;">writing</p>
						<input type="text" name="title" id="title" value="" placeholder="Title" />
					</h2>
				</div>
				<div class="meta">
					<time class="published" datetime="2015-11-01">November 1, 2015</time>
					<a href="#" class="author">
						<span class="name">${sessionScope.nickname}</span>
						<img src="<c:url value="/resources/images/avatar.jpg"/>" alt="" />
					</a>
				</div>
			</header>
			<div class="col-12">
				<textarea name="demo-message" id="demo-message" onkeydown="resize(this)" onkeyup="resize(this)" style="min-height: 300px;"></textarea>
			</div>
			<footer>
				<ul class="stats">
					<li><a href="#">General</a></li>
					<li><a href="#" class="icon solid fa-heart">28</a></li>
					<li><a href="#" class="icon solid fa-comment">128</a></li>
				</ul>
			</footer>
			<div class="col-12">
				<ul class="actions">
					<li><input type="submit" value="Send Message" /></li>
					<li><input type="reset" value="Reset" /></li>
				</ul>
			</div>
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
        function resize (obj) {
            obj.style.height = "1px";
            obj.style.height = ( 12 + obj.scrollHeight ) + "px";
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