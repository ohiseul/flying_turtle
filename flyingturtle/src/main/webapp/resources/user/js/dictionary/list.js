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
    if(isproc){swal("과목을 작성해주세요");return}
    buttonList.find(".scroll").append(
		"<li data-pro='false' class='pro'>" +
    		"<div class='sideMenu'>" +
	    		"<input class='menuInput' type='text' name ='menu' placeholder='과목 작성' readonly>" +
	    		"</div>" +
	    	"<span class='msBtn' style='display=none;' id='del"+num+"'><i class='far fa-minus-square'></i></span>"+
	    	"<span class='ddBtn' id='menu"+num+"'><i class='fas fa-plus-square'></i></span>" +
	    	"<ul class='dropdown'></ul>" +
	   "</li>"
	);
});

// 과목명 더블클릭 - 수정 가능
$(".buttonList1").on("dblclick",".menuInput", function() {
	let menu = $(".menuInput").val();
	if (menu != null) {
		$(".menuInput").attr("readonly", false);
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
			$("li[class='pro']").removeClass("pro").addClass("comm");
			 swal("과목명 등록 성공", "You clicked the button!", "success");
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
			 swal("과목 삭제 완료", "You clicked the button!", "success");
			 delBtn.css("display","none");
			 addBtn.css("display","block");
		}
	});
});


// 소과목 추가(화면)
$(".buttonList").on("click",".ddBtn",function() {
	let isproc = false;
	$(this).next().find('li').each(function() {
		if($(this).hasClass("proc")) isproc=true;
	});
	if(isproc){swal("소과목을 작성해주세요"); return}
	let sbjNo = $(this).prev().prev().children().attr("data-sbjNo");
    
	$(this).next().append(
    		"<li data-proc='false' class='proc'><div class='childMenu'>" +
    		"<input class='smallSubject' type='text' name ='menu' placeholder='소과목 작성' " +
    		"  data-sbjNo="+ sbjNo + " readonly />" +
    		"</div>" +
    		"</li>"
    );
    var $this = $(this).next().children().find('button');
    $(this).next().show();
});

// 소과목명 더블클릭 - 수정 가능
$(".buttonList1").on("dblclick",".smallSubject",function() {
    let smallMenu = $(".smallSubject").val();
    if(smallMenu != null) {
        $(".smallSubject").attr("readonly", false);
        return;
    }
});

// 소과목명 수정(db 저장) + editorJS 생성 DB저장.
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
				$this.val( $thisVal );
				$this.data("data-ssbjNo", result);			// 소과목 번호 속성 부여
				$this.after("<span class='go'style='z-index: 99;'><i class='fas fa-angle-double-right'></i></span>"+
				"<span class='removeBtn'>-</span>");
				 swal("소과목 작성 완료", "You clicked the button!", "success");
				$("#dic-title").text( $thisVal );			// 소과목 용어사전 에디터 title로
				$("li[class='proc']").removeClass("proc").addClass("com");
				$this.attr("data-ssbjNo",result);
				$("#editorjs").attr("data-ssbjNo", result);	// editor에 소과목 번호 속성 부여
			}
		});
	}
});

//소과목 클릭시 - 에디터제이에스 불러오기
$(".dropdown").on("click", ".go", function() {
	thisCh = $(this).prev();
	$(this).parent().css('background','#97c1e8');

	$("#editorjs").attr("data-ssbjNo", thisCh.attr("data-ssbjNo"));
	$("#dic-title").text( thisCh.val() );	
	
	getWordDictionary();
});

//소과목버튼 누르면 삭제하겠냐는 멘트와 함께 삭제됨
$(".buttonList").on("click",".removeBtn",function() {
	let result = confirm("삭제하시겠습니까?");
	let ssbjNo = $(this).prev().prev().attr("data-ssbjNo");
	let delObj = $(this).parent().parent();
	
	if(result) {
		$.ajax({
			url:"smallSubjectDelete.do",
			data: {
				ssbjNo
			},
			success:function(result) {
				delObj.remove();
				$("main").hide();
				$(".first-page").show();
				swal("소과목 삭제 완료", "You clicked the button!", "success");
			}
		});
	}
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
		 swal("소과목을 등록해 주세요!");
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
        	swal("용어사전 등록!", {
				  buttons: false,
				  timer: 2000,
			});
        });
        
    }).catch((error) => {
        swal("다시 시도해 주세요!");
    });
});