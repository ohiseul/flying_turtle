<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<header class="header">
  <!-- 안에있는  span은 	버튼모양-->
  <button type="button" class="btn-menu">
    <span></span>
    <span></span>
    <span></span>
    <span></span>
  </button>
  
  
  
              <!-- 메시지 들어가는 부분 -->
            <div class="top-message">
              <button type="button" class="btn-message">
                <img src="/flyingturtle/resources/admin/image/message.png" alt="" />
                <span class="count">0</span>
              </button>

              <div class="message-layer">
                <button
                  type="button"
                  class="btn-message-close"
                >
                  닫기
                </button>
                <div class="message-frame">
                  <!-- 메시지 작업 시작영역 -->

                  <!-- 쪽지 시작 -->
                  <div class="message-frame-sort1">
                    <button type="button" class="btn-toggle btn-write">
                      새로운 쪽지
                    </button>
                    <h2>
                      <img src="/flyingturtle/resources/admin/image/txt-letter.png" alt="쪽지" /><em
                        id="countView"
                      ></em>
                    </h2>

                    <div class="message-inner">
                      <form>
                        <ul id="messageUL" class="message-list"></ul>
                      </form>
                    </div>
                  </div>
                  <!-- 쪽지 끝 -->

                  <!-- 새로운 쪽지 시작 -->
                  <div class="message-frame-sort2">
                    <button type="button" class="btn-toggle btn-return">
                      되돌아가기
                    </button>
                    <form action="" method="">
                      <h2>
                        <img
                          src="/flyingturtle/resources/admin/image/txt-letter-new.png"
                          alt="새로운 쪽지"
                        />
                      </h2>
                      <!--  디폴트 관리자 -->
                      <div class="message-receive">
                        <p>받는사람 :</p>

                        <!-- 학생일 경우 -->
                        <!-- <div class="message-receive student">
											<p>받는사람 : 강사님</p> -->

                        <!-- 디폴트 관리자 ※ 학생일 경우 아래 태그 제외 -->
                        <div class="message-receive-inner">
                          <button type="button" class="btn-plus">추가</button>
                        </div>
                      </div>

                      <!-- 디폴트 관리자 -->
                      <textarea class="text-receive"></textarea>
                      <!-- 학생일 경우 -->
                      <!-- <textarea class="text-receive student"></textarea> -->
                      <!-- 신규일 경우 사용됨.. -->
                      <button
                        type="button"
                        class="btn-send"
                        onclick="sendTalk(0, 0, '')"
                      >
                        <div class="circle">
                          <div class="envelope-top"></div>
                          <div class="envelope"></div>
                        </div>
                      </button>
                    </form>
                  </div>

                  <div class="layer-side">
                    <p>
                      <label for="list-all">전체선택</label
                      ><input type="checkbox" id="list-all" />
                    </p>

                    <!-- 메세지 보낼수 있는 것 처리 작업 -->
                    <ul id="memberUL"></ul>

                    <button type="button" class="btn-check">닫기</button>
                  </div>

                  <!-- 새로운 쪽지 끝 -->

                  <!--  메시지 작업 시작영역 끝 -->
                </div>
              </div>
            </div>
            <!-- 메시지 들어가는 부분 끝 -->  
  
  
  
  
  
  
  
  
  
  <div id="top">
  
  <div style="display: inline-block;">
  	<a href="<c:url value="/admin/main/main.do"/>"><img id="adminsr" style="width: 200px;height: 69px; " src='<c:url value="/resources/images/adminMainRogo.png"/>'></a>
  </div>
  <%--
   <div class="top-message">
              <button type="button" class="btn-message">
                <img src="/flyingturtle/resources/admin/image/message.png" alt="" />
                <span class="count">0</span>
              </button>
               <div class="message-layer">
                <button
                  type="button"
                  class="btn-message-close"
                  onclick="msgClose()"
                >
                  닫기
                </button>
                <div class="message-frame">
                  <!-- 메시지 작업 시작영역 -->

                  <!-- 쪽지 시작 -->
                  <div class="message-frame-sort1">
                    <button type="button" class="btn-toggle btn-write">
                      새로운 쪽지
                    </button>
                    <h2>
                      <img src="/flyingturtle/resources/admin/image/txt-letter.png" alt="쪽지" /><em
                        id="countView"
                      ></em>
                    </h2>

                    <div class="message-inner">
                      <form>
                        <ul id="messageUL" class="message-list"></ul>
                      </form>
                    </div>
                  </div>
                  <!-- 쪽지 끝 -->

                  <!-- 새로운 쪽지 시작 -->
                  <div class="message-frame-sort2">
                    <button type="button" class="btn-toggle btn-return">
                      되돌아가기
                    </button>
                    <form action="" method="">
                      <h2>
                        <img
                          src="/flyingturtle/resources/admin/image/txt-letter-new.png"
                          alt="새로운 쪽지"
                        />
                      </h2>
                      <!--  디폴트 관리자 -->
                      <div class="message-receive">
                        <p>받는사람 :</p>

                        <!-- 학생일 경우 -->
                        <!-- <div class="message-receive student">
											<p>받는사람 : 강사님</p> -->

                        <!-- 디폴트 관리자 ※ 학생일 경우 아래 태그 제외 -->
                        <div class="message-receive-inner">
                          <button type="button" class="btn-plus">추가</button>
                        </div>
                      </div>

                      <!-- 디폴트 관리자 -->
                      <textarea class="text-receive"></textarea>
                      <!-- 학생일 경우 -->
                      <!-- <textarea class="text-receive student"></textarea> -->
                      <!-- 신규일 경우 사용됨.. -->
                      <button
                        type="button"
                        class="btn-send"
                        onclick="sendTalk(0, 0, '')"
                      >
                        <div class="circle">
                          <div class="envelope-top"></div>
                          <div class="envelope"></div>
                        </div>
                      </button>
                    </form>
                  </div>

                  <div class="layer-side">
                    <p>
                      <label for="list-all">전체선택</label
                      ><input type="checkbox" id="list-all" />
                    </p>

                    <!-- 메세지 보낼수 있는 것 처리 작업 -->
                    <ul id="memberUL"></ul>

                    <button type="button" class="btn-check">닫기</button>
                  </div>
            </div>  
      </div>
      </div>
   --%>
	<nav style="float: right; display: inline-block;">
			<button id="modalBtn" class="knowBtn">몰라요</button>
		<c:choose>
			<c:when test="${empty sessionScope.user}">
				<a class="alt admin" href="<c:url value="/user/login/loginform.do"/>">LogIn</a>
			</c:when>
			<c:otherwise>
				<a class="alt admin" href="<c:url value="/user/login/logout.do"/>">LogOut</a>
			</c:otherwise>
		</c:choose>
	</nav>

</div>
</header>
<%-- <script type="text/javascript" src="<c:url value="/resources/admin/js/main/admin/common.js"/>"></script> --%>