<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript"
	src="<c:url value="/resources/user/js/video/list.js"/>"></script>

<script>
$('head').append('<link rel="stylesheet" type="text/css" href="/flyingturtle/resources/user/css/video/listbootstrap.css">',
		'<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css" />',
		'<link rel="stylesheet" type="text/css" href="/flyingturtle/resources/user/css/video/list.css">'
		);
</script>


<div class="box">
	<div class="buttonList1">
		<ul class="buttonList" style="z-index: 9;">
			<li><img id="addButton"
				src="<c:url value="/resources/images/add.png"/>" /></li>
			<c:forEach var="sbj" items="${sbjList}">
				<li>
					<div class='sideMenu'>
						<input style="width: 116px; display: inline-block;" type='text'
							name='menu' class='menuInput' value="${sbj.subjectName}"
							data-sbjno="${sbj.subjectNo}" />
						<div style="width: 30px; display: inline-block; float: right;">
							<a style="color: #fff; z-index: 8;"
								href="<c:url value="/user/video/list.do?subjectNo=${sbj.subjectNo}"/>">go</a>
							<a style="color: #fff; z-index: 8;"
								href="<c:url value="/user/video/subjectdelete.do?subjectNo=${sbj.subjectNo}"/>">-</a>
						</div>
					</div>
				</li>
			</c:forEach>
		</ul>

		<div class="buttonList1 content">
			<div class="wrapper">
				<div class="container" style="width: 1100px;">
					<div class="col-sm-4" style="width: 120px; left: 700px;"; >
						<div class="show-row">
							<select class="form-control">
								<option value="1" selected="selected">최신순</option>
								<option value="2">인기순</option>
								<option value="3">조회수</option>
							</select>
						</div>
					</div>

					<table id="music" class="table table-responsive table-hover">
						<colgroup>
							<col style="width: 10%" />
							<col style="width: 0%" />
							<col style="width: 45%" />
							<col style="width: 15%" />
							<col style="width: 15%" />
							<col style="width: 15%" />
						</colgroup>
						<thead>
							<tr class="myHead">
								<th class="tdw2">글번호</th>
								<th class="tdw1"></th>
								<th>제목</th>
								<th class="tdw3">작성자</th>
								<th class="tdw3">등록일</th>
								<th>미리보기</th>
							</tr>
						</thead>
						<tbody id="listBox">
							<c:forEach var="list" items="${lists}">
								<tr data-url="" id="${list.videoNo}">
									<td class="tdcener">${list.videoNo}</td>
									<td><div class="thumb"></div></td>
									<td><a
										href='<c:url value="/user/video/detail.do?videoNo=${list.videoNo}"/>'>${list.title}</a></td>
									<td>${list.id}</td>
									<td><fmt:formatDate value="${list.regDate}"
											pattern="yyyy-MM-dd" /></td>
									<td><a href="javascript:void(0)"
										class="btn btn-info playBtn">Play</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- container 닫기 -->
			</div>
			<!-- wrapper 닫기 -->

			<!-- 비디오 미리보기 썸네일 -->
			<div class="video_box">
				<div class="video_inner">
					<div class="modal-close">&times;</div>
					<div class="video_body"></div>
				</div>
			</div>

		</div>
		<div class="submit">
			<a id="" onclick="givesubno();"><p class="write">등록</p></a>
		</div>
		<div class="page">
			<c:if test="${page.count != 0}">
				<jsp:include page="/WEB-INF/view/include/page.jsp">
					<jsp:param name="page" value="/flyingturtle/user/video/list.do" />
				</jsp:include>
			</c:if>
		</div>
	</div>
	<!-- listbody 닫기 -->
</div>

<script>
function givesubno(){
	var no = ${param.subjectNo} 
 	
 window.location.href="/flyingturtle/user/video/write.do?subjectNo="+no;
 }
 
 
$(window).on("load",function data() {
	 	 
	$.ajax({       
	 type:'POST',         
	 url : "/flyingturtle/user/video/listaddr.do",         
	success : function(data){       
		
	 for(var i =0; i<data.length;i++) { 
		 
	 var jbAry = data[i].videoAddr.split('/');         
	 var realurl = jbAry[jbAry.length-1];	                    
// 	  console.log("realurl:"+realurl);                     
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
