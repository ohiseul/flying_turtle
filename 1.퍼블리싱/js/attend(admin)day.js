
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
    width:1100,
    height: 400,
    legend: { position: 'top', maxLines: 3 },
    vAxis: {
      viewWindowMode:'explicit',
      viewWindow: {
          min: 0,
          max: 31
      }
    },
    bar: { groupWidth: '50%' },
    isStacked: true,
  };
      var chart = new google.visualization.ColumnChart(document.getElementById('bar_chart_div'));
      chart.draw(data, options);
    }


// google.charts.load('current', {'packages':['bar']});
// google.charts.setOnLoadCallback(drawChart);

// function drawChart() {
//   var data = google.visualization.arrayToDataTable([
//     ['Year', 'Sales', 'Expenses', 'Profit'],
//     ['2014', 1000, 400, 200],
//     ['2015', 1170, 460, 250],
//     ['2016', 660, 1120, 300],
//     ['2017', 1030, 540, 350]
//   ]);

//   var options = {
//     chart: {
//       title: 'Company Performance',
     
//     },
//     bars: 'vertical',
//     vAxis: {format: 'decimal'},
//     height: 400,
//     colors: ['#1b9e77', '#d95f02', '#7570b3']
//   };

//   var chart = new google.charts.Bar(document.getElementById('bar_chart_div'));

//   chart.draw(data, google.charts.Bar.convertOptions(options));

//   var btns = document.getElementById('btn-group');

// }


 



