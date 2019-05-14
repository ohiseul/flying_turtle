// 오늘 날짜 구하기 
	var dateObj = new Date();
	var year = dateObj.getFullYear();
	var month = dateObj.getMonth()+1;
	var day = dateObj.getDate();
	var today = year + "-" + month + "-" + day;

// 없으면 안돼 
  const container = document.querySelector('.container');
  const button = document.querySelector('button');
  const input = document.querySelector('.form-control');
  const list = document.querySelector('.list-group');
  const td = document.querySelector('td');

 
// 생성될 때마다 class,id 명칭 다르게 하는 것 
  var listi =1;
  var checki = 6;
  var inputi =1;
  
var currentNo = 0;

 // =================================투두 등록 하기 ================================================
  var projectNo = '${list.pjNo}'; //프젝 번호
  console.log(projectNo);

  
 // 투두 등록 버튼 클릭시 //투두 등록
  $('[name=todosubmit]').click(function(){ 
	    var insertData = $('[name=TodoInsertForm]').serialize();
	    insertData += "&pjNo="  + currentNo
	      $.ajax({
	          url : "/flyingturtle/todo/addtodo.do",
	          data : insertData, 
	          success : function(data){
	              if(data) {
	            	  todotList(); 
	                  $('[name=content]').val('');
	              }
	          }
	      });
	});


//  
////투두 목록 
  function todotList(){
	    $.ajax({
		      url : "/flyingturtle/todo/listtodo.do", 
		      data: {'pjNo': currentNo },
		  	dataType : "json",
		  	contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		  	success : function(result) {
		  		//console.log("title pjNo 값 : " + id);
//		  		console.log("가지고 온 데이터 pjNo : " +result[0].pjNo);
//		  		console.dir(result); //array
		  		$('.list-group').empty();
		  		for(var i=0; i<result.length; i++) {
//	  				if(result[i].pjNo==id) {
	  					console.log("아이디값과 pjNo가 같을 때"+result[i].pjNo);
	  					$('.list-group').append(`
	  						    <li id="todolist`+ listi +`" class="list-group-item d-flex justify-content-between align-items-center">
	  						    <span id="inputtodo`+ inputi +`"> `+ result[i].content+ `</span>
	  						    <span class="dead-line">`+ result[i].deadline +`일 전</span>
	  						    <span class="checktodo">  
	  						    <input type="checkbox" id="check`+checki+`" 
	  						     onclick=plusLine('inputtodo` + inputi +`');
	  						    class="check" name="check"/> 
	  						    Check  <label for="check`+checki+`"></label>
	  						  </span>
	  						    <span class="badge badge-primary badge-pill">삭제</span>
	  						  </li>`).bind();
		  				}
		  		
	  			}
	  			
//		  	}   
			     	      
		  });
  }

  


  
//  
//  $(document).ready(function(){
//	  TodotList(); 
//	});
//	 


//================================================

		

// todo 등록할 때 함수 
  $(document).on("click","#button-addon2",function() {
    //1. 등록 된 내용이 없을 때
    if (input.value === '') {
    const div = document.createElement('div');
    div.classList.add('alert', 'alert-warning', 'animated', 'bounceIn');
    div.appendChild(document.createTextNode('앗! 일정을 입력하셨나요?'));
    console.dir(container);
    console.dir($(div));
    console.dir($(list));
    
    $("ul.list-group").before(div);
    
//    container.insertBefore(div, list);
  
    setTimeout(() => {
      div.remove();
    }, 1000);


//2. 등록 된 내용이 있을 때
  } else {
	  
    var dd = $('.dead-line');
    var tt = $('#check');
    var lig = $('.list-group');
    
    lig.append(`
    <li id="todolist`+ listi +`" class="list-group-item d-flex justify-content-between align-items-center">
    <span id="inputtodo`+ inputi +`"> ${input.value}</span>
    <span class="dead-line"> ${dd.html()} </span>
    <span class="checktodo"> 
    <input type="checkbox" id="check`+checki+`" 
     onclick=plusLine('inputtodo` + inputi +`');
    class="check" name="check"/> 
    Check  <label for="check`+checki+`"></label>
  </span>
    <span class="badge badge-primary badge-pill">삭제</span>
  </li>`);

  listi++;
  checki++;
  inputi++;

//	  $.ajax({
//	      type:'GET',
//	      url : "/flyingturtle/todo/addtodo.do", 
//	      data: { 'content' : $(input.value) ,
//	    	      'endDay' : $(dd.html()),
//	      		 },
//	  	dataType : "json",
//	  	contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
//	  	success : function(result) {
//	  		$('.trtitle').text(result);
//	  		console.log("불려지냐고");
//	  	}   
//	  });
  
  
  
     }
});


//일정 삭제
list.addEventListener('click', (e) => {
		
  if (e.target.classList.contains('badge') && confirm('정말 일정을 지우실건가요?') === true) {
	  	  
    e.target.parentElement.remove();
      
    const div = document.createElement('div');
    div.classList.add('alert', 'alert-success', 'animated', 'fadeInUp');
    div.appendChild(document.createTextNode('일정이 삭제 되었어요!'));
    
    $("ul.list-group").before(div);

    setTimeout(() => {
      div.remove();
    }, 3000);
  }
});


$('.badge')

/*
//td 클릭 하면 
td.addEventListener('click', function() {
  //프로젝트명 입력하세요 란에 todotitle이 들어가면서 리스트가 나온다. 
  var tt = $('.form-control').val();
  console.log(tt);
});
*/



// 프로젝트명 클릭시 해당하는 todo list 나오기 
$('.td').click(function() {
	
	
		  // todolist : 학원 프로그램 프로젝트명 
			console.log("아이디값 : "+$(this).attr("id"));
			var id = $(this).attr("id");
//			console.log(id) =;
			currentNo = id;
		    var todolist = $(this).text();
		    
		    $(".trtitle").text(todolist);
		    var ttt = $('#todolist').text();   
		    todotList();
	/*	    
    $.ajax({
	      url : "/flyingturtle/todo/listtodo.do", 
	      data: {'pjNo': currentNo },
	  	dataType : "json",
	  	contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	  	success : function(result) {
	  		//console.log("title pjNo 값 : " + id);
//	  		console.log("가지고 온 데이터 pjNo : " +result[0].pjNo);
//	  		console.dir(result); //array
	  		$('.list-group').empty();
	  		for(var i=0; i<result.length; i++) {
//  				if(result[i].pjNo==id) {
  					console.log("아이디값과 pjNo가 같을 때"+result[i].pjNo);
  					$('.list-group').append(`
  						    <li id="todolist`+ listi +`" class="list-group-item d-flex justify-content-between align-items-center">
  						    <span id="inputtodo`+ inputi +`"> `+ result[i].content+ `</span>
  						    <span class="dead-line">`+ result[i].deadline +`일 전</span>
  						    <span class="checktodo">  
  						    <input type="checkbox" id="check`+checki+`" 
  						     onclick=plusLine('inputtodo` + inputi +`');
  						    class="check" name="check"/> 
  						    Check  <label for="check`+checki+`"></label>
  						  </span>
  						    <span class="badge badge-primary badge-pill">삭제</span>
  						  </li>`).bind();
	  				}
	  		
  			}
  			
//	  	}   
		     	      
	  });
    */
 // inputtodo : todo 내용  
    var tt = $(".inputtodo").html();
    $(".inputtodo").text(tt);
   
    
    
    
  });



//todo 체크시 -> 텍스트 밑줄 그어짐 
function plusLine(id){
 // console.log($("#"+id).find("input type"));
  //if($("#"+id).prop("checked") == true){
    if($("input:checkbox[name='check']").is(":checked")) {
    $("#"+id).css('text-decoration','line-through');
    
//    ajax({
//    	url : "/flyingturtle/todo/donetodo.do"
//    })
  }
  //else if($("#"+id).prop("checked") == false){
    else {
    $("#"+id).css('text-decoration','none');
  }
}




//project title 등록 함수 
$('.inputtitle').keydown(function(key) {
	
	  if(key.keyCode == 13) {
	    //엔터시 td.title 등록 되게
	    var pjtitle = $(this).val();
	   /* $(".td").text(pjtitle);
	    var td = $('.pjtitle').text();
	    console.log(td);*/
	    console.log($(this).val());

	    $.ajax({
	    	url : "/flyingturtle/todo/addproject.do", //todoController을 부른다.
	    	type:'POST',
	        dataType : 'json',
	        data: {'title':$(this).val()},
	    	contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	    	success : function(result) {
	    		console.dir(result.lists.lists);
	    		console.log(result.lists.lists.length);
	    		
	    		let pjlength = result.lists.lists.length;
	    		console.log("배열 길이 : "+pjlength);
	    		console.log(result.lists.lists[i]);
	    		
	    		for(var i=0; i<pjlength; i++) {
	    			$(".projectplus").append("<tr><td class='td' id='pjNo"+i+"'>" + result.lists.lists[i].title + "</td></tr>");			
	    		}
	    	
	    	}   
	    });
	  }
  
})






//달력
  $(  function () { 
     $("#toDate").datepicker({ 
		  inline: true, 
		  dateFormat: "yy-mm-dd", /* 날짜 포맷 */ 
		  prevText: 'prev', 
		  nextText: 'next', 
		  showButtonPanel: true, /* 버튼 패널 사용 */ 
		  changeMonth: true, /* 월 선택박스 사용 */
		  changeYear: true, /* 년 선택박스 사용 */
		  showOtherMonths: true, /* 이전/다음 달 일수 보이기 */
		  selectOtherMonths: true, /* 이전/다음 달 일 선택하기 */ 
		  showOn: "button",
		  buttonImage: "images/icons8-timesheet-40.png", 
		  buttonImageOnly: true, 
		  minDate: '-30y',
		  altField: '#toDate',
		  closeText: '닫기',
		  currentText: '오늘', 
		  showMonthAfterYear: true, /* 년과 달의 위치 바꾸기 */ /* 한글화 */ 
		  monthNames : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], 
		  monthNamesShort : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		  dayNames : ['일', '월', '화', '수', '목', '금', '토'], 
		  dayNamesShort : ['일', '월', '화', '수', '목', '금', '토'],
		  dayNamesMin : ['일', '월', '화', '수', '목', '금', '토'], 
		  showAnim: 'slideDown', /* 날짜 유효성 체크 */ 
	
		  onClose: function( selectedDate ) { $('#fromDate').datepicker("option","minDate", selectedDate);  
		                                      //$('#toDate').datepicker("option", "maxDate", selectedDate);
				  
		  // 선택된 날짜 -> vo 저장 -> 
		  // textbox -> input에 적힘
		  //console.log(selectedDate);
		  					  
		}
    }); 
  }
);


    