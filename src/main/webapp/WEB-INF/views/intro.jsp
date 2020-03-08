<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>TempCat</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="<c:url value="/resources/assets/css/main.css"/>" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyDkQ00U2AUBQSS1CJF5YveL-1YWsTjaRGA"></script>
<style>
#map_ma {
	width: 45%;
	height: 400px;
	clear: both;
	border: solid 1px red;
}
</style>
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

			<!-- Post -->

			<article class="post">
				<header>
					<div class="title">
						<h2>
							<a href="<c:url value="notice/noticeread?noticenum=${i.noticenum }" />">타이틀</a>
						</h2>
						<p>Multipurpose responsive site created by アンジュンソク</p>
					</div>
					<div class="meta">
						<time class="published" datetime="2015-11-01">August 03, 2020</time>
						<a href="#" class="author">
							<span class="name">ジュンソク案</span>
							<img src="<c:url value="/resources/images/avatar.jpg"/>" alt="" />
						</a>
					</div>
				</header>
				<div style="width: 50%; margin: 0 auto; display: inline-block;">こんにちは! 日本で働くように勉強中のアンジュンソクです. 私が日本でプログラマーになりたい理由はインフラ構築者になりたいからです。 私がIT分野に初めて関心を持つようになったのは、韓国で軍隊に服務した時でした。 同僚の電算兵たちがコーディングするのを見て、関心を持つようになりました。 また、その当時、非効率的な業務処理方式を改善して、作業スピードを10倍以上向上させた経験があります。このような過程を通して多くのやりがいを感じ、作業の効率性と便利さについて悩んでみるきっかけになりました。 服務を終えてからIT分野に対する関心が続いてさまざまなITと関わる授業を受けるようになりました。卒業後、IT業界で私のこのような経験を活かしながら働きたくて日本就職を決心するようになりました. 日本は現在に安住せず絶えずインフラが発展している国です。私はこれからこのような日本の発展に役立ち、新しい時代を切り開く主役になりたいです。</div>
				<div id="map_ma" style="position: relative; display: inline-block;"></div>
				<p>${i.contents }</p>
				<footer>
					<ul class="actions">
						<li> <input type="button" >당장 취업시키기</li>
						<li></li>
					</ul>
					<ul class="stats">
						<li><a href="#">General</a></li>
						<li><a href="#" class="icon solid fa-heart">${i.heart }</a></li>
						<li><a href="#" class="icon solid fa-comment">${i.comments }</a></li>
					</ul>
				</footer>
			</article>

			<!-- Post -->

		</div>

		<!-- Sidebar -->
		<section id="sidebar">

			<!-- Intro -->
			<section id="intro">
				<a href="<c:url value="/"/>" class="logo">
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
			<!-- Mini Posts -->
			<section>
				<div class="mini-posts">

					<!-- Mini Post -->
					<c:forEach var="i" items="${requestScope.freeList }">
						<article class="mini-post">
							<header>
								<h3>
									<a href="<c:url value="/free/freeread?freenum=${i.freenum }"/>">${i.title }</a>
								</h3>
								<time class="published" datetime="2015-10-20">${i.inputdate }</time>
								<a href="" class="author">
									<span class="name">${i.nickname }</span>
									<img src="<c:url value="/resources/images/avatar.jpg"/>" alt="" />
								</a>
							</header>
							<a href="<c:url value="/free/freeread?freenum=${i.freenum }"/>" class="image">
								<img src="<c:url value="/resources/images/pic04.jpg"/>" alt="" />
							</a>
						</article>
					</c:forEach>
				</div>
			</section>

			<!-- About -->
			<section class="blurb">
				<h2>About</h2>
				<p>私は Korea International Trade Academy SMART Cloud SC IT MASTERの 38期 所属の教育生です. このサイトは外部のフリーウェアデザインテンプレートを借りて作りました。 どうぞよろしくお願いします。</p>
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

			</section>

		</section>

	</div>

	<script type="text/javascript">
        $(document)
                .ready(function () {
                    var myLatlng = new google.maps.LatLng(37.511683, 127.061255); // 위치값 위도 경도
                    var Y_point = 37.511683; // Y 좌표
                    var X_point = 127.061255; // X 좌표
                    var zoomLevel = 15; // 지도의 확대 레벨 : 숫자가 클수록 확대정도가 큼
                    var markerTitle = "한국무역협회"; // 현재 위치 마커에 마우스를 오버을때 나타나는 정보
                    var markerMaxWidth = 300; // 마커를 클릭했을때 나타나는 말풍선의 최대 크기
                    
                    // 말풍선 내용
                    var contentString = '<div>' + '<h2>SC IT MASTER</h2>' + '<p> Korea International Trade Academy in COEX</p>' +

                    '</div>';
                    var myLatlng = new google.maps.LatLng(Y_point, X_point);
                    var mapOptions = {
                        zoom : zoomLevel,
                        center : myLatlng,
                        mapTypeId : google.maps.MapTypeId.ROADMAP
                    }
                    var map = new google.maps.Map(document
                            .getElementById('map_ma'), mapOptions);
                    var marker = new google.maps.Marker({
                        position : myLatlng,
                        map : map,
                        title : markerTitle
                    });
                    var infowindow = new google.maps.InfoWindow({
                        content : contentString,
                        maxWizzzdth : markerMaxWidth
                    });
                    google.maps.event.addListener(marker, 'click', function () {
                        infowindow.open(map, marker);
                    });
                });
    </script>
	<!-- Scripts -->
	<script src="<c:url value="/resources/assets/js/jquery.min.js"/>"></script>
	<script src="<c:url value="/resources/assets/js/browser.min.js"/>"></script>
	<script src="<c:url value="/resources/assets/js/breakpoints.min.js"/>"></script>
	<script src="<c:url value="/resources/assets/js/util.js"/>"></script>
	<script src="<c:url value="/resources/assets/js/main.js"/>"></script>

</body>
</html>