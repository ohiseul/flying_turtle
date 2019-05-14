$(document).ajaxStart(function () {
	$("body").waitMe({
		effect: "pulse",
		text: "거북 거북...",
		bg: "rgb(5, 100, 225);",
		color: "#000"
		});
   })
   .ajaxStop(function () {
	   $("body").waitMe("hide");
   });