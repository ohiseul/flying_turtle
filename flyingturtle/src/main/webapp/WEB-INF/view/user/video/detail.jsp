<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script  src="<c:url value="/resources/user/js/jquery-3.3.1.js"/>" ></script>
<script>
    $('head').append('<link rel="stylesheet" type="text/css" href="/flyingturtle/resources/admin/css/dictionary/list.css">'+
	 		  '<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">'+
	          '<link rel="stylesheet" type="text/css" href="/flyingturtle/resources/user/css/video/detail.css"/>'+
            '<link rel="stylesheet" href="/flyingturtle/resources/user/css/video/subject.css">');
</script>
<div id="top_header"></div>

 <div class="box">
  	<div class="buttonList1">
		<ul class="buttonList">
         	<li>
         	<c:forEach var="sbj" items="${sbjList}">
				<div class='sideMenu'>
					<input type='text' name ='menu' class='menuInput' value="${sbj.subjectName}" data-sbjno="${sbj.subjectNo}" />
				</div>
			</c:forEach>
			</li>
       	</ul>
   	</div>                        
                         <div class="wrapper">
                      
                                <div class="componentWrapp">

                                        <!-- Time Line -->
                                        <div class="timelineWrapp">
                                
                                          <!-- Opener -->
                                          <div class="opener">
                                            <div class="fader"></div>
                                                <div class="inners">
                                                    <h1>${detail.title}</h1>
                                                    <p>${detail.memberNo}</p>
                                                    <button class="startCTA">상세보기
                                                            <svg width="9px" height="11px" viewBox="0 0 9 11" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                                                <desc>${detail.title}</desc>
                                                                <g id="Connect-Domain---Interactive-Video" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd" stroke-linecap="round" stroke-linejoin="round">
                                                                    <g id="Interactive-Video-/-First-Screen" transform="translate(-175.000000, -472.000000)" stroke="#FFFFFF" stroke-width="2" fill="#FFFFFF">
                                                                        <g id="Stacked-Group" transform="translate(60.000000, 186.000000)">
                                                                            <g id="Left-Card---Timeline">
                                                                                <g id="Opener">
                                                                                    <g id="Opener-Inners" transform="translate(42.000000, 121.000000)">
                                                                                        <g id="Button" transform="translate(0.000000, 149.000000)">
                                                                                            <g id="Group-2" transform="translate(30.000000, 9.000000)">
                                                                                                <polygon id="Shape" points="44 8 51 12.4545455 44 16.9090909"></polygon>
                                                                                            </g>
                                                                                        </g>
                                                                                    </g>
                                                                                </g>
                                                                            </g>
                                                                        </g>
                                                                    </g>
                                                                </g>
                                                            </svg>
                                                    </button>
                                                </div>
                                          </div>
                                          <!-- Opener - End -->
                                  
                        <!-- Steps Wrapp -->
                        <div class="stepsWrapp">
                                <!-- Step #1 -->
                                <div class="step step1">
                                    <div class="title">
                                        <!-- 1 : 첫번째 게시물 페이지 30: 마지막 게시물 페이지 번호-->
                                        <!--<div class="icon"><span>1<sup>/30</sup></span></div>-->
                                        <!-- span:  과목명 보이기 -->
                                        <div class="icon"><span>${detail.subjectNo}</span></div>
                                        <!-- 글 제목 : step title h3-->
                                        <h3>${detail.title}</h3>
                                    </div>
                                    <div class="details">
                                        <p>${detail.content}</p>
                                    </div>
                                </div>
                                <!-- Step #1 - End -->
                        </div>
                        <!-- Steps Wrapp - End -->          
                    </div>
             <!-- Time Line - End -->
                                  

                                          <!-- Video -->
                                          <div class="videoWrapp">
                                            <span class="videoCover videoCoverStart"><div>
                                  
                                            <svg width="86px" height="86px" viewBox="0 0 86 86" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                            <defs>
                                                <circle id="path-1" cx="38" cy="38" r="38"></circle>
                                                <filter x="-9.2%" y="-7.9%" width="118.4%" height="118.4%" filterUnits="objectBoundingBox" id="filter-2">
                                                    <feMorphology radius="0.5" operator="dilate" in="SourceAlpha" result="shadowSpreadOuter1"></feMorphology>
                                                    <feOffset dx="0" dy="1" in="shadowSpreadOuter1" result="shadowOffsetOuter1"></feOffset>
                                                    <feMorphology radius="1" operator="erode" in="SourceAlpha" result="shadowInner"></feMorphology>
                                                    <feOffset dx="0" dy="1" in="shadowInner" result="shadowInner"></feOffset>
                                                    <feComposite in="shadowOffsetOuter1" in2="shadowInner" operator="out" result="shadowOffsetOuter1"></feComposite>
                                                    <feGaussianBlur stdDeviation="2" in="shadowOffsetOuter1" result="shadowBlurOuter1"></feGaussianBlur>
                                                    <feColorMatrix values="0 0 0 0 0.0862745098   0 0 0 0 0.176470588   0 0 0 0 0.239215686  0 0 0 0.68 0" type="matrix" in="shadowBlurOuter1"></feColorMatrix>
                                                </filter>
                                                <polygon id="path-3" points="32 30 46 38.9090909 32 47.8181818"></polygon>
                                                <filter x="-53.6%" y="-36.5%" width="207.1%" height="184.2%" filterUnits="objectBoundingBox" id="filter-4">
                                                    <feMorphology radius="1" operator="dilate" in="SourceAlpha" result="shadowSpreadOuter1"></feMorphology>
                                                    <feOffset dx="0" dy="1" in="shadowSpreadOuter1" result="shadowOffsetOuter1"></feOffset>
                                                    <feGaussianBlur stdDeviation="2" in="shadowOffsetOuter1" result="shadowBlurOuter1"></feGaussianBlur>
                                                    <feComposite in="shadowBlurOuter1" in2="SourceAlpha" operator="out" result="shadowBlurOuter1"></feComposite>
                                                    <feColorMatrix values="0 0 0 0 0.0862745098   0 0 0 0 0.176470588   0 0 0 0 0.239215686  0 0 0 0.68 0" type="matrix" in="shadowBlurOuter1"></feColorMatrix>
                                                </filter>
                                            </defs>
                                      <g id="Connect-Domain---Interactive-Video" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                          <g id="Interactive-Video-/-First-Screen" transform="translate(-803.000000, -344.000000)">
                                              <g id="Stacked-Group" transform="translate(60.000000, 186.000000)">
                                                  <g id="Right-Card---Video-" transform="translate(408.000000, 0.000000)">
                                                      <g id="Video-Cover">
                                                          <g id="Big-Play" transform="translate(333.000000, 162.000000)">
                                                              <g id="Video-Controls-/-Play" transform="translate(7.000000, 0.000000)">
                                                                  <g id="Play-Icon">
                                                                      <g id="Oval">
                                                                          <use fill="black" fill-opacity="1" filter="url(#filter-2)" xlink:href="#path-1"></use>
                                                                          <use stroke="#FFFFFF" stroke-width="1" xlink:href="#path-1"></use>
                                                                      </g>
                                                                      <g id="Shape" stroke-linecap="round" stroke-linejoin="round">
                                                                          <use fill="black" fill-opacity="1" filter="url(#filter-4)" xlink:href="#path-3"></use>
                                                                          <use stroke="#FFFFFF" stroke-width="2" fill="#FFFFFF" fill-rule="evenodd" xlink:href="#path-3"></use>
                                                                      </g>
                                                                  </g>
                                                              </g>
                                                          </g>
                                                      </g>
                                                  </g>
                                              </g>
                                          </g>
                                      </g>

                                 <!--재생시간-->
                                  </svg><p id="playAddr" value="${detail.videoAddr}">${detail.videoAddr}</p></div></span>
                                  
                                            <span class="videoCover videoCoverEnd">
                                              
                                              <div class="replayVideo">
                                  
                                  <svg width="86" height="86" viewBox="0 0 86 86" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><defs><ellipse id="b" cx="37.905" cy="37.977" rx="37.905" ry="37.977"/><filter x="-9.2%" y="-7.9%" width="118.5%" height="118.4%" filterUnits="objectBoundingBox" id="a"><feMorphology radius=".5" operator="dilate" in="SourceAlpha" result="shadowSpreadOuter1"/><feOffset dy="1" in="shadowSpreadOuter1" result="shadowOffsetOuter1"/><feMorphology radius="1" in="SourceAlpha" result="shadowInner"/><feOffset dy="1" in="shadowInner" result="shadowInner"/><feComposite in="shadowOffsetOuter1" in2="shadowInner" operator="out" result="shadowOffsetOuter1"/><feGaussianBlur stdDeviation="2" in="shadowOffsetOuter1" result="shadowBlurOuter1"/><feColorMatrix values="0 0 0 0 0.0862745098 0 0 0 0 0.176470588 0 0 0 0 0.239215686 0 0 0 0.68 0" in="shadowBlurOuter1"/></filter><path d="M28 31.895v5.368h5.368m-3.122 4.474c1.192 3.383 4.477 5.57 8.058 5.363 3.58-.206 6.593-2.755 7.39-6.252.795-3.497-.818-7.1-3.957-8.834-3.14-1.736-7.047-1.186-9.585 1.348L28 37.262" id="d"/><filter x="-41.4%" y="-39.7%" width="182.7%" height="191.9%" filterUnits="objectBoundingBox" id="c"><feMorphology radius=".9" operator="dilate" in="SourceAlpha" result="shadowSpreadOuter1"/><feOffset dy="1" in="shadowSpreadOuter1" result="shadowOffsetOuter1"/><feMorphology radius="1" in="SourceAlpha" result="shadowInner"/><feOffset dy="1" in="shadowInner" result="shadowInner"/><feComposite in="shadowOffsetOuter1" in2="shadowInner" operator="out" result="shadowOffsetOuter1"/><feGaussianBlur stdDeviation="2" in="shadowOffsetOuter1" result="shadowBlurOuter1"/><feColorMatrix values="0 0 0 0 0.0862745098 0 0 0 0 0.176470588 0 0 0 0 0.239215686 0 0 0 0.68 0" in="shadowBlurOuter1"/></filter></defs><g fill="none" fill-rule="evenodd"><g transform="translate(5 4)"><use fill="#000" filter="url(#a)" xlink:href="#b"/><use stroke="#FFF" xlink:href="#b"/></g><g stroke-linecap="round" stroke-linejoin="round" transform="translate(5 4)"><use fill="#000" filter="url(#c)" xlink:href="#d"/><use stroke="#FFF" stroke-width="1.8" xlink:href="#d"/></g></g></svg><p>Replay Video</p></div></span>
                                  
                                            <span class="counter counter1">
                                               <p>18<small>sec</small></p>
                                  <svg width="50px" height="50px" viewBox="0 0 50 50" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                      <g id="#Basic2Basic---Grace-Period" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd" stroke-linecap="round" stroke-linejoin="round">
                                          <g id="Artboard-Copy-6" transform="translate(-514.000000, -492.000000)" stroke="#FFFFFF" stroke-width="2">
                                              <g id="Countdown" transform="translate(515.000000, 493.000000)">
                                                  <circle id="countCircle" cx="24" cy="24" r="24"></circle>
                                              </g>
                                          </g>
                                      </g>
                                  </svg>
                                          </span>
                                  
                                            <!-- Steps Covers -->
                                  
                                            <!-- Step Cover #1 -->
                                            <div class="stepCover step2Cover">
                                              <h3>Paso 1 Dibuja</h3>
                                              <hr>
                                              <!-- <p>Click Next Step when you're ready for step 2</p> -->
                                              <div class="actionRow">
                                                <button class="hollow replayStepBtn">Replay
                                  <svg width="15px" height="20px" viewBox="0 0 22 20" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                      <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd" stroke-linecap="round" stroke-linejoin="round">
                                          <g id="rotate-ccw" transform="translate(1.000000, 1.000000)" stroke="#FFFFFF" stroke-width="2">
                                              <polyline id="Shape" points="0 1 0 7 6 7"></polyline>
                                              <path d="M2.51,12 C3.8420064,15.780717 7.5138392,18.2247974 11.5157152,17.9944702 C15.5175912,17.764143 18.8847697,14.9149336 19.7742205,11.0063611 C20.6636713,7.09778853 18.8609726,3.07210066 15.3528343,1.13276378 C11.844696,-0.806573096 7.47683228,-0.192038964 4.64,2.64 L0,7" id="Shape"></path>
                                          </g>
                                      </g>
                                  </svg></button>
                                              
                                              </div>
                                  
                                            </div>
                                            <!-- Step Cover #1 - End -->
                                            <!-- Steps Covers - End -->
                                  
                                            <div id="player" class="player"> </div>
                                  				
                                            <div class="playerPb"></div>
                                          </div>
                                          <!-- Video - End -->
                                        </div>
                                    

    <!-- 댓글 -->
    
        <div class="commentbody">
                        <form id="commentForm" name="commentForm" method="post">
                        <input type="hidden" id="videoNo" name="videoNo" value="${detail.videoNo}" />        
                        <br><br>
                            <div>
                                <div>
                                    <span><strong>Comments</strong></span> <span id="cCnt"></span>
                                </div>
                                <div>
                                    <table class="table">                    
                                        <tr>
                                            <td>
                                                <textarea style="width: 990px; height: 70px;  background : #f9f9f9;" id="commtextarea" name="content" placeholder="댓글을 입력하세요"></textarea>
                                                
                                                <div id="commentinputbutton">
                                                   <a href='#' onClick="fn_comment();" id="comminsert">등록</a>
                                                </div>
                                                
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </form>
     
     
                    <div class="container">
                        <div id="commentList">
                       </div>
                    </div>
        </div>
        
		<br><br>
        <div class="submit">
            <button><a href="<c:url value="/user/video/updateform.do?videoNo=${detail.videoNo}"/>">수정</a></button>
            <button><a href="<c:url value="/user/video/delete.do?videoNo=${detail.videoNo}"/>">삭제</a></button>
            <button><a href="<c:url value="/user/video/list.do"/>">목록</a></button>            
        </div>
        <br><br><br><br>
    	
    	<div class="thumbvar">미리보기</div>
        <div class="thumbody" data-url="" id="${details.videoNo}">
              <div id="inputvideo"></div>
        </div>
        	
       <!--thumbody END-->
           
       <!-- 확인용 div -->
       <div class="test">
    
       
       </div>
    	</div>
    <!--wrapper END-->
 </div>
<!--BOX END-->
 

    <script>
    var tag = document.createElement("script");

    tag.src = "https://www.youtube.com/iframe_api";
    var firstScriptTag = document.getElementsByTagName("script")[0];
    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

    var player;

    			
	function onYouTubeIframeAPIReady() {
		let dd = $("#playAddr").text();
		let dd2 = $("#playAddr").val();
		console.log("주소값"+dd);
		console.log("주소값"+dd2);
		
		var aa = dd.split("/");
		console.log("aa:"+aa);
		
		var bb= aa[2];
		console.log("bb:"+bb);
		var cc= aa[3]
		console.log("cc:"+cc);
		
		if(aa.length == 4){
	        var realurl = aa[3];
			
		}else if(aa.length ==5){
			  var realurl = aa[4];
		}
		
		
		console.log("realurl :" + realurl);
		
		player = new YT.Player("player", {
			height: "425",
			width: "756",
			// videoId : 유투브 링크주소에서 v=파라미터값 
			videoId: realurl,
			playerVars: { rel: 0, showinfo: 0, modestbranding: 1, iv_load_policy: 3 },
			events: {
				onReady: onPlayerReady,
				onStateChange: onPlayerStateChange
			}
		});
	};
    
    </script>
	  <script type="text/javascript" src="<c:url value="/resources/user/js/video/detail.js"/>"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/2.0.0/anime.min.js"></script> 
  