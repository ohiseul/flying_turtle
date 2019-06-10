<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/patternLock.css"  rel="stylesheet" type="text/css" />
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="../js/patternLock.js"></script>
<script>

$(document).ready(function () {
	lock = new PatternLock('#patternContainer');
	$("#confirm").click(function () {
		var patVal = lock.getPattern()
		alert(patVal);
		
	});
	$("#reset").click(function () {
		lock.reset();
	});
	$("#lock").click(function () {
		lock.disable();
	});
	$("#unlock").click(function () {
		lock.enable();
	});
	
	$('#patternContainer').mouseup(function () {
		var patVal = lock.getPattern()
		// alert(patVal);
	});
});
</script>
</head>
<body>
	<!-- <input type="text" id="id" placeholder="아이디" /> -->
	<div id="patternContainer"></div>
	<div class="simple-log-btn">
		<input type="button" id="confirm" value="로그인" />
		<input type="button" id="reset" value="초기화" />
	</div>
	<!-- <input type="button" id="lock" value="패턴잠금" /> -->
	<!-- <input type="button" id="unlock" value="패턴해제" /> -->
	<br />
</body>
</html>