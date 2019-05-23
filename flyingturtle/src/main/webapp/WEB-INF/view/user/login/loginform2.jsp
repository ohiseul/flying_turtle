<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="cont">
        <div class="form sign-in">
        <h2>반갑습니다.</h2>
        <form id="login-form" method="post" action="<c:url value="/user/login/login.do"/>">
        <table class="login-table">
            <tr>
                <th>
                   <input type="text" name="id" placeholder="아이디"/>
                   <span class="val-msg">아이디를 입력하세요.</span>
                </th>
            </tr>
            <tr>
                <th>
                    <input type="password" name="pass" placeholder="비밀번호"/>
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
            <div class="form modal" id="patternPass">
                <h3 class="h2">더욱 손쉽게, 점점 스마트해지는 당신을 만나보세요</h3>
                <div id="simple-pass"></div>
                <div class="login-by-id" onclick="Modal('#patternPass')">아이디로 로그인하기</div>
            </div>

        <div class="logo"><img src="<c:url value="/resources/user/images/String_logo.png"/>"/></div>
        </div>

    </div>
