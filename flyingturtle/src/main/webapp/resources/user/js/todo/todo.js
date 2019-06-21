// 없으면 안돼 
  const container = document.querySelector('.container');
  const button = document.querySelector('button');
  const input = document.querySelector('.form-control');
  const td = document.querySelector('td');

 
	// 생성될 때마다 class,id 명칭 다르게 하는 것 
	  var listi = 1;
	  var checki = 6;
	  var currentNo = 0;
    
// 투두 등록 하기
  var projectNo = '${list.pjNo}'; //프젝 번호
  console.log(projectNo);


//project title 등록 함수 
$('.inputtitle').keydown(function(key) {
	  if(key.keyCode == 13) {
	    $.ajax({
	    	url : "/flyingturtle/user/todo/addproject.do", 
	    	type:'POST',
	        dataType : 'json',
	        data: {'title':$(this).val()},
	    	contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	    	success : function(result) {	    		
	    		window.location.reload(true);
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
	    	}   
	    });
	  }
})


function errBox(msg) {
	const div = document.createElement('div');
	div.classList.add('alert', 'alert-warning', 'animated', 'bounceIn');
	div.appendChild(document.createTextNode(msg));
	$("ul.list-group").before(div);
	setTimeout(() => { div.remove();}, 3000);
}
  
function todayDate() {
	var date = new Date(); 
	var year = date.getFullYear(); 
	var month = new String(date.getMonth()+1); 
	var day = new String(date.getDate()); 

	// 한자리수일 경우 0을 채워준다. 
	if(month.length == 1){ 
	  month = "0" + month; 
	} 
	if(day.length == 1){ 
	  day = "0" + day; 
	} 

	return year + "" + month + "" + day;
}

// 투두 등록 버튼 클릭시 투두 등록
  $('[name=todosubmit]').click(function(){ 
	  
	    // 프로젝트 선택 확인
		if ($(".td.select").length == 0) {
			alert("프로젝트를 선택 후 등록하세요");
			return;
		}
	  
		//1. 등록 된 내용이 없을 때
		// todo 계획 체크
	    if ($("form[name='TodoInsertForm'] input[name='content']").val() == "") {
	    	errBox('앗! 오늘 계획을 입력하셨나요?');
		    return;
	    } 
	    // todo 일정 체크
	    if ($("#toDate").val() == "") {
	    	errBox('앗! 일정을 입력하셨나요?');
	    	return;
	    } 
	    
	    let todoDate = $("#toDate").val().replace(/-/g, "");
	    // 오늘 날짜 이전인 경우 체크
	    if ((todayDate() - todoDate) > 0) {
	    	errBox('앗! 오늘이후의 날짜를 선택하세요?');
	    	return;
	    }
	    
	    //2. 등록 된 내용이 있을 때
	    
	    var insertData = $('[name=TodoInsertForm]').serialize();
	    console.log(insertData); //content=12310&endDay=2019-06-25
	    console.log("프로젝트 번호 :"+currentNo); //103번
	    insertData += "&pjNo="  + currentNo
	      $.ajax({
	          url : "/flyingturtle/user/todo/addtodo.do",
	          data : insertData, 
	          success : function(data){
	        	  console.log("data:"+data);
	              if(data) {
	            	  todotList(); 
	                  $('[name=content]').val('');
	              }
	          }
	      });
	});


//프로젝트명 클릭시 해당하는 todo list 나오기 
  $('.td').click(function() {
  		  // todolist : 학원 프로그램 프로젝트명 
  			console.log("아이디값 : "+$(this).attr("id"));
  			
  			$(".td").removeClass("select");
  			$(this).addClass("select")
  			
  			var id = $(this).attr("id");
  			currentNo = id;
  		    var todolist = $(this).text();
  		    
//  		    $(".inputtitle").text(todolist);
  		    $(".lead").text(todolist);
  		    $(".lead").css({
  		  	'font-weight': 'bold',
  		    'color': 'darkblue',
  		    'line-height': '40px',
  		    'height':'40px',
  		    'font-size': '40px'
  		    });
  		    todotList();
      var tt = $(".inputtodo").html();
      $(".inputtodo").text(tt);
     
    });
  
//투두 목록 
  function todotList(){
	    $.ajax({
		    url : "/flyingturtle/user/todo/listtodo.do", 
		    data: {'pjNo': currentNo },
		  	dataType : "json",
		  	contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		  	success : function(result) {
		  		$('.list-group').empty();
		  		console.dir(result);
		  		for(var i=0; i<result.length; i++) {
	  					todoNo = result[i].todoNo;
	  					codeNo = result[i].codeNo;	  					
	  					console.log("codeNo : "+codeNo);
	  					let lineThrough = "";
	  					let lineChecked = "";
	  					if(codeNo == 30) {
	  						lineThrough = "style='text-decoration: line-through'";
	  						lineChecked = "checked";
	  					} 
  						$('.list-group').append(`
  								<li id="todolist${listi}" class="list-group-item d-flex justify-content-between align-items-center">
  								<input type="hidden" id="todoNum`+i+`" value='${todoNo}'>
  								<span class="inputtodocss" id="inputtodo${todoNo}" title=${result[i].content} ${lineThrough}>${result[i].content}</span>
  								<span class="dead-line">`+ 
  									(result[i].deadline == 0 ? "D-day" : result[i].deadline + "일 전") + `</span>
  								<span class="checktodo">  
  								<input type="checkbox" id="check${todoNo}" ${lineChecked} class="check${todoNo}" name="check${todoNo}" onclick=plusLine("check${todoNo}");> 
  								완료  <label for="check${todoNo}"></label>
  								</span>
  								<span class="badge badge-primary badge-pill" onclick=delTodo("${todoNo}"); >삭제</span>
  						</li>`);
		  		}
	  		 }	      
		 });
    }



//  else {  
//	    alert("그 외에 적용이 된다는거지?");
//			    var dd = $('.dead-line');
//			    var tt = $('#check');
//			    var lig = $('.list-group');
//		
//			    lig.append(`
//			    <li id="todolist`+ listi +`" class="list-group-item d-flex justify-content-between align-items-center">
//			    <span id="inputtodo`+ inputi +`"> ${input.value}</span>
//			    <span class="dead-line"> ${dd.html()} </span>
//			    <span class="checktodo"> 
//			    <input type="checkbox" id="check`+checki+`" name="check"
//			     onclick=plusLine('inputtodo` + inputi +`'); /> 
//			    Check  <label for="check`+checki+`"></label>
//			  </span>
//			    <span class="badge badge-primary badge-pill">삭제</span>
//			  </li>`);
//			
//			  listi++;
//			  checki++;
//			  inputi++;
//	     }
//  });


  
//todo 체크시 -> 텍스트 밑줄 그어짐 
function plusLine(checkTodo) {
	console.log(checkTodo); 
	let del = checkTodo.substring(5,8);
	console.log("체크한 번호" + del);
	console.log("이걸 그어야돼 "+ $("#inputtodo")+del);
    if( $("input:checkbox[name="+checkTodo+"]").is(":checked")) {
 
		    	$.ajax({
		    		   url    : "/flyingturtle/user/todo/finishtodo.do", 
		 		      data    : {'todoNo': del, 'codeNo' : 30},
		 		      success : function(){
		 		        	       $("#inputtodo"+del).css('text-decoration','line-through');
		 		                 }
		    	       });
    }  else {
  
		    	$.ajax({
		 		      url     : "/flyingturtle/user/todo/finishtodo.do", 
				      data    : {'todoNo': del, 'codeNo' : 31},
				      success : function(){
				    	  				$("#inputtodo"+del).css('text-decoration','none');
				                 }
		 	       });
    
    		}
}

//todo 삭제
function delTodo(todoN) {
	let e = window.event;
	if (e.target.classList.contains('badge') && confirm('정말 일정을 지우실건가요?') === true) {
	   $.ajax({
		      url    : "/flyingturtle/user/todo/deletetodo.do", 
		      data   : {'todoNo': todoN},
		  	dataType : "json",
		  	success  : function(result) {
					  		e.target.parentElement.remove();	  	
					  		const div = document.createElement('div');
					  		div.classList.add('alert', 'alert-success', 'animated', 'fadeInUp');
					  		div.appendChild(document.createTextNode('일정이 삭제 되었어요!'));
					  		$("ul.list-group").before(div);
					  		setTimeout(() => { div.remove();}, 3000);
		  			  }   
		 	  });
		}
   }


//프로젝트 삭제 함수
$(".btn2").click(function () {
	
	Swal.fire({
		title: "프로젝트를 지우시겠습니까?",
		type:'question',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: 'YES!'
	}).then((check) => {
		var d = $(this).attr("id").split('e');
		var e = d[3];
		
		$(".pno" + e).remove();
		
		//리스트 내용이 없으면 
		emptyProjectContentView();

		$.ajax({ 
			url : "/flyingturtle/user/todo/deleteproject.do",
			dataType : 'json',
			data: {'pjNo': e }
		}).done();	
	});
})   
	
function emptyProjectContentView() {
	//리스트 내용이 없으면 c
	if ($("[class^='pno']").length == 0) {
		let html = `<tr class="pjNull"><td> 앗! 등록된 프로젝트가 없습니다 <br>먼저 프로젝트를 등록해주세요.</td></tr>
		<tr class="emoji"><td class="emojiIcon">
		<img src='/flyingturtle/resources/user/images/thinking(1).png'/></td></tr>`
		$(".todotodolist > table > tbody").append(html);
	}
}


//프로젝트 리스트 함수
function ProjectList(){
	$.ajax({
		url : "/flyingturtle/user/todo/Projectlist.do",
		success : function(result) {
			console.log(result);
		}
	})
}


  $(  function () { 
	//달력
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
		  buttonImage: "/flyingturtle/resources/user/images/calendar.png", 
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
		}
    }); 
     // 프로젝트가 없는경우
    emptyProjectContentView();    
});

  
  
  
  
  
  
  
  
  
  
  
  