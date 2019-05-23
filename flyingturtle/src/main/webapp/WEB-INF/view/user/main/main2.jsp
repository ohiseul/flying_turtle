<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script  src="<c:url value="/resources/user/js/jquery-3.3.1.js"/>" ></script>
<style>

#card-footer2:hover {
    background :#003876;
}

#card-footer2 {
    text-align:center; 
    background:white; 
    border:1px solid #003876;
    width : 100%;
}

.welcome {
	color : white;
}

body {
  font-family: 'NanumBarunGothic', 'serif';
}


.col-lg-6  {
 font-family: 'NanumBarunGothic', 'serif';
}
h2 {
 font-family: 'NanumBarunGothic', 'serif';
}

p {
 font-family: 'NanumBarunGothic', 'serif';
}
</style>

<body>
  <header>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <!-- Slide One - Set the background image for this slide in the line below -->
        <div class="carousel-item active" style="background-image: url(/flyingturtle/resources/user/images/learn.jpg)">
          <div class="carousel-caption d-none d-md-block">
            <h3 style="font-size: 75px;">Flying Turtle</h3>
            <p class="welcome" style="font-size: 35px;">최주희님 환영합니다!</p>
          </div>
        </div>
        <!-- Slide Two - Set the background image for this slide in the line below -->
        <div class="carousel-item" style="background-image: url(/flyingturtle/resources/user/images/learn.jpg)">
          <div class="carousel-caption d-none d-md-block">
                <h3 style="font-size: 75px;">Flying Turtle</h3>
                <p class="welcome" style="font-size: 35px;">구본현님 환영합니다!</p>
          </div>
        </div>
        <!-- Slide Three - Set the background image for this slide in the line below -->
        <div class="carousel-item" style="background-image: url(/flyingturtle/resources/user/images/learn.jpg)">
          <div class="carousel-caption d-none d-md-block">
                <h3 style="font-size: 75px;">Flying Turtle</h3>
                <p class="welcome" style="font-size: 35px;">오이슬님 환영합니다!</p>
          </div>
        </div>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
  </header>

  <!-- Page Content -->
  <div class="container">

    <h1 class="my-4">Welcome to Flying Turtle!</h1>

    <!-- Marketing Icons Section -->
    <div class="row">
      <div class="col-lg-4 mb-4">
        <div class="card h-100">
          <h4 class="card-header" style="background:#003876; color:white; width:100%">공지사항</h4>
          <div class="card-body" style="border:1px solid #003876; width:100%;">
            <p class="card-text"> 
                <ul>
                    <li> 출결 안내 공지입니다. </li>
                    <li> 반장선거 알림!! 필독!! </li>
                    <li> 학생들은 보거라~~~ </li>
                    <li> 시험 결과 안내 공지사항 </li>
                    <li> 프로젝트 기간 안내 공지 </li>
                    
                </ul>
            </p>
          </div>
          <div class="card-footer" id="card-footer2" style="width:100%;">
            <a href="#" class="btn btn-primary" style="background: white; border:1px solid white; color:black;" >+ 더보기</a>
          </div>
        </div>
      </div>
      <div class="col-lg-4 mb-4">
            <div class="card h-100">
              <h4 class="card-header" style="background:#003876; color:white; width:100%;">공지사항</h4>
              <div class="card-body" style="border:1px solid #003876; width:100%;">
                <p class="card-text"> 
                    <ul>
                        <li> 출결 안내 공지입니다. </li>
                        <li> 반장선거 알림!! 필독!! </li>
                        <li> 학생들은 보거라~~~ </li>
                        <li> 시험 결과 안내 공지사항 </li>
                        <li> 프로젝트 기간 안내 공지 </li>
                        
                    </ul>
                </p>
              </div>
              <div class="card-footer" id="card-footer2" style="width:100%;">
                <a href="#" class="btn btn-primary" style="background: white; border:1px solid white; color:black;" >+ 더보기</a>
              </div>
            </div>
          </div>
          <div class="col-lg-4 mb-4">
                <div class="card h-100">
                  <h4 class="card-header" style="background:#003876; color:white; width:100%;">공지사항</h4>
                  <div class="card-body" style="border:1px solid #003876; width:100%;">
                    <p class="card-text"> 
                        <ul>
                            <li> 출결 안내 공지입니다. </li>
                            <li> 반장선거 알림!! 필독!! </li>
                            <li> 학생들은 보거라~~~ </li>
                            <li> 시험 결과 안내 공지사항 </li>
                            <li> 프로젝트 기간 안내 공지 </li>
                            
                        </ul>
                    </p>
                  </div>
                  <div class="card-footer" id="card-footer2" style="width:100%;">
                    <a href="#" class="btn btn-primary" style="background: white; border:1px solid white; color:black;" >+ 더보기</a>
                  </div>
                </div>
              </div>
            </div>
            <!-- /.row -->

    <div class="row">
            <div class="col-lg-6">
              <h2>이 달의 추천 사전!</h2>
              <p style="width:20px;"></p><p>우리반 학생들이 올린 코딩 사전! 지금 바로 확인하고 참고해보세요!</p> <hr style="border-bottom: 1px solid #003876;">
              <ul>
                <li>
                  <strong>Java</strong>
                </li>
                <li>반복문</li>
                <li>조건문</li>
                <li>파일 업로드</li>
                <li>배열</li>
              </ul>
              <p>for구문의 기본적인 구조에서 주의할점이 하나 있다.

                    그것은 초기화 할때 for문에서 선언된 변수는 for문을 끝나면 사라진다.
                    
                    (후에 자세히 배울거지만 { }(영역이라고 생각하자) 안에서 변수를 선언 하였을때
                    
                    그 { }를 나가면 선언 했던 변수는 메모리에서..</p>
            </div>
            <div class="col-lg-6" >
              <img src="./사전2.png" alt=""  style="width: 550px; height: 400px;">
            </div>
          </div>

          <hr style="border-bottom: 1px solid #003876;">

    <!-- Features Section -->
    <div class="row">
            <div class="col-lg-6">
                    <h2>이 달의 추천 강의!</h2>
                    <p style="width:20px;"></p><p>수업 예습과 복습을 위한 동영상 강의! 지금 바로 확인하고 참고해보세요!</p> <hr style="border-bottom: 1px solid #003876;">
                    <ul>
                      <li>
                        <strong>Java</strong>
                      </li>
                      <li>반복문</li>
                      <li>조건문</li>
                      <li>파일 업로드</li>
                      <li>배열</li>
                    </ul>
                    <p>for구문의 기본적인 구조에서 주의할점이 하나 있다.
      
                          그것은 초기화 할때 for문에서 선언된 변수는 for문을 끝나면 사라진다.
                          
                          (후에 자세히 배울거지만 { }(영역이라고 생각하자) 안에서 변수를 선언 하였을때
                          
                          그 { }를 나가면 선언 했던 변수는 메모리에서..</p>
                  </div>
                  <div class="col-lg-6">
                        <iframe width="550px" height="310px;" src="https://www.youtube.com/embed/ExaatgwYqfU" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                  </div>
                </div>
    
                <hr style="border-bottom: 1px solid #003876;">

    <!-- Call to Action Section -->
    <div class="row mb-4">
      <div class="col-md-8">
        <p>비트캠프의 최고의 강사 손병찬 강사님과 함께라면 우린 최고의 개발자가 될 수 있다.<br>
            No gain No pain..★
        </p>
      </div>
      <div class="col-md-4">
        <a class="btn btn-lg btn-secondary btn-block" href="#">▲</a>
      </div>
    </div>

  </div>
  <!-- /.container -->

  <!-- Bootstrap core JavaScript -->
  <script type="text/javascript" src="<c:url value="/resources/user/js/main2/main.js"/>"></script>
  <script type="text/javascript" src="<c:url value="/resources/user/js/main2/main2.js"/>"></script>
 

</body>
</html>