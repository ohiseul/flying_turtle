<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/menu.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/dictionary/list.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <script src="${pageContext.request.contextPath}/resources/user/js/jquery-3.3.1.js"></script>
</head>
<body>
  <div id="header"></div>
    <div class="item">
        <div id="subTitle"><span>용어사전</span></div>
        <div id="searchDiv">
       
         </div>
     </div>
     <div class="box">
       <div class="buttonList1">
         <ul class="buttonList">
           <li>
             <button class="sideMenu">JAVA</button>
             <ul class="dropdown">
               <li><button class="childMenu">IO</button></li>
               <li><button class="childMenu"> 반복문</button></li>
              </ul>
            </li>
            <li>
              <button class="sideMenu">JAVA</button>
              <ul class="dropdown">
                <li><button class="childMenu">IO</button></li>
                <li><button class="childMenu"> 반복문</button></li>
              </ul>
            </li>
            <li>
              <button class="sideMenu">JAVA</button>
              <ul class="dropdown">
                <li><button class="childMenu">IO</button></li>
                <li><button class="childMenu"> 반복문</button></li>
              </ul>
            </li>
          </ul> 
          <div class="buttonList1 content">
            <main>
              <div id='dic-title'><span >소과목 타이틀</span></div>
              <div id="editorjs"></div>
              <div class="btn-area">
                <button id="save-btn">저장</button>
              </div>
            </main>
          </div>
        </div>

      <!-- 누르면 top으로 돌아가게 -->
      <div id="position1"><a href ="#header"><i class="fas fa-chevron-circle-up"></i>   </a></div>
      <!--누르면 맨아래로 돌아가게  -->
      <div id="position2"><a href ="#footer"><i class="fas fa-chevron-circle-down"></i>   </a></div>
        
    </div>
    <div id="footer"></div>
  </div>

<!-- include -->
<!-- <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>  -->

<!-- EditorJS -->
<script src="https://cdn.jsdelivr.net/npm/@editorjs/editorjs@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/header@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/link@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/list@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/embed@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/raw@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/simple-image@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/checklist@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/quote@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/image@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/marker@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/table@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/warning@latest"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/dictionary/list.js"></script>
</body>
</html>