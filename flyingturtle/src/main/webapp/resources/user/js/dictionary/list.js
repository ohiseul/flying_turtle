$("main").hide();					// editorJS 숨기기
$(".buttonList ul > li").hide();	// 과목 하위메뉴 접은 상태로 로딩
$(".go").hide();
$(".removeBtn").hide();

$(document).on("click", ".sideMenu", function() {
	let dropdownUl = $(this).next().next().next();
	dropdownUl.find("li[class='proc']").remove();
	if (dropdownUl.find("li:last").prev().css("display") == "none") {
		dropdownUl.find("li[class='com']").removeClass("com").hide();
	} else {
		dropdownUl.find("li[class='com']").removeClass("com").show();
	}
				//	과목 클릭시 하위 메뉴 펼치기
				$(this).children().attr("readonly", true);
				
				var $this = $(this).parent().find('li');
				$(".buttonList ul > li").not($this).slideUp(100);
				$this.slideToggle(200);
			});

// 과목 추가(화면)
var num = 0;
$("#addButton").click(function() {
    num++;
    let buttonList = $(this).parent().next();
    let isproc = false;
    buttonList.children().find("li").each(function(){
    	if($(this).hasClass("pro")) isproc = true;
    });
    if(isproc){Swal.fire("과목을 작성해주세요");return}
    buttonList.find(".scroll").append(
		"<li class='pro'>" +
    		"<div class='sideMenu'>" +
	    		"<input class='menuInput' type='text' name ='menu' placeholder='과목 작성'>" +
	    		"</div>" +
	    	"<span class='msBtn' style='display=none;' id='del"+num+"'><i class='far fa-minus-square'></i></span>"+
	    	"<span class='ddBtn' id='menu"+num+"'><i class='fas fa-plus-square'></i></span>" +
	    	"<ul class='dropdown'></ul>" +
	   "</li>"
	);
    buttonList.find(".menuInput").attr("readonly",false).focus();
});

// 과목명 더블클릭 - 수정 가능
$(".buttonList1").on("dblclick",".menuInput", function() {
	let menu = $(".menuInput").val();
	if (menu != null) {
		$(this).attr("readonly", false);
		return;
	}
});

// 과목명 등록(db 저장)
$(".buttonList").on("keyup", ".menuInput",function(e) {
	let $this = $(this);
	let url;
	let sbjNo = $(this).attr("data-sbjNo");
	
	if(sbjNo == null) {
		url = "subjectWrite.do";
	} else {
		url = "subjectUpdate.do";
	}
	
	if(e.keyCode == 13) {
		$.ajax({
			url : url,
			data: {
				sbjName : $(this).val(),
				sbjNo
			}
		})
		.done(function (result) {
			$this.attr({ "data-sbjNo" : result, "readonly": true });
			$("li[class='pro']").attr("id", "subjectMenu" + result);
			$("li[class='pro']").removeClass("pro").addClass("comm");
			Swal.fire("과목명 등록 성공", "You clicked the button!", "success");
			$this.attr("readonly",true);
			
		});
	};
});

//- 버튼 눌렀을 때 +버튼이 -로 바뀌게
$("#minusButton").click(function(){
	let addBtn = $(this).parent().nextAll().find(".ddBtn");
	let delBtn = $(this).parent().nextAll().find(".msBtn");
	if(addBtn.css("display")=="block"){
		addBtn.css("display","none");
		delBtn.css("display","block");
	}
	else{
		addBtn.css("display","block");
		delBtn.css("display","none");
	}
});

$(".buttonList").on("click",".msBtn",function(){
	let sbjNo = $(this).prev().children().attr("data-sbjno");
	let delBtn = $(".msBtn");
	let addBtn = $(".ddBtn");
	$.ajax({
		url:"subjectDelete.do",
		data:{sbjNo:sbjNo},
		success:function(result){
			$("#subjectMenu"+sbjNo).remove();
			 
			 delBtn.css("display","none"); addBtn.css("display","block");
			 Swal.fire("과목 삭제 완료", "You clicked the button!", "success");
		}
	});
});


// 소과목 추가(화면)
$(".buttonList").on("click",".ddBtn",function() {
	let isproc = false;
	$(this).next().find('li').each(function() {
		if($(this).hasClass("proc")) isproc=true;
	});
	if(isproc){Swal.fire("소과목을 작성해주세요"); return}
	let sbjNo = $(this).prev().prev().children().attr("data-sbjNo");
    
	$(this).next().append(
    		"<li class='proc'><div class='childMenu'>" +
    		"<input class='smallSubject' type='text' name ='menu' placeholder='소과목 작성' " +
    		"  data-sbjNo="+ sbjNo + " readonly />" +
    		"</div>" +
    		"</li>"
    );
	$("li[class='proc'] input").attr("readonly",false).focus();
    var $this = $(this).next().children().find('button');
    $(this).next().show();
});

// 소과목명 더블클릭 - 수정 가능
$(".buttonList1").on("dblclick",".smallSubject",function() {
    let smallMenu = $(".smallSubject").val();
    if(smallMenu != null) {
        $(this).attr("readonly", false);
        return;
    }
});

// 소과목명 (db 저장) + editorJS 생성 DB저장.
$(".buttonList").on("keyup",".smallSubject",function(e) {
	let url;
	let $this = $(this);
	let $thisVal = $(this).val();
	let ssbjNo = $(this).attr("data-ssbjNo");	// 이미 생성된 곳엔 ssbjNo번호 존재
	if(e.keyCode==13){
		$.ajax({
			url : (ssbjNo == null) ? "smallSubjectWrite.do": "smallSubjectUpdate.do",
			data: (ssbjNo == null) ? 
					{ssbjName : $(this).val(), sbjNo: $(this).attr('data-sbjNo')} : 
					{ssbjName : $(this).val() ,ssbjNo:$(this).attr('data-ssbjNo')},
			success:function(result) {
				$this.attr("value",$thisVal);
				$this.data("data-ssbjNo", result);			// 소과목 번호 속성 부여
				
				if($this.next("span").length==0){
					$this.after("<span class='go'style='z-index: 99;'><i class='fas fa-angle-double-right' style='cursor : pointer'></i></span>"+
					"<span class='removeBtn'>-</span>");					
				}
				 Swal.fire("소과목 작성 완료", "You clicked the button!", "success");
				$("#dic-title").text( $thisVal );			// 소과목 용어사전 에디터 title로
				$("li[class='proc']").removeClass("proc").addClass("com");
				$this.attr("data-ssbjNo",result);
				$("#editorjs").attr("data-ssbjNo", result);	// editor에 소과목 번호 속성 부여
				$(".first-page").hide();	$("main").show();
				$this.attr("readonly",true);
				
			}
		});
	}
});

//소과목 클릭시 - 에디터제이에스 불러오기
$(".buttonList").on("click", ".go", function() {
	thisCh = $(this).prev();
	$(this).parent().css('background','#97c1e8');

	$("#editorjs").attr("data-ssbjNo", thisCh.attr("data-ssbjNo"));
	$("#dic-title").text( thisCh.val() );	
	
	$(".first-page").hide();	$("main").show();
	getWordDictionary();
});

//소과목버튼 누르면 삭제하겠냐는 멘트와 함께 삭제됨
$(".buttonList").on("click",".removeBtn",function() {
	let ssbjNo = $(this).prev().prev().attr("data-ssbjNo");
	let delObj = $(this).parent().parent();
	Swal.fire({
		title:'삭제할까요?',
		type:'question',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: 'Yes!'
	})
	.then((check) => {
		if(check.value) {
			$.ajax({
				url:"smallSubjectDelete.do",
				data: {
					ssbjNo
				},
				success:function(result) {
					delObj.remove();
					$("main").hide();
					$(".first-page").show();
					Swal.fire("소과목 삭제 완료", "You clicked the button!", "success");
				}
			});
		}
	});
});

//소과목 버튼 나타나고 사라지는 기능
$(".buttonList").on("mouseover",".smallSubject",function() {
    $(this).next().show();
});
$(".buttonList").on("mouseover",".childMenu",function() {
    $(this).children().next().show();
});
$(".buttonList").on("mouseout",".smallSubject",function() {
    $(this).next().hide();
});
$(".buttonList").on("mouseout",".childMenu",function() {
    $(this).children().next().hide();
});

/**
	db - 에디터 제이에스 불러오기
*/
function getWordDictionary() {
	let ssbjNo = $("#editorjs").attr("data-ssbjNo");
	if(ssbjNo == null) {
		 Swal.fire("소과목을 등록해 주세요!");
		return;
	}
	
	$.ajax({
		url : "selectdic.do",
		data : {
			ssbjNo
		}
	})
	.done(function(dic) {						// db에서 용어사전 객체 넘어옴.
		if (dic.content == null) {
			initEditor();						// editor js
		} else {
			initEditor(dic.content);			// editor js
		}
		$(".first-page").hide();
	    $("main").show();
	});
};


let editor;
function initEditor(data) {
	$("#editorjs").html("");
	let parseData = data;
	if(data != null) {
		parseData = JSON.parse(data);
	}
	
	editor = new EditorJS({
	    holder : 'editorjs',
	    autofocus: true,
	    data: parseData,
	    tools: {
	    	header: 
	    	{
	    		class: Header,
	    		inlineToolbar: ['link']
	    	},
	    	raw: RawTool,
	        marker:
	        {
	        	class: Marker,
	        	shortcut: 'ALT+M'
	        }, 
	        warning: 
	        {
	            class: Warning,
	            inlineToolbar: true,
	            shortcut: 'CMD+SHIFT+W',
	            config: {
	                titlePlaceholder: 'Title',
	                messagePlaceholder: 'Message',
	            }
	        }
	    }
	});
};


/* editorJS 저장 	*/
let saveBtn = document.querySelector(".btn-area>.submitBtn");
saveBtn.addEventListener("click", function () {
    editor.save().then((outputData) => {
        $.ajax({
        	method : "post",
        	dataType : "json",
        	url : "update.do",
        	data : {
        		ssbjNo : $("#editorjs").attr("data-ssbjNo"),
        		content: JSON.stringify(outputData)
        	}
        })
        .done(function (result) {
        	Swal.fire("용어사전 등록!", {
				  buttons: false,
				  timer: 2000,
			});
        });
        
    }).catch((error) => {
        Swal.fire("다시 시도해 주세요!");
    });
});