<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <div class="cont">

        <div class="form sign-in">
        <h2 class="h2">반갑습니다.</h2>
        
        <form id="login-form" action="<c:url value="/user/login/login.do"/>" method="post">
        <table class="login-table">
            <tr>
                <th>
                   <input type="text" name="id" id="login-id" placeholder="아이디"/>
                   <span class="val-msg">아이디를 입력하세요.</span>
                </th>
            </tr>
            <tr>
                <th>
                    <input type="password" name="pass" id="login-pass" placeholder="비밀번호"/>
                    <span class="val-msg">비밀번호를 정확히 입력해주세요</span>
                </th>
            </tr>
            <tr>
                <td colspan="2">
                    <button class="submit">로그인</button>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <button type="button" onclick="Modal('#patternPass')" class="fb-btn">간편로그인</button>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <div class="forgot-pass" onclick="Modal('#forgot-form')">비밀번호를 잊어버리셨나요?</div>
                </td>
            </tr>
        </table>
        </form>
        <!-- <button type="button" class="fb-btn">Connect with <span>Google</span></button> -->
            
            <!-- modal  -->
            <div class="form forgot-form" id="forgot-form">
                <h2 class="h2">이메일로 비밀번호를 찾을 수 있습니다.</h2>
                <table class="login-table">
                    <tr>
                        <th><input type="text" name="id" placeholder="아이디"/></th>
                    </tr>
                    <tr>
                        <th><input type="email" name="email" placeholder="이메일"/></th>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <button type="button" class="submit">비밀번호 찾기</button>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <button type="button" class="submit" id="quit" onclick="Modal('#forgot-form')">돌아가기</button>
                        </td>
                    </tr>
                </table>
            </div>
            
            
            <!-- modal -->
            <form id="pattern-form" action="<c:url value="/user/login/patternlogin.do"/>" method="post">
            <input type="hidden" name="patternPass">
            <div class="form modal" id="patternPass">
                <h3 class="h2">더욱 손쉽게, 점점 스마트해지는 당신을 만나보세요 </h3>
                <div id="simple-pass"> 
	                <div>
	                	<input type="text" name="id" id="pattern-id" class="login-id" placeholder="아이디"/>
	                    <span class="val-msg">아이디를 입력하세요.</span>
	                </div>                
					<div id="patternContainer"></div>
					<div class="simple-log-btn">
						<input type="submit" id="confirm" value="로그인" />
						<input type="button" id="reset" value="초기화" />
					</div>
					<br />    
                </div>
                <div class="login-by-id" onclick="Modal('#patternPass')">아이디로 로그인하기</div>
            </div>
            </form>

        <div class="logo"><img src="<c:url value="/resources/user/images/String_logo.png"/>"></div>
        </div>

        <!-- 사진 -->
        <div class="sub-cont">
        <div class="img" style='background-image : url("<c:url value="/resources/user/images/turtle201.jpg"/>");'>
            <div class="img__text m--up">
                <h2>처음이신가요?</h2>
                <p>새로운 거북이후보가 되어 같이 날아봅시다!</p>
            </div>
            <div class="img__text m--in">
            <h2>회원이신가요?</h2>
            <p>그럼 이제, 날아볼 준비를 해봅시다</p>
            </div>
            <div class="img__btn">
            <span class="m--up">Sign Up</span>
            <span class="m--in">Sign In</span>
            </div>
        </div>






        <div class="form sign-up">
            <h3 class="h2">당신의 위대한 첫걸음,</h3>
				<form id="form" action="<c:url value="/user/signup/signup.do"/>" method="post">
				            <table class="kind-of-member">
				                <tr>
				                    <td>
				                        <input type="radio" name="memberCode" value="50" id="student" checked="checked"/>
				                        <label for="student">학생</label>
				                    </td>
				                    <td>
				                        <input type="radio" name="memberCode" value="51" id="manager"/>
				                        <label for="manager">강사/매니저</label>
				                    </td>
				                </tr>
				            </table>
				            <table class='form-table' id="form-table2">
				                <tr>
				                    <th>아이디*</th>
				                    <td>
					                    <input type="text" name="id" id="id" required="required" minlength="4"/>
					                    <span class="val-msg">아이디를 입력해주세요(4글자 이상)</span>
					                    <span class="val-msg">중복된 아이디입니다.</span>
				                    </td>
				                </tr>
				                <tr>
				                    <th>비밀번호*</th>
				                    <td>
					                    <input type="password" name="pass" id="pass" required="required" />
					                    <span class="val-msg">비밀번호를 입력해주세요(8자 이상)</span>
				                    </td>
				                </tr>
				                <tr>
				                    <th>비밀번호 확인*</th>
				                    <td>
				                    	<input type="password" name="pass1" id="pass1" required="required" />
					                    <span class="val-msg">비밀번호가 일치하지 않습니다.</span>
				                   	</td>
				                </tr>
				                <tr>
				                    <th>이메일*</th>
				                    <td>
				                    	<input type="email" name="email" id="email" required="required" />
					                    <span class="val-msg">이메일을 입력해주세요.</span>
					                    <span class="val-msg">중복된 이메일 입니다.</span>
				                    </td>
				                </tr>
				                <tr>
				                    <th>이름*</th>
				                    <td>
				                    	<input type="text" name="name" id="name" required="required" />
					                    <span class="val-msg">이름을 입력해주세요.</span>
				                    </td>
				                </tr>
				                <tr>
				                    <th>생년월일</th>
				                    <td><input type="date" name="birthDate" /></td>
				                </tr>
				                <tr>
				                    <th>전공</th>
				                    <td><input type="text" name="major" /></td>
				                </tr>
				                <tr>
				                    <th>간편 비밀번호</th>
				                    <td>
					                    <button type="button" onclick="Modal('#joinPatternPass')" class="fb-btn">간편비밀번호</button>
					                    
					                    <input type="hidden" name="patternPass">
							            <div class="form modal" id="joinPatternPass">
							                <h3 class="h2">더욱 손쉽게, 점점 스마트해지는 당신을 만나보세요 </h3>
							                <div id="simple-pass"> 
												<div id="joinPatternContainer"></div>
												<div class="simple-log-btn">
													<input type="button" id="joinPassConfirm" value="확인" />
													<input type="button" id="joinPassReset" value="초기화" />
													<input type="button" id="joinPassClose" value="닫기" />
												</div>
												<br />    
							                </div>
							                <div class="login-by-id" onclick="Modal('#patternPass')">아이디로 로그인하기</div>
							            </div>
		 				                <div id="patternMsg"></div>
									</td>
				                </tr>
				                <tr>
				                    <th>목표 한마디</th>
				                    <td><input type="text" name="goal" /></td>
				                </tr>
				                <tr>
				                    <th colspan="2">
				                        <button class="submit">Sign Up</button>
				                    </th>
				                </tr>
				            </table>
				</form>
            <!-- <button type="button" class="fb-btn">Join with <span>Google</span></button> -->
        </div>


        </div>
    </div>
    
 

<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<%-- <script src="<c:url value="/resources/user/js/login/patternLock.js"/>"></script> --%>
<script src="<c:url value="/resources/user/js/login/patternLock.min.js"/>"></script>
<%-- <script src="<c:url value="/resources/user/js/login/login3.js"/>"></script> --%>
<script>

window.onload = function() {
	  $('head').append('<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css"/>');	  
	  $('head').append('<link rel="stylesheet" type="text/css" href="/flyingturtle/resources/user/css/login/patternLock.css"/>');	  
};



</script>
