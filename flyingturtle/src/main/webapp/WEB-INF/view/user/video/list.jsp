<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id="top_header"></div>
  <div class="wrapper">
    <div class="container">
              <div class="filter">
                <div class="row">
                  <div class="col-sm-4">
                    <div class="show-row">
                      <select class="form-control">
                        <option value="#" selected="selected">최신순</option>
                        <option value="#">인기순</option>
                        <option value="#">조회수</option>
                      </select>
                    </div>
                  </div>
                  <div class="col-sm-4"></div>
                  <div class="col-sm-4">
                    <div class="search-row">
                      <input type="text" name="search" class="form-control" placeholder="Enter your keyword">
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
                 
            </tbody>
          </table>
          
          <div class="text-center controller">
            <ul class="pagination"></ul>
            <ul class="pager">
            <li ><a href="javascript:void(0)" class="prev">Previous</a></li>
            <li><a href="javascript:void(0)" class="next">Next</a></li>
            </ul>
          </div>
        
      
        </div>
        
      </div>
          <div class="video_box">
            <div class="video_inner">
              <div class="modal-close">&times;</div>
              <div class="video_body">
                
              </div>
            </div>
          </div>
                          
     <script src="//code.jquery.com/jquery-1.11.0.min.js"></script> 
       <script  src="<c:url value="/resources/user/js/jquery-3.3.1.js"/>" ></script>
<script type="text/javascript" src="<c:url value="/resources/user/js/video/list.js"/>"></script>