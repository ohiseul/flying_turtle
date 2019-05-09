
// 오늘 날짜 구하기 
	var dateObj = new Date();
	var year = dateObj.getFullYear();
	var month = dateObj.getMonth()+1;
	var day = dateObj.getDate();
	var today = year + "-" + month + "-" + day;

//console.log(today);


// 없으면 안돼 
  const container = document.querySelector('.container');
  const button = document.querySelector('button');
  const input = document.querySelector('.form-control');
  const list = document.querySelector('ul');
  const td = document.querySelector('td');


// 생성될 때마다 class,id 명칭 다르게 하는 것 
  var listi =1;
  var checki = 6;
  var inputi =1;



// todo 등록할 때 함수 
  $(document).on("click","#button-addon2",function() {
    //1. 등록 된 내용이 없을 때
    if (input.value === '') {
    const div = document.createElement('div');
    div.classList.add('alert', 'alert-warning', 'animated', 'bounceIn');
    div.appendChild(document.createTextNode('앗! 일정을 입력하셨나요?'));

    container.insertBefore(div, list);
  
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
    <span class="dead-line"> ${dd.html()}</span>
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

     }
});


list.addEventListener('click', (e) => {
  if (e.target.classList.contains('badge') && 
    confirm('정말 일정을 지우실건가요?') === true) {
    e.target.parentElement.remove();
      
    const div = document.createElement('div');
    div.classList.add('alert', 'alert-success', 'animated', 'fadeInUp');
    div.appendChild(document.createTextNode('일정이 삭제 되었어요!'));
    container.insertBefore(div, list);

    setTimeout(() => {
      div.remove();
    }, 3000);
  }
});



//td 클릭 하면 
td.addEventListener('click', function() {
  //프로젝트명 입력하세요 란에 todotitle이 들어가면서 리스트가 나온다. 
  var tt = $('.form-control').val();
  console.log(tt);
});


//console.log($('.inputtodo').text())


// 프로젝트명 클릭시 해당하는 todo list 나오기 
$('.td').click(function() {
  // todolist : 학원 프로그램 프로젝트
    var todolist = $(this).text();
    $(".trtitle").text(todolist);
    var ttt = $('#todolist').text();
 // inputtodo : todo 내용  
    var tt = $(".inputtodo").html();
    $(".inputtodo").text(tt);
   
  })



//todo 체크시 -> 텍스트 밑줄 그어짐 
function plusLine(id){
 // console.log($("#"+id).find("input type"));
  //if($("#"+id).prop("checked") == true){
    if($("input:checkbox[name='check']").is(":checked")) {
    $("#"+id).css('text-decoration','line-through');
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
	    $(".td").text(pjtitle);
	    var td = $('.pjtitle').text();
	    
	    $.ajax({
	    	url : "todo/addproject.do", //todoController을 부른다.
	    	data : "title="+td,
	    	dataType : "json",
	    	success : function(result) {
	    		$('.trtitle').text(result);
	    	}   
	    });
	  }
  //function att(url,param);
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
		  
			$.ajax({
				url : "todo/addtodo.do",
				data : "endDay="+selectedDate,
				dataType : "json",
				success : function (list) {
					let result = "";
					for(let board of list) {
						result += `<div>${board.no}:::${board.title}</div>`; 
					}
					$("#result").html(result);
				}
			});
					  
		 }
    }); 
 }
);


 var test = dada();
 console.log( "test", test());

    