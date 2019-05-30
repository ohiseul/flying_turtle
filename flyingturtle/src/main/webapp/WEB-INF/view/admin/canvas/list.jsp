<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!--                     <img src="/flyingturtle/resources/images/canvas/img/과목이름_날짜_시간_순서 (1).jpg" /> -->

        <div class="box">
                <div class="buttonList1">
                 <ul class="buttonList">
                   <li>
                     <img class="addButton" id="addButton"src="<c:url value="/resources/images/add.png"/>" />
                     <img class="Button" id="minusButton" src="<c:url value="/resources/images/minus.png"/>" />
                  </li>
                   
                  </ul> 
                </div>
                <div id = "mainBox">
                      <div class="buttonList1 content">
                        <main>
                              <div id='dic-title'></div>
                        </main>
                      </div>
                      <a href="<c:url value="/admin/canvas/canvas.do?ssbjNo=1"/>">그림판 이동</a>					    
					    <div class="article-list" id="article-list"></div>
					    <ul class="article-list__pagination article-list__pagination--inactive" id="article-list-pagination"></ul>              
        </div>
        </div>
<script type="text/javascript" src="<c:url value="/resources/admin/js/canvas/list.js"/>"></script>
<script>
function getPageId(n) {
    return 'article-page-' + n;
}
 
function getDocumentHeight() {
    const body = document.body;
    const html = document.documentElement;
    
    return Math.max(
        body.scrollHeight, body.offsetHeight,
        html.clientHeight, html.scrollHeight, html.offsetHeight
    );
};
 
function getScrollTop() {
    return (window.pageYOffset !== undefined) ? window.pageYOffset : (document.documentElement || document.body.parentNode || document.body).scrollTop;
}
 
function getArticleImage() {
    const hash = Math.floor(Math.random() * Number.MAX_SAFE_INTEGER);
    const image = new Image;
    image.className = 'article-list__item__image article-list__item__image--loading';
    image.src = 'http://api.adorable.io/avatars/250/' + hash;
    
    image.onload = function() {
        image.classList.remove('article-list__item__image--loading');
    };
    
    return image;
}
 
function getArticle() {
    const articleImage = getArticleImage();
    const article = document.createElement('article');
    article.className = 'article-list__item';
    article.appendChild(articleImage);
    
    return article;
}
 
function getArticlePage(page, articlesPerPage = 10) {
    const pageElement = document.createElement('div');
    pageElement.id = getPageId(page);
    pageElement.className = 'article-list__page';
    
    while (articlesPerPage--) {
        pageElement.appendChild(getArticle());
    }
    
    return pageElement;
}
 
function addPaginationPage(page) {
    const pageLink = document.createElement('a');
    pageLink.href = '#' + getPageId(page);
    pageLink.innerHTML = page;
    
    const listItem = document.createElement('li');
    listItem.className = 'article-list__pagination__item';
    listItem.appendChild(pageLink);
    
    articleListPagination.appendChild(listItem);
    
    if (page === 2) {
        articleListPagination.classList.remove('article-list__pagination--inactive');
    }
}
 
function fetchPage(page) {
    articleList.appendChild(getArticlePage(page));
}
 
function addPage(page) {
    fetchPage(page);
    addPaginationPage(page);
}
 
const articleList = document.getElementById('article-list');
const articleListPagination = document.getElementById('article-list-pagination');
let page = 0;
 
addPage(++page);
 
window.onscroll = function() {
    if (getScrollTop() < getDocumentHeight() - window.innerHeight) return;
    addPage(++page);
};

</script>