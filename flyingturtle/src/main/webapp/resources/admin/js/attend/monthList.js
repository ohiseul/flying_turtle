$(document).ready(function() {
	//selectbox 달 동적으로 생성 + 현재 달 출력
	var now = new Date();
	var nmon = now.getMonth()+1;
	//월별 selectbox 만들기
	for(var i = 1; i<= 12; i++){
		
		$("#month").append('<option value="'+ i + '">' +i+'월</option>');
	}
	
	$("#month > option[value="+nmon+"]").attr("selected","true");
});



$('head').append('<link rel="stylesheet" type="text/css" href="/flyingturtle/resources/admin/css/attend/monthList.css">');
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

/*$(document).on("click","#searchButton",function(e){
e.preventDefault();
var url="list.do";
url = url + "?keyword="+$("#search").val();
location.href= url;
console.log(url);
});*/

// $('head').append('<link rel="stylesheet" type="text/css" href="/flyingturtle/resources/user/css/notice/list.css">');
$("#searchType").hide();

$(".search span").click(function() {
if ($("#searchType").show()){
  $("#searchType").hide();
}
$("#searchType").show();
});

$("#searchButton").click(function() {
searchList();
});

//검색버튼을 클릭할때마다 searchList()가 수행된다.
// function searchList() {
// var searchType=$("#searchType[name=searchType]").val();
// var keyword = $("#search").val();
// //검색버튼을 클릭할 때마다 1번째 페이지를 보여주기 위해 현재페이지의 값을 1로 고정한다.
// window.location.href="/flyingturtle/user/notice/list.do?pageNo=1&searchType="+searchType+"&keyword="+ keyword;
// }


// chart
google.charts.load('current', {packages: ['corechart', 'bar']});
google.charts.setOnLoadCallback(drawStacked);

function drawStacked() {
  var data = google.visualization.arrayToDataTable([
    ['Genre', '출석', '결석', '조퇴', '지각', { role: 'annotation' } ],
    ['구본현', 20, 1, 0, 2, ''],
    ['구본현', 20, 1, 0, 2, ''],
    ['구본현', 10, 1, 0, 2, ''],
    ['구본현', 20, 1, 0, 2, ''],
    ['구본현', 20, 1, 0, 2, '']
  ]);

  var options = {
    chartArea: {'width': '90%', 'height': '90%'},
    width:950,
    height: 400,
    legend: { position: 'top', maxLines: 3 },
    colors: ['#1b9e77', '#7570b3','#d95f02', '#FFC240'],
    vAxis: {
      viewWindowMode:'explicit',
      viewWindow: {
          min: 0,
          max: 30
      }
    },
    bar: { groupWidth: '40%' },
    isStacked: true
  };

      var chart = new google.visualization.ColumnChart(document.getElementById('bar_chart_div'));
      chart.draw(data, options);
    }



//월, 일 버튼 누르면 페이지 이동
$("#monthBtn").click(function() {

	location.href="monthList.do"
});
$("#dayBtn").click(function() {

	location.href="dayList.do"
});



