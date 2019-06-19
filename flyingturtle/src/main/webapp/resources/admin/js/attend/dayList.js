  /**
	 * Remove active class on submit
	 */
$('form').submit(function(e) {
  e.preventDefault();
  if ($(this).hasClass('active')) 
    $(this).removeClass('active');
});

/**
 * Show/Hide form inputs
 */
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
 * Remove active class on submit
 */
$('form').submit(function(e) {
e.preventDefault();
if ($(this).hasClass('active')) 
  $(this).removeClass('active');
});

/**
 * Show/Hide form inputs
 */
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


// 검색
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
    $("#searchType").hide();
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
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

function drawChart() {

  let chartData = [
	['시간', '인원수']
	];
  	for(let i = 0; i<dataArr.length;i++){
  		chartData.push(dataArr[i]);
  	}
  	if(dataArr.length == 0) return;
  var data = google.visualization.arrayToDataTable(chartData);

  var options = {
		 
    title: '시간대별 인원수',
    pieSliceText: 'value',
    chartArea: {'width': '100%', 'height': '90%'},
    width:700,
    height:450
  };

  var chart = new google.visualization.PieChart(document.getElementById('chart_div'));

  chart.draw(data, options);
}

// 월, 일 버튼 누르면 ajax로 페이지 이동
$("#monthBtn").click(function() {
	var date = new Date();
	var month = date.getMonth()+1;
	month = (month <10 ? '0' + month: month);
   location.href="monthList.do?month="+(date.getYear()+1900)+""+month;
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
     html+=`<table class="table-board board-style1">
    	 <colgroup>
		    <col style="width:5%" />
		    <col style="width:5%" />
		    <col style="width:15%" />
		    <col style="width:10%" />
		    <col style="width:10%" />
		    <col style="width:10%" />
		    <col style="width:10%" />
		    <col style="width:25%" />
		 </colgroup>
        <tr>
            <th><input type="checkbox"></th>
            <th>번호</th>
            <th>학생명</th>
            <th>입실시간</th>
            <th>퇴실시간</th>
            <th>출결상태</th>
            <th>관리</th>
            <th>특이사항</th>
        </tr>`;
      for(let i =0; i<result.list.length;i++){
        let data = result.list[i];
        var checkIn = new Date(data.checkIn);
        var checkOut = new Date(data.checkOut);
        console.log(data);
        html +=`<tr>  
            <td><input type="checkbox"></td>
            <td>${data.attendNo}</td>
            <td>${data.name}</td>
            <td>${checkIn.getHours()+':'+checkIn.getMinutes()}</td>
            <td>${checkOut.getHours()+':'+checkOut.getMinutes()}</td>
            <td>${data.codeName}</td>
            <td>
                <select class="state" name="codeNo">
                    <option >변경</option>
                    <option value="20">출석</option>
                    <option value="21">지각</option>
                    <option value="22">조퇴</option>
                    <option value="23">결석</option>
                </select>
            </td>`;
           html+= `<td><input id="memo" type="text" placeholder="상태변경 이유를 적어주세요" value="${data.specialNote}"></td>
        </tr>`;
       }
      $(".tableDiv").html(html);
};

// 체크박스 모두 체크
$("#check").click(function(){
    if($("#check").prop("checked")){
        // input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
        $("input[name=memberNo]").prop("checked",true);
        // 클릭이 안되있으면
    }else{
        // input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
        $("input[name=memberNo]").prop("checked",false);
    }
});

// 저장버튼 누르면 상태, 특이사항 수정
$("#saveBtn").click(function() {
   var checkArr = [];
   var selectArr =[];
   var memoArr =[];
// 체크박스
// var memberNo = $("input[name=memberNo]:checked").val();
   var checkList = $(".tableDiv input[name=memberNo]");
   var selectList = $(".tableDiv select[name=codeNo]");
   var memoList = $(".tableDiv input[name=memo]");
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
      console.log("옴",result);
      $("#all").text(result.count+"명");
      $("#checkIn").text(result.addCount.checkInCount+"명");
      $("#late").text(result.addCount.lateCount+"명");
      $("#early").text(result.addCount.earlyCount+"명");
      $("#absent").text(result.addCount.absentCount+"명");
      
      
      $(".tableDiv input[name=memberNo]:checked").each(function () {
    	  alert($(this).val());
    	 let parentTr = $(this).parent().parent();
    	 parentTr.find("#codeName").text(parentTr.find(":selected").text()) 
      });
      
      
      
//      $("#row")
//	      for(let i = 0; i < $("#row").length;i++){
//	    	  var chk = $(".content_table input[name=memberNo]").is(":checked");
//	         if(chk = true){
//	        	 $("#row").eq[i].parent().prev().text(result.list[i].codeName);    	  
//	        	 checkList.prop("checked",false);
//         }
// console.log("resultlog",result.list[i]);
// console.log("checked",checkList[i].checked);
// let sed = selectList.selected();
// sed.parent().prev().text(result.list[i].codeName);
// checkList.prop("checked",false);
//           
//         }
   });
});


