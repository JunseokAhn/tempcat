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

	</div>

	<div style="text-align: center">
		<div style="display: inline-block; background-color: rgba(255, 255, 255, 0.9); width: 55%; min-height: 430px; min-width: 579px; padding-left: 100px; padding-right: 100px; border: solid 1px rgba(160, 160, 160, 0.3);">
			<br>
			<br>
			<section>
				<h3>Change Your Password</h3>
				<hr>

				<form id="loginform" method="post" action="login">
					<div class="row gtr-uniform" style="text-align: left;">
						<div class="col-6 col-12-xsmall">
							<input type="text" name="current_pw" id="current_pw" placeholder="Current Password" />
						</div>

						<div class="col-6">
							<input type="email" name="pw" id="pw" placeholder="Password to Change" />

						</div>
						<span id="pw-check" style="font-size: 75%; color: red;"></span>

						<div style="margin-top: 10px; padding-right: 16px; width: 999px;">
							<center>
								<input id="loginBT" type="button" class="button large" value="Change" onclick="change()" />
							</center>
						</div>

					</div>
					<hr style="margin-top: 30px;">
					<div id="error" style="font-size: 75%; color: red; margin-bottom: 72px;"></div>
				</form>
			</section>


		</div>
	</div>
	<script type="text/javascript">
        function change () {
            
            var current_pw = document.getElementById('current_pw')
            var pw = document.getElementById('pw')

            //current pw입력했는지
            if(current_pw.value.length< 1){
                $('#error').html('현재 비밀번호를 입력해주세요');
                current_pw.focus();
                return false;
            }
            //pw입력했는지
            if(pw.value.length <1){
                $('#error').html('바꿀 비밀번호를 입력해주세요');
                pw.focus();
                return false;
            }
            
            $.ajax({
                url : 'changepw',
                data : {
                    id : ${sessionScope.id},
                    current_pw : current_pw.value,
                    pw : pw.value
                },
                type : 'post',
                success : function (e) {
                    if(e == true){
                        location.href = '<c:url value="/"/>';
                    }
                    else{
                        $('#error').html('비밀번호가 틀립니다');
                    }
                },
             	error : function(){
             	   $('#error').html('비밀번호가 틀립니다');
                }
                
            })
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