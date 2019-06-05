<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 사이드 메뉴 바 =================================================================== -->
<div class="body">

<hr>
<div class="container bootstrap snippet">
    <div class="row">
  		<div class="col-sm-10"><h1>MY PROFILE</h1></div>
    </div>
    <div class="row">
  		<div class="col-sm-3"><!--left col-->
              
      <div class="text-center">
        <img src="<c:url value="/resources/images/turtle(1).png"/>" class="avatar img-circle img-thumbnail" alt="avatar">
        <h6>Flying Turtle</h6>
      </div>
 </hr><br>

               
          <div class="panel panel-default">
            <div class="panel-heading"><p>Student id &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</p> &nbsp;${list.id}</div>
            <div class="panel-body"><p>Student name :</p> &nbsp;${list.name}</div>
          </div>
          
          
          <ul class="list-group">
            <li class="list-group-item text-muted">활동 이력 <i class="fa fa-dashboard fa-1x"></i></li>
            <li class="list-group-item text-right" id="hello"><span class="pull-left"><strong>작성 글</strong></span><p class="countWrite"><p></li>
            <li class="list-group-item text-right"><span class="pull-left"><strong>댓글단 글</strong></span><p class="countCom"></p></li>
          </ul> 
          
                      
          
        </div><!--/col-3-->
    	<div class="col-sm-9">
            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#home">MyPage</a></li>
                <li class="write"><a data-toggle="tab" href="#messages">작성 글 </a></li>
                <li class="comment"><a data-toggle="tab" href="#settings">작성 댓글</a></li>
                <li><img src="<c:url value="/resources/user/images/turtle(7).png"/>"></li>
              </ul>
              
          <div class="tab-content">
            <div class="tab-pane active" id="home">
                <hr>               
                <!-- My page -->
              
                  <form class="form" action="<c:url value="/user/mypage/infoUpdate.do"/>" method="post" id="registrationForm">
                  <input type="hidden" name="memberNo" value="${sessionScope.user.memberNo}">
                      <div class="form-group">
                          <div class="col-xs-6">
                              <label for="name"><h4>이름</h4></label>
                              <input type="text" class="form-control" name="name" id="first_name" onfocus="this.value=''; return true" value="${list.name}" placeholder="${list.name}">
                          </div>
                      </div>
                    
                      <div class="form-group">
                          <div class="col-xs-6">
                              <label for="email"><h4>이메일</h4></label>
                              <input type="email" class="form-control" name="email" id="email" onfocus="this.value=''; return true" value="${list.email}" placeholder="${list.email}">
                          </div>
                      </div>
                      
                      <div class="form-group">
                          <div class="col-xs-6">
                              <label for="major"><h4>전공</h4></label>
                              <input type="text" class="form-control" name="major" id="major" onfocus="this.value=''; return true" value="${list.major}" placeholder="${list.major}">
                          </div>
                      </div>
                      
                      
                       <div class="form-group">
                          <div class="col-xs-6">
                              <label for="password"><h4>비밀번호</h4></label>
                              <input type="password" class="form-control" name="pass" id="pass" onfocus="this.value=''; return true" value="${list.pass}" placeholder="수정할 비밀번호를 입력하세요">
                          </div>
                      </div>
                      
                      <div class="form-group">
                          <div class="col-xs-6">
                            <label for="password2"><h4>패턴 비밀번호</h4></label>
                            <input type="hidden" id="patternPass" name="patternPass" value="${list.patternPass}"/>
							<div id="patternContainer"></div>
                          </div>
                      </div>
                      
                      <div class="form-group">
                           <div class="col-xs-12">
                                <br>
                              	<button class="btn btn-lg btn-success" type="submit"><i class="glyphicon glyphicon-ok-sign"></i>수정</button>
                               	<button class="btn btn-lg" type="reset"><i class="glyphicon glyphicon-repeat"></i>초기화</button>
                            </div>
                      </div>
              	</form>
              
              <hr>
              
             </div><!--/tab-pane-->
             
             
             
          <!-- 작성글 보기 -->
             <div class="tab-pane" id="messages">      
             <hr>
                              <div class="writelist">           
                              </div>
                              <table class="tbl paginated" id="tbl">
								</table>
             </div><!--/tab-pane-->
             
             
             <!-- 작성댓글 보기 -->
             <div class="tab-pane" id="settings">
                  <hr>
                      <div class="commentlist">   
                      </div>
					 <table class="comment paginated" id="comment">
					</table>
             </div> <!--/tab-pane-->
               
               
             
             <!-- 좋아요 보기 -->
             <div class="tab-pane" id="like">
                  <hr>
                    <!-- 작성 댓글 보기 -->
                  <form class="form" action="##" method="post" id="registrationForm">
                      <div class="list"> 
                              	<div> <p>자바 공부 중입니당4! </p></div>
                              	<div> <p>강의 동영상 참고하세요~</p></div>
                              	<div> <p>어렵네요 강의가..</p></div>
                              	<div> <p>여러분 모두 어쩌고 </p></div>
                              	<div> <p>자바 공부 중입니당</p></div>
                              	<div> <p>강의 동영상 참고하세요~</p></div>
                              	<div> <p>어렵네요 강의가..</p></div>
                              	<div> <p>여러분 모두 어쩌고 </p></div>
                              	<div> <p>강의 참고 2 </p></div>
                              	<div> <p>강의 참고 3 </p></div>                          
                       </div>
					 <div class="page">
						<span>[1]</span> <span>[2]</span> <span>[3]</span>
					 </div>
              	</form>
             </div> <!--/tab-pane-->
             
                  
               
          </div><!--/tab-content-->

        </div><!--/col-9-->
    </div><!--/row-->
                      
</div><!--/body-->
 
</div>


<script src="<c:url value="/resources/user/js/mypage/my-main.js" />"></script>
<script src="<c:url value="/resources/user/js/login/patternLock.min.js"/>"></script>

<script>
	$(document).ready(function() {
		
		/* 작성글,작성댓글 갯수 보이기*/
		var writeSum = ${writeVid} + ${writeQna};
		var comSum = ${comVid} + ${comQna};
		$(".countWrite").text(writeSum);
		$(".countCom").text(comSum);
				
		
		lock = new PatternLock('#patternContainer');

		$("#reset").click(function () {
			lock.reset();
		});
		$("#lock").click(function () {
			lock.disable();
		});
		$("#unlock").click(function () {
			lock.enable();
		});
		
		$('#patternContainer').mouseup(function () {
			var patVal = lock.getPattern();
			if(lock.getPattern().length<6) {
				swal(
					"6개 이상 선택하세요!",{
						buttons: false,
						timer : 2000
				});
				return;
			}
			$("#patternPass").val(patVal);
		});
	});
</script>
