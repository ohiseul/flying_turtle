<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 
@keyframes checked-anim {
    50% {
        width: 3000px;
        height: 3000px;
    }
    100% {
        width: 100%;
        height: 100%;
        border-radius: 0;
    }
} */
@keyframes not-checked-anim {
    0% {
        width: 3000px;
        height: 3000px;
    }
}
*{
    margin:0 auto;
    padding:0;
    position: relative;
}


#menuBox li, #menuBox li > a {
    margin: 60px 0 -60px 0;
    /* 메뉴바 링크 글자 */
    color: black;
    font: 14pt "Roboto", sans-serif;
    font-weight: 700;
    line-height: 1.8;
    text-decoration: none;
    text-transform: none;
    list-style: none;
    outline: 0;
}
#menuBox li {
    display: none;
    position: relative;
    top:-60px;
    cursor:pointer;
    width: 200px;
    height:40px;
    text-indent: 26px;
    z-index: 10;
    transition: all 0.3s;
}

#menuBox{
    position: absolute;
    top:60px;
    height: 1100px;
    background-color: rgba(125, 201, 236,0.95);
    z-index : 999;
}
#menuBox li>a:hover{
    background-color:#477abd;
    padding-left:25px;
    color: white;
    transition: 0.7s;
}
#menuBox li>a:focus {
    display: block;
    color: #333;
    background-color: #eee;
}

/* 헤더부분 */
#header {
    height:60px;
    width:1250px;
    background: white;
}
#logo{
    display: inline;
}
#logo>img{
position: relative;
top:15px;
    float: right;
height: 30px;
}

#body{
    width:1250px;
   /* width:1050px; 
    position: relative;
    left:100px;*/
}


body {
    margin: 0 auto;
    padding: 0;
    background-color:  #F4F5F7;
    font-family: 'Roboto', sans-serif;
    width:1250px;
}

#trigger, #burger, #burger:before, #burger:after {
    position: absolute;
    top: 15px;
    left: 15px;
    /* 화살표색 */
    background: rgb(0, 0, 0);
    width: 30px;
    height: 5px;
    transition: .2s ease;
    cursor: pointer;
    z-index: 1;
}
#trigger {
    height: 25px;
    background: none;
}
#burger:before {
    content: " ";
    top: 10px;
    left: 0;
}
#burger:after {
    content: " ";
    top: 20px;
    left: 0;
}
#menu-toggle:checked + #trigger + #burger {
    top: 35px;
    transform: rotate(180deg);
    transition: transform .2s ease;
}
/* 화살표 위 */
#menu-toggle:checked + #trigger + #burger:before {
    width: 20px;
    top: -2px;
    left: 18px;
    transform: rotate(45deg) translateX(-5px);
    transition: transform .2s ease;
}
/* 화살표 아래 */
#menu-toggle:checked + #trigger + #burger:after {
    width: 20px;
    top: 2px;
    left: 18px;
    transform: rotate(-45deg) translateX(-5px);
    transition: transform .2s ease;
}
/* 버튼크기? */
#menu {
    position: absolute;
    margin: 0; padding: 0;
    width: 60px;
    height: 60px;
 
    background-color: #fff;
    border-bottom-right-radius: 30%;
    box-shadow: 0 2px 5px rgba(0,0,0,0.26);
    animation: not-checked-anim .2s both;
    transition: .2s;
}
/* #menu-toggle:checked + #trigger + #burger + #menu {
    animation: checked-anim 1s ease both;
} */
#menu-toggle:checked + #trigger ~ #menu li, .menubar {
    display: block;
}
[type="checkbox"]:not(:checked), [type="checkbox"]:checked {
    display: none;
}
</style>
</head>
<body>
  <div id="logo">	<img src="../../resources/images/logo.png"/></div>

    <input type="checkbox" id="menu-toggle"/>
    <label id="trigger" for="menu-toggle"></label>
    <label id="burger" for="menu-toggle"></label>
    <ul id="menu">
      <div id="menuBox">
        <li><a class="menubar" href="#">로그아웃</a></li>
        <li><a class="menubar" href="#">공지사항</a></li>
        <li><a class="menubar" href="#">마이페이지</a></li>
        <li><a class="menubar" href="#">출석</a></li>
      </div>
    </ul>
</body>
</html>