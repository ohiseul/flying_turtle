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
  var count = google.visualization.arrayToDataTable(chartData);

  var options = {
    chartArea: {'width': '90%', 'height': '80%'},
    width:670,
    height: 500,
    legend: { position: 'top', maxLines: 3 },
    colors: ['#1b9e77', '#7570b3','#d95f02', '#FFC240'],
    vAxis: {
      viewWindowMode:'explicit',
      viewWindow: {
          min: 0,
          max: 25
      }
    },
    

    bar : {
    	isFixedWidth:true,
		groupWidth : '90px' // 그래프 너비 설정 %
	},
    isStacked: true
  };

      var chart = new google.visualization.ColumnChart(document.getElementById('bar_chart_div'));
      chart.draw(count, options);
    }

