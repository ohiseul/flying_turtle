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
  var listi = 1;
  var checki = 6;
  var inputi = 1;
  var currentNo = 0;
  var todoNo;
 // =================================투두 등록 하기 ================================================
  var projectNo = '${list.pjNo}'; //프젝 번호
  console.log(projectNo);

  
 // 투두 등록 버튼 클릭시 //투두 등록
  $('[name=todosubmit]').click(function(){ 
	    var insertData = $('[name=TodoInsertForm]').serialize();
	    insertData += "&pjNo="  + currentNo
	      $.ajax({
	          url : "/flyingturtle/user/todo/addtodo.do",
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
		      url : "/flyingturtle/user/todo/listtodo.do", 
		      data: {'pjNo': currentNo },
		  	dataType : "json",
		  	contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		  	success : function(result) {
		  		//console.log("title pjNo 값 : " + id);
//		  		console.log("가지고 온 데이터 pjNo : " +result[0].pjNo);
		  		console.dir("result 값 : "+result); //array
//		  		console.dir("result todoNo : "+ result[0].todoNo); //array
		  		$('.list-group').empty();
		  		for(var i=0; i<result.length; i++) {
//	  				if(result[i].pjNo==id) {
//	  					console.log("아이디값과 pjNo가 같을 때"+result[i].pjNo);
//	  					console.log("result todoNo : "+ result[i].todoNo);
	  					todoNo = result[i].todoNo;
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
    <input type="checkbox" id="check`+checki+`" name="check"
     onclick=plusLine('inputtodo` + inputi +`'); /> 
    Check  <label for="check`+checki+`"></label>
  </span>
    <span class="badge badge-primary badge-pill">삭제</span>
  </li>`);

  listi++;
  checki++;
  inputi++;
  
     }
});


//투두 삭제
list.addEventListener('click', (e) => {
	
  if (e.target.classList.contains('badge') && confirm('정말 일정을 지우실건가요?') === true) {
	 
	$.ajax({
	      url : "/flyingturtle/user/todo/deletetodo.do", 
	      data: {'todoNo': todoNo },
	  	dataType : "json",
	  	success : function(result) {
	  		console.log("삭제 성공 확인:" + result);
	  		e.target.parentElement.remove();	  	
	  		const div = document.createElement('div');
	  		div.classList.add('alert', 'alert-success', 'animated', 'fadeInUp');
	  		div.appendChild(document.createTextNode('일정이 삭제 되었어요!'));
	  		
	  		$("ul.list-group").before(div);
	  		
	  		setTimeout(() => {
	  			div.remove();
	  		}, 3000);
	  	}   
	})
         
  } 
});




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
	      url : "/flyingturtle/user/todo/listtodo.do", 
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
//    	url : "/flyingturtle/user/todo/donetodo.do"
//    })
  }
  //else if($("#"+id).prop("checked") == false){
    else {
    $("#"+id).css('text-decoration','none');
  }
}




//project title 등록 함수 
$('.inputtitle').keydown(function(key) {
	//alert('왜안돼?');
	  if(key.keyCode == 13) {
	    //엔터시 td.title 등록 되게
	    var pjtitle = $(this).val();
	   /* $(".td").text(pjtitle);
	    var td = $('.pjtitle').text();
	    console.log(td);*/
	    console.log($(this).val());
	    
	    $.ajax({
	    	url : "/flyingturtle/user/todo/addproject.do", //todoController을 부른다.
	    	type:'POST',
	        dataType : 'json',
	        data: {'title':$(this).val()},
	    	contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	    	success : function(result) {
	    		console.dir(result.lists.lists); //array
	    		console.log(result.lists.lists.length);
	    		
	    		let pjlength = result.lists.lists.length;
	    		console.log("배열 길이 : "+pjlength);
	    		console.log("배열의 첫번째 pjNo"+result.lists.lists[0].pjNo); //43
	    		
	    		$('.projectplus').empty();
	    		
	    		for(var i=0; i<pjlength; i++) {
	    			$(".projectplus").append("<tr class="+result.lists.lists[i].pjNo+"><td class='td' id="+result.lists.lists[i].pjNo+">" + result.lists.lists[i].title + "</td>"+
	    									 "    <td><button name='btn2' class='btn2'><i class='fa fa-trash'></i></button></td></tr>");			
	    		}
	    	
	    		window.location.reload(true);
	    		
	    	}   
	    });
	  }
  
})



//프로젝트 삭제 함수
$(".btn2").click(function () {
	alert("정말 프로젝트를 지우시겠어요?");
	var d = $(this).attr("id").split('e');
	var e = d[3];
		$.ajax({
			url : "/flyingturtle/user/todo/deleteproject.do",
			dataType : 'json',
			data: {'pjNo': e }
			}).done(
					window.location.reload(true)					
					);
		})
		
		


//프로젝트 리스트 함수
function ProjectList(){
	$.ajax({
		url : "/flyingturtle/user/todo/Projectlist.do",
		success : function(result) {
			console.log(result);
		}
		
	})
}


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
//		  buttonImageOnly: true, 
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
				 
		  					  
		}
    }); 
  }
);

window.onload = function() {
	
	   $('head').append('<link rel="stylesheet" type="text/css" href="/flyingturtle/resources/user/css/todo/todo.css"/>'+
						'<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/animate.css@3.5.2/animate.min.css">'+
						'<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">'+
						'<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">'+
						'<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">');
	  
};
	
	

    