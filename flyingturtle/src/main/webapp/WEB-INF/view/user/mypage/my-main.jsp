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
        <img src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png" class="avatar img-circle img-thumbnail" alt="avatar">
        <h6>Flying Turtle</h6>
        <input type="file" class="text-center center-block file-upload">
      </div></hr><br>

               
          <div class="panel panel-default">
            <div class="panel-heading"> 박지수 <i class="fa fa-link fa-1x"></i></div>
            <div class="panel-body">2018/12/28~2019/06/28</div>
          </div>
          
          
          <ul class="list-group">
            <li class="list-group-item text-muted">활동 이력 <i class="fa fa-dashboard fa-1x"></i></li>
            <li class="list-group-item text-right"><span class="pull-left"><strong>작성 글</strong></span> 125</li>
            <li class="list-group-item text-right"><span class="pull-left"><strong>댓글단 글</strong></span> 13</li>
            <li class="list-group-item text-right"><span class="pull-left"><strong>질문 글</strong></span> 37</li>
            <li class="list-group-item text-right"><span class="pull-left"><strong>좋아요</strong></span> 78</li>
          </ul> 
          
                      
          
        </div><!--/col-3-->
    	<div class="col-sm-9">
            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#home">MyPage</a></li>
                <li><a data-toggle="tab" href="#messages">작성 글 </a></li>
                <li><a data-toggle="tab" href="#settings">작성 댓글</a></li>
                <li><a data-toggle="tab" href="#settings">질문글</a></li>
                <li><a data-toggle="tab" href="#settings">좋아요</a></li>
              </ul>

              
          <div class="tab-content">
            <div class="tab-pane active" id="home">
                <hr>
                
                <!-- My page -->
                  <form class="form" action="##" method="post" id="registrationForm">
                      <div class="form-group">
                          <div class="col-xs-6">
                              <label for="first_name"><h4>이름</h4></label>
                              <input type="text" class="form-control" name="first_name" id="first_name" placeholder="수정할 이름을 입력하세요">
                          </div>
                      </div>
                      
                      <div class="form-group">
                          <div class="col-xs-6">
                             <label for="mobile"><h4>핸드폰</h4></label>
                              <input type="text" class="form-control" name="mobile" id="mobile" placeholder="수정할 휴대번호를 입력하세요">
                          </div>
                      </div>
                      
                      <div class="form-group">
                          <div class="col-xs-6">
                              <label for="email"><h4>이메일</h4></label>
                              <input type="email" class="form-control" name="email" id="email" placeholder="수정할 이메일을 입력하세요" title="enter your email.">
                          </div>
                      </div>
                      
                      <div class="form-group">
                          <div class="col-xs-6">
                              <label for="email"><h4>전공</h4></label>
                              <input type="email" class="form-control" id="location" placeholder="수정할 전공을 입력하세요" title="enter a location">
                          </div>
                      </div>
                      
                      
                       <div class="form-group">
                          
                          <div class="col-xs-6">
                              <label for="password"><h4>비밀번호</h4></label>
                              <input type="password" class="form-control" name="password" id="password" placeholder="수정할 비밀번호를 입력하세요" title="enter your password.">
                          </div>
                      </div>
                      
                      <div class="form-group">
                          
                          <div class="col-xs-6">
                            <label for="password2"><h4>패턴 비밀번호</h4></label>
                              <input type="password" class="form-control" name="password2" id="password2" placeholder="수정할 패턴 비밀번호를 입력하세요" title="enter your password2.">
                          </div>
                      </div>
                      
                   
                      
                      <div class="form-group">
                           <div class="col-xs-12">
                                <br>
                              	<button class="btn btn-lg btn-success" type="submit"><i class="glyphicon glyphicon-ok-sign"></i> 수정</button>
                               	<button class="btn btn-lg" type="reset"><i class="glyphicon glyphicon-repeat"></i> 초기화</button>
                            </div>
                      </div>
              	</form>
              
              <hr>
              
             </div><!--/tab-pane-->
             
             
             
          <!-- 작성글 보기 -->
             <div class="tab-pane" id="messages">      
               <h2></h2> 
               <hr>
                  <form class="form" action="##" method="post" id="registrationForm">          
                              <div class="list"> 
                              	<div> <p>자바 공부 중입니당 </p></div>
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
             </div><!--/tab-pane-->
             
             
             <!-- 작성댓글 보기 -->
             <div class="tab-pane" id="settings">
                  <hr>
                    <!-- 작성 댓글 보기 -->
                  <form class="form" action="##" method="post" id="registrationForm">
                      <div class="list"> 
                              	<div> <p>자바 공부 중입니당2 </p></div>
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
               
               
                <!-- 작성댓글 보기 -->
             <div class="tab-pane" id="settings">
                  <hr>
                    <!-- 작성 댓글 보기 -->
                  <form class="form" action="##" method="post" id="registrationForm">
                      <div class="list"> 
                              	<div> <p>자바 공부 중입니당3 </p></div>
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
   
    


    
<script>
    $(document).ready(function() {

    
	var readURL = function(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('.avatar').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    	}
	}


	$(".file-upload").on('change', function(){
	    readURL(this);
		});
	});
    
    
</script>


</div>


<script src="<c:url value="/resources/user/js/mypage/my-main.js" />"></script>
