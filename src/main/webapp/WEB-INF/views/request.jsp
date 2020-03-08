<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>TempCat</title>
<script src="<c:url value="/resources/js/jquery-3.4.1.js/"/>"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="<c:url value="/resources/assets/css/main.css"/>" />
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




		<div style="text-align: center">
			<div style="display: inline-block; background-color: rgba(255, 255, 255, 0.9); width: 55%; min-height: 430px; min-width: 579px; padding-left: 100px; padding-right: 100px; border: solid 1px rgba(160, 160, 160, 0.3);">
				<br>
				<br>
				<section>
					<h3>Send Request</h3>
					<hr>
					<br>

					<form method="post" action="request" id="requestform">
						<div class="row gtr-uniform">
							<div class="col-6 col-12-xsmall">
								<input type="text" name="name" id="name" value="" placeholder="Name" />
							</div>
							<div class="col-6 col-12-xsmall">
								<input type="email" name="email" id="email" value="" placeholder="Email" />
							</div>
							<div class="col-12">
								<select name="category" id="category">
									<option value="select">- Category -</option>
									<option value="function">Function</option>
									<option value="profile">Profile</option>
									<option value="request">Request</option>
									<option value="question">Question</option>
								</select>
							</div>

							<div class="col-12">
								<textarea name="message" id="message" onkeydown="resize(this)" onkeyup="resize(this)" style="min-height: 200px; resize: none;" placeholder="Enter your message"></textarea>

							</div>
							<div class="col-12">
								<ul class="actions">
									<li><input type="button" value="Send Message" onclick="sendrequest()" /></li>
									<li><input type="reset" value="Reset" /></li>
								</ul>
							</div>
						</div>
					</form>
				</section>


			</div>
		</div>
		
	</div>
	<script type="text/javascript">
        function resize (obj) {
            obj.style.height = "1px";
            obj.style.height = ( 12 + obj.scrollHeight ) + "px";
        }
        function sendrequest () {
            var name = document.getElementById('name')
            var email = document.getElementById('email')
            var category = document.getElementById('category')
            var message = document.getElementById('message')

            if(name.value.length < 1){
                alert('이름을 입력해주세요')
                name.focus();
                return false;
            }
            
            if(name.value.length > 13){
                alert('이름은 13자 이하여야입니다.')
                name.focus();
                return false;
            }
            if(email.value.length < 1){
                alert('이메일을 입력해주세요')
                email.focus();
                return false;
            }
            
            if(email.value.length > 30){
                alert('이메일은 30자 이하여야입니다.')
                email.focus();
                return false;
            }
            if(category.value == 'select'){
                alert('카테고리를 선택해주세요')
                category.focus();
                return false;
            }
            if(message.value.length < 1){
                alert('메세지를 입력해주세요')
                message.focus();
                return false;
            }
            
            if(message.value.length > 600){
                alert('메세지는 600자 이하여야입니다.')
                message.focus();
                return false;
            }
            alert('sendrequest')
            $('#requestform').submit();
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