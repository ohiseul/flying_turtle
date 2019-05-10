<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/login/login.css"/>">
    <script src="<c:url value="/resources/js/jquery-3.3.1.js"/>"></script>
    <script src="<c:url value="/resources/js/plugin/notify.js"/>"></script>
    
</head>
<body>
    <div class="header"></div>
    <div class="cont">

        <div class="form sign-in">
        <h2 class="h2">반갑습니다.</h2>
        
        <form name="form" action="${pageContext.request.contextPath}/login/login.do" method="post">
        <table class="login-table">
            <tr>
                <th>
                    <input name="id" placeholder="아이디"/>
                </th>
            </tr>
            <tr>
                <th>
                    <input type="password" name="pass" placeholder="비밀번호"/>
                </th>
            </tr>
            <tr>
                <td colspan="2">
                    <button type="submit" class="submit">로그인</button>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <button type="button" class="fb-btn">간편로그인</button>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <div class="forgot-pass">비밀번호를 잊어버리셨나요?</div>
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
                            <button type="button" class="submit" id="quit">돌아가기</button>
                        </td>
                    </tr>
                </table>
            </div>
            
            <!-- modal -->
            <div class="form modal">
                <h3 class="h2">더욱 손쉽게, 점점 스마트해지는 당신을 만나보세요</h3>
                <div id="simple-pass"></div>
                <div class="login-by-id">아이디로 로그인하기</div>
            </div>
                       
        <div class="logo"><img src="<c:url value="/resources/images/String_logo.png"/>"></div>
        </div>

        <!-- 사진 -->
        <div class="sub-cont">
        <div class="img" style='background : url("<c:url value="/resources/images/turtle201.jpg"/>");'>
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
            <h2 class="h2">당신의 위대한 첫걸음,</h2>
<form name="form" action="<c:url value="/member/signUp.do"/>" method="post">
            <table style="margin : 0 auto;">
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
            <table class='form-table'>
                <tr>
                    <th>아이디</th>
                    <td><input type="text" name="id" id="id" /></td>
                </tr>
                <tr>
                    <th>비밀번호</th>
                    <td><input type="password" name="pass" id="pass"/></td>
                </tr>
                <tr>
                    <th>비밀번호 확인</th>
                    <td><input type="password" name="pass1" id="pass1" /></td>
                </tr>
                <tr>
                    <th>이름</th>
                    <td><input type="text" name="name" id="name"/></td>
                </tr>
                <tr>
                    <th>생년월일</th>
                    <td><input type="date" name="birthDate" /></td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td><input type="email" name="email" id="email" /></td>
                </tr>
                <tr>
                    <th>간편 비밀번호</th>
                    <td><input type="password" name="patternPass" /></td>
                </tr>
                <tr>
                    <th>목표 한마디</th>
                    <td><input type="text" name="goal" /></td>
                </tr>
                <tr>
                    <th colspan="2">
                        <button type="button" onclick="checkForm()" class="submit">Sign Up</button>
                    </th>
                </tr>
            </table>
</form>
            <!-- <button type="button" class="fb-btn">Join with <span>Google</span></button> -->
        </div>


        </div>

        
    </div>
    
    
<script src="<c:url value="/resources/js/login/login.js"/>"></script>    
</body>
</html>