<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="/assets/css/main.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Luckiest+Guy&family=Yeon+Sung&display=swap" rel="stylesheet">



</head>
<body>

    <header>
            <div id="wrap">
                <h1 class="logo">Y⛺GAJA</h1>
                <div class="logo-content">
                    <a href="#">INTRO</a>
                    <a href="#">RESERVATION</a>
                    <a href="#">NOTICE</a>
                    <a href="#">REVIEW</a>
                </div>

                <div class="login">
                    <a href="#">LOGIN</a><br>
                    <a href="#">MYPAGE</a>
                </div>
            </div>
        </header>



        <section class="main-page1">

            <div class="main-content">
                <h1>CAMPING OF THE MONTH</h1>
                <div class="main-img">
                    <img class="campin-img1" src="/assets/img/camp1.jpg" alt="이달의캠핑1">
                    <img class="campin-img2" src="/assets/img/camp2.jpg" alt="이달의캠핑2">
                    <img class="campin-img3" src="/assets/img/camp3.jpg" alt="이달의캠핑3">
                </div>
            </div>

        </section>


        <section class="main-page2">

            <div class="main-content">

                <div class="weather">
                    <!-- 날씨  -->

                    <h1>WEATHER</h1>
                    <div class="tomorrow" data-location-id="065327" data-language="KO" data-unit-system="METRIC"
                        data-skin="light" data-widget-type="upcoming" style="padding-bottom:22px;position:relative;">
                        <a href="https://www.tomorrow.io/weather-api/" rel="nofollow noopener noreferrer" target="_blank"
                            style="position: absolute; bottom: 0; transform: translateX(-50%); left: 50%;">
                            <img alt="Powered by the Tomorrow.io Weather API"
                                src="https://weather-website-client.tomorrow.io/img/powered-by.svg" width="250"
                                height="18" />
                        </a>
                    </div>
                </div>

                <div class="best-review">
                    <h1>BEST REVIEW</h1>
                    <div class="review-box">
                        <img src="/assets/img/camp5.jpg" alt="베스트리뷰"><br>
                        <ul class="review">
                            <li class="review-title">홀리데이 캠핑장에 다녀오다!</li>
                            <li class="review-content">캠핑장이 오랜만인데 너무 너무 좋네요 하하하 또 가고싶어요 분위기도 너무 좋구요 가족끼리 오기 딱인거 같네요!</li>
                            <li class="review-views">4점</li>
                        </ul>

                    </div>
                </div>

                <div class="ad">
                    <div class="ad-box">

                        <img src="/assets/img/ad2.png" alt="광고">
                        <img src="/assets/img/ad3.png" alt="광고">
                        <img src="/assets/img/ad4.png" alt="광고"></div>
                </div>



            </div>


        </section>


        <!-- 날씨 시작 -->
        <script>
            (function (d, s, id) {
                if (d.getElementById(id)) {
                    if (window.__TOMORROW__) {
                        window.__TOMORROW__.renderWidget();
                    }
                    return;
                }
                const fjs = d.getElementsByTagName(s)[0];
                const js = d.createElement(s);
                js.id = id;
                js.src = "https://www.tomorrow.io/v1/widget/sdk/sdk.bundle.min.js";

                fjs.parentNode.insertBefore(js, fjs);
            })(document, 'script', 'tomorrow-sdk');
        </script>


        <!-- 날씨 끝 -->












        <footer>


            <div class="footer-wrap">
                <div class="footer-content">
                    <p>
                        상호 : YAGAJA &#124; 대표자명 : 홍길동 &#124; 사업자등록번호 : 123-12-1234 &#124; 주소 : 서울특별시 마포구 백범로 23, 3층 (신수동,
                        케이터틀)
                        &#124; 문의 : 02-123-1234
                    </p>
                    <br>

                    <p>이용약관 &#124; 개인정보처리방침</p>

                </div>


                <h3 class="footer-logo">Y⛺GAJA</h3>
            </div>


        </footer>

</body>
</html>