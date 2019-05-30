
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

//$(document).on("click","#searchButton",function(e){
//e.preventDefault();
//var url="dayList.do";
//url = url + "?keyword="+$("#search").val();
//location.href= url;
//console.log(url);
//});

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
 function searchList() {
 var searchType=$("#searchType[name=searchType]").val();
 var keyword = $("#search").val();
 //검색버튼을 클릭할 때마다 1번째 페이지를 보여주기 위해 현재페이지의 값을 1로 고정한다.
 window.location.href="/flyingturtle/admin/attend/dayList.do?searchType="+searchType+"&keyword="+ keyword;
 }



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
