$("#months").change(function(){
	var year = $("#year").val();
	var month = $(this).val();
	
	location.href=`monthList.do?month=${year}${month}`;
	
	
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


// chart
google.charts.load('current', {packages: ['corechart', 'bar']});
google.charts.setOnLoadCallback(drawStacked);

function drawStacked() {
	
	let chartData = [
	    ['name', '출석일수', '결석일수', '지각일수', '조퇴일수', { role: 'annotation' } ]
	];
	for (let i = 0; i < dataArr.length; i++) {
		chartData.push(dataArr[i]);
	}
	if(dataArr.length==0) return;
  var data = google.visualization.arrayToDataTable(chartData);

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
          max: 25
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
	var date = new Date();
	var month = date.getMonth()+1;
	month = (month <10 ? '0' + month: month);
	alert(date.getYear()+""+month);
   location.href="monthList.do?month="+(date.getYear()+1900)+""+month;
});
$("#dayBtn").click(function() {
	location.href="dayList.do"
});

