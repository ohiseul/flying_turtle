
 $('head').append('<link rel="stylesheet" type="text/css" href="/flyingturtle/resources/admin/css/attend/dayList.css">');
 
  /**
  Remove active class on submit
**/
$('form').submit(function(e) {
  e.preventDefault();
  if ($(this).hasClass('active')) 
    $(this).removeClass('active');
});

/**
  Show/Hide form inputs
**/
$('.search span').click(function(e) {
  
    var $parent = $(this).parent();
  
    if (!$parent.hasClass('active')) {
      
      $parent
        .addClass('active')
        .find('input:first')
        .on('blur', function() {
          if (!$(this).val().length) $parent.removeClass('active');
        }
      );
      
    }
  });

  $(".search span").click(function() {
	if ($("#searchType").show()){
		$("#searchType").hide();
	}
	$("#searchType").show();
});
/**
Remove active class on submit
**/
$('form').submit(function(e) {
e.preventDefault();
if ($(this).hasClass('active')) 
  $(this).removeClass('active');
});

/**
Show/Hide form inputs
**/
$('.search span').click(function(e) {

  var $parent = $(this).parent();

  if (!$parent.hasClass('active')) {
    
    $parent
      .addClass('active')
      .find('input:first')
      .on('blur', function() {
        if (!$(this).val().length) $parent.removeClass('active');
      }
    );
    
  }
});


//검색
$("#searchType").hide();

$(".search span").click(function() {
if ($("#searchType").show()){
  $("#searchType").hide();
}
$("#searchType").show();
});

$("#searchButton").click(function() {
	 var searchType=$("#searchType[name=searchType]").val();
	 var keyword = $("#search").val();
	 var date = $('#date').val();
	$.ajax({
		url:"ajaxDayList.do",
		data:{searchType:searchType,
			  keyword:keyword,
			  attendRegDate:date
			  },
		dataType:"json"
	})
	.done(function(result){
		getAttendList(result);
	});
});

// chart
google.charts.load('current', {packages: ['corechart', 'bar']});
google.charts.setOnLoadCallback(drawBasic);

function drawBasic() {

      var data = new google.visualization.DataTable();
      data.addColumn('timeofday', '시간');
      data.addColumn('number', '인원수');

      data.addRows([
     
        [{v: [9, 0, 0], f: '9 am'}, 2],
        [{v: [10, 0, 0], f:'10 am'}, 3],
        [{v: [11, 0, 0], f: '11 am'}, 4],
        [{v: [12, 0, 0], f: '12 pm'}, 5],
      ]);

      var options = {
        title: '시간별 출석인원',
        height:450,
        hAxis: {
          title: '시간',
          format: 'h:mm a',
          
          viewWindow: {
            min: [8, 00, 0],
            max: [12, 30, 0]
          }
        },
        vAxis: {
          title: '인원수'
        },
        bar: { groupWidth: '30%' },
      };

      var chart = new google.visualization.ColumnChart(
        document.getElementById('chart_div'));

      chart.draw(data, options);
    }

//월, 일 버튼 누르면 ajax로 페이지 이동
$("#monthBtn").click(function() {
	location.href="monthList.do"
});
$("#dayBtn").click(function() {
	location.href="dayList.do"
});


// 날짜 누르면 해당 날짜에 해당하는 리스트 보여주기
$("#date").change(function(){
	var date = $('#date').val();
	$.ajax({
		url:"ajaxDayList.do",
		dataType:"json",
		data:{attendRegDate:date}
	})
	.done(function(result){
		getAttendList(result);
		});
});

function getAttendList(result){
	console.dir(result);
		html="";
		html+=
	`<table class="table">
        <tr>
            <th>전체</th>
            <th>출석</th>
            <th>지각</th>
            <th>조퇴</th>
            <th>결석</th>
        </tr>
        <tr>
			<td>${result.count}명</td>
        	
	        <td>${result.addCount.checkInCount}명</td>
	    	<td>${result.addCount.lateCount}명</td>
	    	<td>${result.addCount.earlyCount}명</td>
	    	<td>${result.addCount.absentCount}명</td>
        </tr>
        	</table>`;
	  html+=`<table class="content_table">
        <tr>
            <th style="width:50px;"><input type="checkbox"></th>
            <th style="width:60px;">번호</th>
            <th>학생명</th>
            <th>입실시간</th>
            <th>퇴실시간</th>
            <th>출결상태</th>
            <th>관리</th>
            <th>특이사항</th>
        </tr>`;
	   for(let i =0; i<result.list.length;i++){
		  let data = result.list[i];
		  console.log(data);
		  html +=`<tr>  
            <td style="width:50px;"><input type="checkbox"></td>
            <td style="width:60px;">${data.attendNo}</td>
            <td>${data.name}</td>
            <td></td>
            <td>${data.checkOut}</td>
            <td>${data.codeName}</td>
            <td>
                <select id="state" name="codeNo">
                    <option >변경</option>
                    <option value="20">출석</option>
                    <option value="21">지각</option>
                    <option value="22">조퇴</option>
                    <option value="23">결석</option>
                </select>
            </td>
            <td><input id="memo" type="text" placeholder="상태변경 이유를 적어주세요" value="${data.specialNote}"></td>
        </tr>`;
		 }
	   $(".tableDiv").html(html);
};


//체크박스 모두 체크
$("#check").click(function(){
    if($("#check").prop("checked")){
        //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
        $("input[name=memberNo]").prop("checked",true);
        //클릭이 안되있으면
    }else{
        //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
        $("input[name=memberNo]").prop("checked",false);
    }
});


//저장버튼 누르면 상태, 특이사항 수정
$("#saveBtn").click(function() {
	alert("왔음");
	var checkArr = [];
	var selectArr =[];
	var memoArr =[];
//	체크박스
//	var memberNo = $("input[name=memberNo]:checked").val();
		
		var checkList = $("input[name=memberNo]");
		var selectList = $("select[name=codeNo]");
		var memoList = $("input[name=memo]");
		
		for(var i = 0; i<checkList.length;i++){
			if(checkList[i].checked){
				checkArr.push(checkList[i].value);
				selectArr.push(selectList[i].value);
				memoArr.push(memoList[i].value);
		}
		
	}
		console.log(checkArr);
		console.log(selectArr);
		console.log(memoArr);

	$.ajax({
		url:"updateState.do",
		traditional:true,
		data:{
			  checkArr:checkArr,
			  selectArr:selectArr,
			  memoArr:memoArr}
	})
	.done(function(result){
		
	});
});

