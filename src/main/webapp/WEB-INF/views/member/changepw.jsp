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
							<input type="text" name="id" id="id" value="" placeholder="Current Password" />
						</div>

						<div class="col-6">
							<input type="email" name="demo-email" id="pw" placeholder="Password to Change" />

						</div>
						<span id="pw-check" style="font-size: 75%; color: red;"></span>

						<!-- 
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
						</div> -->


						<div style="margin-top: 10px; padding-right: 16px; width: 999px;">
							<center>
								<input id="loginBT" type="button" class="button large" value="Change" onclick="login()" />
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
        function login () {
            var flag = true;
            var id = document.getElementById('id')
            var pw = document.getElementById('pw')

            //체크박스
            if(!$('#robot').is(':checked')){
                alert('로봇은 로그인할 수 없습니다.');
                return false;
            }
            //아이디입력했는지
            if(!id.value.length > 0){
                alert('아이디를 입력해주세요')
                id.focus();
                return false;
            }
            //비밀번호입력했는지
            if(!pw.value.length > 0){
                alert('비밀번호를 입력해주세요')
                pw.focus();
                return false;
            }
            $.ajax({
                url : 'login',
                data : {
                    id : id.value,
                    pw : pw.value
                },
                type : 'post',
                success : function (res) {
                    if(res == 'checkId error'){
                        $('#error').html('존재하지 않는 아이디입니다.')
                        id.focus();
                    }
                    if(res == 'login error'){
                        $('#error').html('비밀번호가 올바르지 않습니다.')
                        pw.focus();
                    }
                    if(res == 'login success'){
                        location.href = <c:url value="/"/>
                    }
                    
                },
                error : function (res) {
                    alert('알 수 없는 오류발생 : 유형2')
                }
            })
        }

        //document.getElementById('loginform').submit();
        function signup () {
            location.href = 'signup';
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