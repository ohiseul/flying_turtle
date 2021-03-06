$(document).ready( function() {
	//등록된 과목명 불러오기
/*========================================================================================메뉴과목*/
	getSubjectList();
	
//	과목명 버튼을 눌렀을 때 
    $(document).on("click", ".sideMenu", function(){
        $(this).children().attr("readonly",true);

        var $this = $(this).parent().find('ul');
        $(".buttonList ul").not($this).slideUp(100);
        $this.slideToggle(200);
    });
});


// 처음 로딩 시 전체 메뉴 목록 가져오기
function getSubjectList(){
		
	$.ajax({
        url:"/flyingturtle/admin/canvas/menulist.do",
        dataType:"json",
		success:function(result) {
			
			html ="";
			html +=`<li>
				<img id="addButton" src="/flyingturtle/resources/images/add.png" />
				   <img class="Button" id="minusButton" src="/flyingturtle/resources/images/minus.png"/>
				</li>
				</ul> `;
			for(let i=0; i < result.sbj.length ; i++) {
				let data = result.sbj[i];
				html +=`<li>
							<div class='sideMenu'><input class='menuInput' id="menuInput${data.sbjNo}"  data-sbjNo=${data.sbjNo} type='text' name ='menu' readonly value="${data.sbjName}">
							</div>
							<span class='ddBtn'>+</span>
							<span class="rmDir" id="rm${data.sbjNo}" onclick="removeBtnBig('${data.sbjNo}','${data.sbjName}')">-</span>
							<ul class='dropdown'>`;
				for(let j = 0; j<result.ssbj.length;j++){		
					let smallData = result.ssbj[j];
					if(data.sbjNo == smallData.sbjNo ){
					html+=	`<li>
								<div class='childMenu'><input class='smallSubject' id="smallSubject${smallData.ssbjNo}" data-no=${smallData.ssbjNo} data-sbjNo=${smallData.sbjNo} data-name=${smallData.ssbjName} type='text' name ='menu' value="${smallData.ssbjName}"readonly>
									<span class="plDir" onclick="canvasmove('menuInput${data.sbjNo}','smallSubject${smallData.ssbjNo}','${data.sbjName}','${smallData.ssbjName}')">go</span><span id="rm${smallData.ssbjNo}" class="rmDir2" onclick="removeBtn('${data.sbjNo}','${smallData.ssbjNo}')">-</span>
								</div>
							</li>`;
					}
				}
				html += `</ul></li>`;
			}
			$(".buttonList").html(html);
			$(".dropdown").hide();
			$(".rmDir").hide();
			$(".rmDir2").hide();
			
			$("#bigInfo").text(result.sbj[0].sbjName);
			$("#smallInfo").text(result.ssbj[0].ssbjName);
		}
	});
}

$(".buttonList").on("click","#minusButton",function() {

	$(".ddBtn").hide();
	$(".rmDir").show();
	$(".rmDir2").show();
    
});
$(".buttonList").on("click","#addButton",function() {
	
	$(".rmDir").hide();
	$(".rmDir2").hide();
});

//input창 엔터치면 과목 등록완료
$(".buttonList").on("keyup",".menuInput",function(e) {
	
	let sbjNo = $(this).attr("data-sbjNo");
	console.log(sbjNo);
	let url;
	
	if(sbjNo == null){
		url = "/flyingturtle/admin/canvas/subjectWrite.do";
		if(e.keyCode==13){
			$.ajax({
				url:url,
				data:{sbjName:$(this).val(),
					 sbjNo:sbjNo},
				success:function(result){
					console.log(result,"......");
					$(this).attr("data-sbjNo",result);
					$(this).attr("sbjName",result);
					$("#minusButton").show();
					getSubjectList(result);

					
				}
			});
		}
	}else{
		url = "/flyingturtle/admin/canvas/subjectUpdate.do";
		
	if(e.keyCode==13){
		$.ajax({
			url:url,
			data:{sbjName:$(this).val(),
				 sbjNo:sbjNo},
			success:function(result){
				console.log(result,"......");
				$(this).attr("data-sbjNo",result);
				$(this).attr("sbjName",result);
				$("#minusButton").show();
				getSubjectList(result);

				
			}
		}),	$.ajax({
			url:"/flyingturtle/admin/canvas/canvaschangedirf.do",
			data:{newFilename:$(this).val(),
				 sbjNo:sbjNo},
			success:function(){
				console.log("대과목 경로 바뀜");
		}});
	}
	}
});
// 과목명 더블클릭 시 수정 가능
$(".buttonList1").on("dblclick",".menuInput", function() {

    let menu = $(".menuInput").val();
    if (menu != null) {    
        $(".menuInput").attr("readonly", false);
        return;
    }
});

//소과목명 더블클릭 시 수정 가능
$(".buttonList1").on("dblclick",".smallSubject", function() {
	
	let menu = $(".smallSubject").val();
	if (menu != null) {    
		$(".smallSubject").attr("readonly", false);
		return;
	}
});


//소과목 엔터치면 등록
$(".buttonList").on("keyup",".smallSubject",function(e) {
	
	
	
	let sbjNo = $(this).attr("data-sbjNo");
	console.log("소과목sno:"+sbjNo);
	
	let ssbjNo = $(this).attr("data-no");
	console.log("소과목ssno:"+ssbjNo);

	let ssbjName =  $(this).attr("data-name");
	console.log("소과목sno:"+ssbjName);
	
	let url;
	
	if(ssbjNo == null){
		url = "/flyingturtle/admin/canvas/smallSubjectWrite.do";
		if(e.keyCode==13){
		$.ajax({
			url:url,
			data:{
				ssbjName:$(this).val(),
				sbjNo:$(this).attr("data-sbjNo")
			},
			success:function(result){
				$(this).attr("data-no", result);
				$(this).attr("proc", true);
				$("#dic-title").attr("data-no",result);
				console.log("result다 ", $(this), result);
				getSubjectList(result);
				$(".first-page").hide();
				$("main").show();
			}
		});
		}
	}else{
		url = "/flyingturtle/admin/canvas/smallSubjectUpdate.do";

	
	if(e.keyCode==13){
		
		$.ajax({
			url:"/flyingturtle/admin/canvas/canvaschangedirs.do",
			data:{newFilename:$(this).val(),
				ssbjName:ssbjName,
				 sbjNo:sbjNo,
				 ssbjNo:ssbjNo},
			success:function(result){
				console.log("소과목 경로 바뀜:"+result);
		}}),
		$.ajax({
			url:url,
			data:{
				ssbjName:$(this).val(),
				ssbjNo:ssbjNo,
				sbjNo:$(this).attr("data-sbjNo")
			},
			success:function(result){
				$(this).data("data-no", result);
				$(this).data("proc", true);
				$("#dic-title").attr("data-no",result);
				console.log("result다 ", $(this), result);
				getSubjectList(result);

			
			}
		});
	}
  }
});




//과목 추가
var num = 0;
$(".buttonList").on("click","#addButton",function() {
    num++;    
    $(this).parent().parent().append("<li>"
    + "<button class='sideMenu'><input class='menuInput' type='text' name ='menu' placeholder='과목 작성' readonly></button>"
    +" <span class='ddBtn'>+</span>"
    +" <ul class='dropdown'>"
    +"</ul>"   
    +" </li>");
    $(".ddBtn").hide();
    
});

//$("body").on("mouseover",".sideMenu",function() {
//    $(this).next().show();
//});
//$("body").on("mouseout",".sideMenu",function() {
//    $(this).next().hide();
//});

//+버튼 누르면 소과목 버튼 생김
$(".buttonList").on("click",".ddBtn",function() {
	$(this).next().next().show();
	let isproc = false;
	$(this).next().find('li').each(function(){
		if($(this).data("proc") == false) isproc=true;
	});
	if(isproc){alert("입력후 추가해주세요");return}
	
	let sbjNo = $(this).prev().children().attr("data-sbjNo");
    $(this).next().next().append("<li data-proc='false'><div class='childMenu'>" +
    		"<input class='smallSubject' type='text' name ='menu' placeholder='소과목 작성' data-sbjNo="+ sbjNo + ">" +
    		"</div>" +
    		"</li>"
    );
    var $this = $(this).next().children().find('button');
    $(this).next().show();

});

//소과목 버튼 나타나고 사라지는 기능
$(".buttonList").on("mouseover",".smallSubject",function() {
    $(this).next().show();
});
$(".buttonList").on("mouseover",".childMenu",function() {
    $(this).children().show();
});
$(".buttonList").on("mouseout",".smallSubject",function() {
    $(this).next().hide();
});
$(".buttonList").on("mouseout",".childMenu",function() {
    $(this).children().next().hide();
});

/*================================================================================메뉴삭제+실제 폴더 디렉토리 전부 삭제*/
//소과목버튼 누르면 삭제하겠냐는 멘트와 함께 삭제됨
	function removeBtn(subno,ssubno) {
		
		let result = confirm("삭제하시겠습니까?");
		let delObj = $("#rm"+ssubno).parent().parent();
		if(result){
			$.ajax({
				url:"/flyingturtle/admin/canvas/canvasRemoveDir.do",
				data:{
					"sbjNo":subno,
					"ssbjNo":ssubno
				},
				success:function() {
					console.log("폴더삭제 성공");
				}
			}).done(
			$.ajax({
				url:"/flyingturtle/admin/canvas/smallSubjectDelete.do",
				data:{
					"ssbjNo":ssubno
				},
				success:function() {
					delObj.remove();
					console.log("디비삭제 성공");
				}
			}));
			$(".rmDir").hide();
			$(".rmDir2").hide();
		}
	}

//대과목버튼 누르면 삭제하겠냐는 멘트와 함께 삭제됨
	function removeBtnBig(subno,subname) {
		
		let result = confirm("삭제하시겠습니까?");
		let delObj = $("#rm"+subno).parent();
		if(result){
			$.ajax({
				url:"/flyingturtle/admin/canvas/canvasRemoveDirBig.do",
				data:{
					"sbjName":subname,
					"sbjNo":subno
				},
				success:function() {
					console.log("폴더삭제 성공");
				}
			}).done(
			$.ajax({
				url:"/flyingturtle/admin/canvas/subjectDelete.do",
				data:{
					"sbjNo":subno
				},
				success:function() {
					delObj.remove();
					console.log("디비삭제 성공");
				}
			}));
			$(".rmDir").hide();
			$(".rmDir2").hide();
		}
	}
/*===================================================================이미지 누르면 크게보기*/
var images = document.getElementById('thumbBox').getElementsByTagName('img')
document.getElementById('thumbBox').onclick = changeImage;

for (var i = 0; i < images.length; i++){
  images[i].onmouseover = function () { 
    this.style.cursor = 'hand'; 
  }; 
  images[i].onmouseout = function () { 
    this.style.cursor = 'pointer';
  }
}

function changeImage(event){
  event = event || window.event
  var targetElement = event.target || event.srcElement
  if (targetElement.tagName == 'IMG') document.getElementById('mainImage').src = targetElement.getAttribute('src')
}