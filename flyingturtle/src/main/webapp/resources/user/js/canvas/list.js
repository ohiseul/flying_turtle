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
        url:"/flyingturtle/user/canvas/menulist.do",
        dataType:"json",
		success:function(result) {
			
			html ="";
			html +=`
				</ul> `;
			for(let i=0; i < result.sbj.length ; i++) {
				let data = result.sbj[i];
				html +=`<li>
							<div class='sideMenu'><input class='menuInput' id="menuInput${data.sbjNo}"  data-sbjNo=${data.sbjNo} type='text' name ='menu' readonly value="${data.sbjName}">
							</div>
							<ul class='dropdown'>`;
				for(let j = 0; j<result.ssbj.length;j++){		
					let smallData = result.ssbj[j];
					if(data.sbjNo == smallData.sbjNo ){
					html+=	`<li>
								<div class='childMenu'><input class='smallSubject' id="smallSubject${smallData.ssbjNo}" data-no=${smallData.ssbjNo} data-sbjNo=${smallData.sbjNo} data-name=${smallData.ssbjName} type='text' name ='menu' value="${smallData.ssbjName}"readonly>
									<span class="plDir" onclick="canvasmove('menuInput${data.sbjNo}','smallSubject${smallData.ssbjNo}')">go</span>
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
		}
	});
}

$(".buttonList").on("click","#minusButton",function() {

	alert("마이너스나타남");
	$(".ddBtn").hide();
	$(".rmDir").show();
	$(".rmDir2").show();
    
});
$(".buttonList").on("click","#addButton",function() {
	
	alert("플러스나타남");
	$(".rmDir").hide();
	$(".rmDir2").hide();
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