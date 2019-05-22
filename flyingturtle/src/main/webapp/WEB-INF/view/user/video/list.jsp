<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id="top_header"></div>
             
      <div class="item">
          <div id="subTitle">동영상</div>
          <div>
            <form class="search" action="list.do"><span></span>
          	  <select id="searchType" name="searchType">
          		<option value="title">제목</option>
          		<option value="name">작성자</option>
        	  </select>
              <input id="search" type="text" name="keyword" placeholder="검색어를 입력하세요." autocomplete="off" required="required"/>
              <button id="searchButton">&#128270;</button>
            </form>
            <div id="listCnt">전체 게시물 ${page.count}개</div>
          
          </div> 
      </div>
  <div class="wrapper">
    <div class="container">
              <div class="filter">
                <div class="row">
                  <div class="col-sm-4">
                    <div class="show-row" >
                      <select class="form-control">
                        <option value="1" selected="selected">최신순</option>
                        <option value="2">인기순</option>
                        <option value="3">조회수</option>
                      </select>
                    </div>
                  </div>
                </div>
              </div>
              
              <table id="music" class="table table-responsive table-hover">
                <thead>
                  <tr  class="myHead">
                    <th>글번호</th>
                    <th></th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>등록일</th>
                    <th>미리보기</th>
              </tr>
            </thead>
            <tbody id="listBox">
             <c:forEach var="list" items="${lists}">
                 <tr data-url="" id="${list.videoNo}">
	                <td>${list.videoNo}</td>
	                <td><div class="thumb"></div></td>
	                <td><a href='<c:url value="/user/video/detail.do?videoNo=${list.videoNo}"/>'>${list.title}</a></td>
	                <td>${list.memberNo}</td>
	                <td>${list.regDate}</td>
	                <td><a href="javascript:void(0)" class="btn btn-info playBtn">Play</a></td>
				 </tr> 
			</c:forEach>	 
            </tbody>
          </table>
                
        </div>
        
      </div>
          <div class="video_box">
            <div class="video_inner">
              <div class="modal-close">&times;</div>
              <div class="video_body">
                
              </div>
            </div>
          </div>
 <a href="/flyingturtle/user/video/write.do" >등록</a>
 
    <div class="page">
            <c:if test="${page.count != 0}">
			<jsp:include page="/WEB-INF/view/include/page.jsp">
				<jsp:param name="page" value="/flyingturtle/user/video/list.do" />
			</jsp:include>
			</c:if>
   	</div>  
 <script>
$(document).ready(function data() {
	 $.ajax({
            type:'POST',
            url : "/flyingturtle/user/video/listaddr.do?pageNo="+${page.pageNo},
            success : function(data){
                for(var i =0; i<data.length;i++){
                    var jbAry = data[i].videoAddr.split('/');
                    var realurl = jbAry[jbAry.length-1];	
                    $("#"+data[i].videoNo).attr("data-url",realurl);
                }
        		$('#music tbody tr').addClass('list');
        		$('.list').each(function() {
        			var youtube_video_id   =   $(this).attr('data-url');
        			if (youtube_video_id.length == 11) {
        				var video_thumbnail = $('<img src="https://i.ytimg.com/vi/'+ youtube_video_id +'/hqdefault.jpg" class="img-responsive">');
        				$(this).find('.thumb').append(video_thumbnail);
        			}      
        			var jd   =   $(this).index()+1
        			$(this).find('td').eq(0).text(jd);
        		});
            }
        });
});
 
 </script>	          
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script> 
<script  src="<c:url value="/resources/user/js/jquery-3.3.1.js"/>" ></script>
<script type="text/javascript" src="<c:url value="/resources/user/js/video/list.js"/>"></script>