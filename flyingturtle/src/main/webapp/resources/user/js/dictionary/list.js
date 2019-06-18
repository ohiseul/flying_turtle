$(document).ready( function() {
	$("main").hide();					// editorJS 숨기기
	$(".buttonList ul > li").hide();	// 과목 하위메뉴 접은 상태로 로딩
	$(".go").hide();
	$(".removeBtn").hide();
});

$(document).on("mouseover",".sideMenu", function() {
				/*$(this).next().show();*/	// 소과목 추가 버튼 보이기
			})
			.on("mouseout",".sideMenu", function() {
//				$(this).next().hide();	// 소과목 추가 버튼 숨기기
			})
			.on("click", ".sideMenu", function() {
				//	과목 클릭시 하위 메뉴 펼치기
				$(this).children().attr("readonly", true);
				
				var $this = $(this).parent().find('li');
				$(".buttonList ul > li").not($this).slideUp(100);
				$this.slideToggle(200);
			})


// 과목 추가(화면)
var num = 0;
$("#addButton").click(function() {
    num++;
    $(this).parent().parent().append(
		"<li>" +
    		"<div class='sideMenu'>" +
	    		"<input class='menuInput' type='text' name ='menu' placeholder='과목 작성' readonly>" +
	    		"</div>" +
	    	"<span class='ddBtn' id='menu"+num+"'>+</span>" +
	    	/*"<span class='msBtn' style='display=none;' id='del"+num+"'>-</span>"+*/
	    	"<ul class='dropdown'></ul>" +
	   "</li>"
	);
    /*$(".ddBtn").css("display","block");*/
    
   

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
			 swal("과목명 등록 성공", "You clicked the button!", "success");
		});
	};
});

//- 버튼 눌렀을 때 +버튼이 -로 바뀌게
$("#minusButton").click(function(){
	let addBtn = $(this).parent().nextAll().find(".ddBtn");
	addBtn.css("display","none");
	
	let delBtn = $(this).parent().nextAll().find(".msBtn");
	delBtn.css("display","block");
});
$(".buttonList").on("click",".msBtn",function(){
	let sbjNo = $(this).prev().children().attr("data-sbjno");
	console.log(sbjNo);
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
	
	let sbjNo = $(this).prev().prev().children().attr("data-sbjNo");
    
	$(this).next().append(
    		"<li><div class='childMenu'>" +
    		"<input class='smallSubject' type='text' name ='menu' placeholder='소과목 작성' " +
    		"  data-sbjNo="+ sbjNo + " readonly />" +
    		"<span class='go'> go </span>" +
    		"<span class='removeBtn'>-</span>" +
    		"</div>" +
    		"</li>"
    );
   /* $(".msBtn").css("display","none");*/
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
				console.log("result",result);
				$this.val( $thisVal );
				$this.data("data-ssbjNo", result);			// 소과목 번호 속성 부여
				
				$("#dic-title").text( $thisVal );			// 소과목 용어사전 에디터 title로
				
				console.log("에디터에 붙일 소과목번호 : ", result);
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

	console.log("go 클릭시 :: ", thisCh.val());
	$("#editorjs").attr("data-ssbjNo", thisCh.attr("data-ssbjNo"));
	$("#dic-title").text( thisCh.val() );
	
	getWordDictionary();
});

//소과목버튼 누르면 삭제하겠냐는 멘트와 함께 삭제됨
$(".buttonList").on("click",".removeBtn",function() {
	let result = confirm("삭제하시겠습니까?");
	let ssbjNo = $(this).prev().prev().attr("data-ssbjNo");
	console.log("ssbjNo ? ", ssbjNo);
	
	let delObj = $(this).parent().parent();
	
	if(result) {
		$.ajax({
			url:"smallSubjectDelete.do",
			data: {
				ssbjNo
			},
			success:function(result) {
				delObj.remove();
				console.log("삭제 성공");
				 swal("소과목 삭제 완료", "You clicked the button!", "success");
				$("main").hide();
				$(".first-page").show();
				
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
	소과목 db 저장시 editorJS 생성해 db에 같이 넣어주는 작업 완료..
	
	어떻게 조회할 것인지?
	소과목 클릭시 무조건 에디터제이에스 불러오기
 */

// db - 에디터 제이에스 불러오기
function getWordDictionary() {
	
	let ssbjNo = $("#editorjs").attr("data-ssbjNo");
	
	if(ssbjNo == null) {
		 alert("소과목을 등록해 주세요!");
		return;
	}
	
	$.ajax({
		url : "selectdic.do",
		data : {
			ssbjNo
		}
	})
	.done(function(dic) {						// db에서 용어사전 객체 넘어옴.
		console.log("db에서 넘어온 dic객체 : ", dic);
		
		if (dic.content == null) {
			console.log("content == null");
			initEditor();						// editor js
		} else {
			console.log("content <> null");
			initEditor(dic.content);			// editor js
		}
		
		$(".first-page").hide();
	    $("main").show();
	});
};


let editor;
function initEditor(data) {
	$("#editorjs").html("");
//	console.log(typeof data);
	
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
	console.log("클릭");
    console.dir(editor);
    editor.save().then((outputData) => {
      console.log("Article data : ", outputData);
      console.log(JSON.stringify(outputData));
    	
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
        	console.log("등록 성공==============================================================");
        	
        	swal("용어사전 등록!", {
				  buttons: false,
				  timer: 2000,
			});
        	
        });
        
    }).catch((error) => {
        console.log("Saving failed : ", error);
    });
});
