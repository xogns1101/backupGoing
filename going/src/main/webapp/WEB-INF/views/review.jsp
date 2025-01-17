<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>REVIEW</title>
    <%@ include file="include/static-head.jsp" %>

</head>

<body>

    <%@ include file="include/header.jsp" %>


    <section>

        <div class="title">
            <h1>REVIEW / <span>리뷰</span></h1>
            <button type="button" class="write-button">NEW <br> WRITE</button>
        </div>


        <div class="bigBox">
            <c:forEach var="b" items="${rList}">


                <div class="review-list">
                    <div class="review-box" data-bno="${b.reviewNo}">
                        <ul class="review">
                            <!-- <li class="rno">${b.reviewNo}</li> -->
                            <!-- <li class="camp-name">${b.campName}</li>
                            <li class="email">${b.email}</li> -->
                            <img src="/review${b.reviewImage}" alt="리뷰">
                            <li class="review-content">${b.reviewContent}</li>
                        </ul>
                        <button class="review-modify">수정</button>
                        <button class="review-delete" data-href="/main/review-delete?rno=${b.reviewNo}">삭제</button>
                        <div class="good-button">👍🏻</div>
                        <!-- <div class="good-button">❤️</div> -->
                        <!-- <button type="button" class="good-button">🤍</button> -->
                        <div class="good-count">${b.reviewLike}</div>

                    </div>
                </div>

            </c:forEach>
        </div>


        <!--페이징 부분-->

        <div class="pageBox">
            <nav aria-label="Page navigation example">
                <ul class="pagination pagination-lg pagination-custom">
                    <c:if test="${marker.page.pageNo != 1}">
                        <li><a 
                                href="/main/review?pageNo=1&type=${s.type}&keyword=${s.keyword}">&lt;&lt;</a>
                        </li>
                    </c:if>
                    <c:if test="${marker.prev}">
                        <li><a href="/main/review?pageNo=${marker.begin-1}&type=${s.type}&keyword=${s.keyword}">prev</a>
                        </li>
                    </c:if>
                    <c:forEach var="i" begin="${marker.begin}" end="${marker.end}">
                        <li data-page-num="${i}">
                            <a
                                href="/main/review?pageNo=${i}&type=${s.type}&keyword=${s.keyword}">${i}</a>
                        </li>
                    </c:forEach>
                    <c:if test="${marker.next}">
                        <li><a 
                                href="/main/review?pageNo=${marker.end+1}&type=${s.type}&keyword=${s.keyword}">next</a>
                        </li>
                    </c:if>
                    <c:if test="${marker.page.pageNo != marker.finalPage}">
                        <li><a 
                                href="/main/review?pageNo=${marker.finalPage}&type=${s.type}&keyword=${s.keyword}">&gt;&gt;</a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </div>






    </section>


    <%@ include file="include/footer.jsp" %>




    <script>
        // 하트를 눌렀을때 좋아요 up!
        const $goodButton = document.querySelectorAll('.bigBox .good-button');

        $goodButton.forEach(function (fingerbutton) {
            fingerbutton.addEventListener('click', function () {
                if (fingerbutton.textContent === '👍🏻') {
                    fingerbutton.textContent = '👍';

                    fetch('/main/reviews')
                        .then(res => res.json())
                        .then(flag => {})

                } else {
                    fingerbutton.textContent = '👍🏻';
                }
            })
        })


        // 리뷰 작성 버튼을 눌렀을때 리뷰 등록 페이지로 이동시키기
        const writeButton = document.querySelector('.write-button');

        if (writeButton) {

            writeButton.addEventListener('click', function () {
                // 원하는 경로로 이동합니다.
                window.location.href = '/main/review-write';
            });
        }

        // 리뷰 수정 버튼을 눌렀을때 리뷰 수정 페이지로 이동시키기


        // 삭제 버튼을 눌렀을때 리뷰 삭제 진행시키기


        const $btn = document.querySelector('.bigBox');

        $btn.addEventListener('click', e => {

            if (e.target.matches('.review-delete')) {
                // 리뷰 삭제 버튼을 클릭한 경우에만 실행
                const isConfirmed = confirm('정말로 삭제하시겠습니까?');

                if (isConfirmed) {
                    const reviewNo = e.target.closest('.review-box').dataset.bno;
                    console.log(reviewNo);
                    // 서버에 삭제 요청 보내기
                    location.href = '/main/review-delete?rno=' + reviewNo;
                }
            }
            if (e.target.matches('.review-modify')) {
                const reviewNo = e.target.closest('.review-box').dataset.bno;
                console.log(reviewNo);

                location.href = '/main/review-modify?rno=' + reviewNo;


            }
        });

        function appendPageActive() {

            // 현재 서버에서 넘겨준 페이지 번호
            const currPage = '${maker.page.pageNo}';

            // li 태그들을 전부 확인해서
            // 현재 페이지 번호와 일치하는 li를 찾은 후 active 클래스 이름 붙이기
            const $ul = document.querySelector('.pagination');
            const $liList = [...$ul.children];

            $liList.forEach($li => {
                if (currPage === $li.dataset.pageNum) {
                    $li.classList.add('active');
                }
            });
        }


        appendPageActive();
    </script>




</body>

</html>