<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Examples</a></li>
        <li class="active">Blank page</li>
      </ol>  
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="box">
          <div class="item">
        <div id="subTitle">공지사항</div>
      </div>
      <div class="item2">
        <table>
          <tr>
            <th id="no">${detail.boardNo}</th>
            <th class="title"colspan="10">${detail.title}</th>
          </tr>
          <tr>
            <th style="text-align: center">조회</th>
            <td id="cnt">${detail.viewCnt}</td>
            <th colspan="6">작성자</th>
            <td id="writer">${detail.name}</td>
            <th style="width:8%">작성일</th>
            <td id="regDate"><fmt:formatDate value="${detail.regDate}" pattern="yyyy.MM.dd "/></td>
          </tr>
          <tr>
            <th><div style="text-align: center;">파일첨부</div></th>
           <td colspan="9">
            <!--   <div class="file"><a class="download" href=""><span>파일사진 </span><span>파일1.hwp</span></a></div>
              <div class="file"><a class="download" href=""><span>파일사진 </span><span>파일2.hwp</span></a></div>
              <div class="file"><a class="download" href=""><span>파일사진 </span><span>파일2.xlsx</span></a></div> -->
            </td>
            <td>              
         <!--      <div><button class="preview">바로보기</button></div>
              <div><button class="preview">바로보기</button></div>
              <div><button class="preview">바로보기</button></div> -->
            </td> 
          </tr>
        </table>
      </div>
        <div class="content">${detail.content}</div>
        
          <div class="list">    
          <button class="button" id="button1"><span class="button__inner">수정</span></button> 
          <button class="button" id="button2"><span class="button__inner">삭제</span></button> 
          <button class="button" id="button3"><span class="button__inner"><a href="<c:url value="/admin/notice/list.do"/>">목록</a></span></button> 
        </div>
      <br>
      <table>
        <tr>
          <th id="next">다음글</th>
          <td colspan="10" class="post"><a href="<c:url value="/admin/notice/detail.do?no=${detail.boardNo}"/>">${detail.title}</a></td>
        </tr>
        <tr>
          <th id="prev">이전글</th>
          <td colspan="10" class="post"><a href="#">이전글로 갑시다!!</a></td>
        </tr>
      </table>
      </div>
    </section>
    </div>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

 

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Create the tabs -->
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
      <li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>

      <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
      <!-- Home tab content -->
      <div class="tab-pane" id="control-sidebar-home-tab">
        <h3 class="control-sidebar-heading">Recent Activity</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-birthday-cake bg-red"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

                <p>Will be 23 on April 24th</p>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-user bg-yellow"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Frodo Updated His Profile</h4>

                <p>New phone +1(800)555-1234</p>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-envelope-o bg-light-blue"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Nora Joined Mailing List</h4>

                <p>nora@example.com</p>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-file-code-o bg-green"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Cron Job 254 Executed</h4>

                <p>Execution time 5 seconds</p>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

        <h3 class="control-sidebar-heading">Tasks Progress</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Custom Template Design
                <span class="label label-danger pull-right">70%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Update Resume
                <span class="label label-success pull-right">95%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-success" style="width: 95%"></div>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Laravel Integration
                <span class="label label-warning pull-right">50%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-warning" style="width: 50%"></div>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Back End Framework
                <span class="label label-primary pull-right">68%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-primary" style="width: 68%"></div>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

      </div>
      <!-- /.tab-pane -->
      <!-- Stats tab content -->
      <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
      <!-- /.tab-pane -->
      <!-- Settings tab content -->
      <div class="tab-pane" id="control-sidebar-settings-tab">
        <form method="post">
          <h3 class="control-sidebar-heading">General Settings</h3>

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Report panel usage
              <input type="checkbox" class="pull-right" checked>
            </label>

            <p>
              Some information about this general settings option
            </p>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Allow mail redirect
              <input type="checkbox" class="pull-right" checked>
            </label>

            <p>
              Other sets of options are available
            </p>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Expose author name in posts
              <input type="checkbox" class="pull-right" checked>
            </label>

            <p>
              Allow the user to show his name in blog posts
            </p>
          </div>
          <!-- /.form-group -->

          <h3 class="control-sidebar-heading">Chat Settings</h3>

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Show me as online
              <input type="checkbox" class="pull-right" checked>
            </label>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Turn off notifications
              <input type="checkbox" class="pull-right">
            </label>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Delete chat history
              <a href="javascript:void(0)" class="text-red pull-right"><i class="fa fa-trash-o"></i></a>
            </label>
          </div>
          <!-- /.form-group -->
        </form>
      </div>
      <!-- /.tab-pane -->
    </div>
  </aside>
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>

<!-- ./wrapper -->
<%@include file="../include/footer.jsp" %>
<%@include file="../include/script.jsp" %>
  <script>
  window.onload=function(){
  	$('head').append('<link rel="stylesheet" type="text/css" href="/flyingturtle/resources/admin/css/notice/detail.css">');
  	 CKEDITOR.replace( 'editor',{width:'100%',height:'1000px'} );
  }
  		var no = ${detail.boardNo};
  	$("#button2").click(function() {
  		let result = confirm("정말 삭제하시겠습니까?");
  		if(result){
  			location.href = "delete.do?no="+no;
  		}
  	});
 	$("#button1").click(function() {
  		let result = confirm("글 수정 페이지로 이동합니다.");
  		if(result){
  			location.href = "updateform.do?no="+no;
  		}
  	});
  	
  </script>
