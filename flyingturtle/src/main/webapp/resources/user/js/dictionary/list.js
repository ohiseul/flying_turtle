$(document).ready( function() {
	$('head').append(
			`<link rel="stylesheet" type="text/css" href="/flyingturtle/resources/user/css/dictionary/list.css">
			 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" 
			 integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" 
			 crossorigin="anonymous">`
	);
	$("main").hide();	// editorJS 숨기기
	
//	$(".dropdown").on("click", ".childMenu", getWordDictionary);	// 소과목 선택시 해당 내용 가져오기

	$(".buttonList ul > li").hide();	//	과목 하위메뉴 접은 상태로 로딩
	
	//	과목 클릭시 하위 메뉴 펼치기
	$(document).on("click", ".sideMenu", function() {
        $(this).children().attr("readonly", true);

        var $this = $(this).parent().find('li');
        $(".buttonList ul > li").not($this).slideUp(100);
        $this.slideToggle(200);
    });
	
	//	소과목 추가 버튼
    $(document).on("mouseover",".ddBtn",function() {
    	$(this).show();
    });
    //	소과목 추가 버튼	숨기기
    $(document).on("mouseout",".ddBtn",function() {
        $(this).hide();
    });
    
    //	소과목명 클릭시 == 용어사전 title
	$(".dropdown").on("click",".childMenu",function() {
		$this = $(this).children();
		$("#dic-title").text( $this.val() );						// 소과목 용어사전 title로 
		$(".first-page").hide();									// 용어사전 첫 페이지 숨기기
	    $("main").show();											// editor JS 보이기
	});
	
});


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
	    	"<ul class='dropdown'></ul>" +
	   "</li>"
	);
    $(".ddBtn").hide();
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
$(".buttonList").on("keyup",".menuInput",function(e) {
	if(e.keyCode == 13) {
		$.ajax({
			url : "user/dictionary/subjectWrite.do",
			data: {
				sbjName : $(this).val(),
				sbjNo : $(this).attr("data-sbjNo")
			}
		})
		.done(function (result) {
			$(this).attr("data-sbjNo", result);
			
		});
	};
});


// 소과목 추가(화면)
$(".buttonList").on("click",".ddBtn",function() {
	let sbjNo = $(this).prev().children().attr("data-sbjNo");
	
    $(this).next().append(
    		"<li><button class='childMenu'>" +
    		"<input class='smallSubject' type='text' name ='menu' placeholder='소과목 작성' " +
    		"  data-sbjNo="+ sbjNo + ">" +
    		"<span class='removeBtn'>-</span>" +
    		"</button>" +
    		"</li>"
    );
    
    var $this = $(this).next().children().find('button');
    $(this).next().show();
    $(".removeBtn").hide();
});

// 소과목명 더블클릭 - 수정 가능
$(".buttonList1").on("dblclick",".smallSubject",function() {
    let smallMenu = $(".smallSubject").val();
    
    if(smallMenu != null){
        $(".smallSubject").attr("readonly",false);
        return;
    }
});

// 소과목명 수정(db 저장) + editorJS 생성 DB저장.
$(".buttonList").on("keyup",".smallSubject",function(e) {
	console.log("key up - 소과목");
	
	let url;
	let $thisVal = $(this).val();
	let ssbjNo = $(this).attr("data-ssbjNo");	// 이미 생성된 곳엔 ssbjNo번호 존재
	
	console.log( "과목번호 sbjNo ::::", $(this).attr("data-sbjNo"));
	console.log( "data-ssbjNo :: 존재하는 경우만 ::", ssbjNo);
	console.log("$thisVal // ", $thisVal);
	
	if(ssbjNo == null) {
		url = "user/dictionary/smallSubjectWrite.do";
	} else {
		url = "user/dictionary/smallSubjectUpdate.do";
	};
	console.log("url : ", url);
	
	if(e.keyCode==13){
		$.ajax({
			url : url,
			data:{
				ssbjName : $(this).val(),
				sbjNo : $(this).attr("data-sbjNo")
			},
			success:function(result) {
				$(this).val( $thisVal );
				$(this).data("data-ssbjNo", result);		// 소과목 번호 속성 부여
				
				$("#dic-title").text( $thisVal );			// 소과목 용어사전 에디터 title로
				$("#editorjs").attr("data-ssbjNo", result);	// editor에 소과목 번호 속성 부여
			}
		});
	}
});
















/**
	처음 소과목 클릭시 에디터JS content가 존재하는 상황이라면
	db에서 가져와 data:에 값을 넣어 출력할때
	데이터가 없으면 data:null이 되어 예외가 발생할 것.
	>> 없는 상황이라면 그냥 editorJS 화면 뿌려주기..
	
	없는 상황 기준?
	소과목을 클릭할때 넣어주는 속성값 data-ssbjNo가 있는지 없는지 확인한다.
 */


function getWordDictionary() {
	alert("용어사전 db체크");
	
	let ssbjNo = $("#editorjs").attr("data-ssbjNo");
	
	// 용어사전 내용 없는 상황
	if(ssbjNo == 0 || ssbjNo == null || ssbjNo == undefined) {
		initEditor({});
		return;
	}
	// 존재
	$.ajax({
		url : "user/dictionary/selectdic.do",
		data : {
			ssbjNo
		}
	})
	.done(function(dic) {
		console.dir("dic : ", dic);
		initEditor(dic.content);
	});
	return;
};


let editor;
function initEditor(data) {
	
	editor = new EditorJS({
	    holderId: 'editorjs',
	    autofocus: true,
	    tools: {
	        warning: 
	        {
	            class: Warning,
	            inlineToolbar: true,
	            shortcut: 'CMD+SHIFT+W',
	            config: {
	                titlePlaceholder: 'Title',
	                messagePlaceholder: 'Message',
	            }
	        },
	        raw: RawTool,
	        header: 
	        {
	            class: Header,
	            inlineToolbar: ['link']
	        }, 
	        checklist: 
	        {
	            class: Checklist,
	            inlineToolbar: true
	        },
	        linkTool:
	        {
	            class: LinkTool,
	            config: {
	                endpoint: 'http://127.0.0.1:5500', // Your backend endpoint for url data fetching
	            }
	        },
	        marker: 
	        {
	            class: Marker,
	            shortcut: 'ALT+M'
	        },
	        list: 
	        {
	            class: List,
	            inlineToolbar: ['link', 'bold']
	        },
	        data: data
	    }
	});
};

/* editorJS 저장 	*/
let saveBtn = document.querySelector("#save-btn");
saveBtn.addEventListener("click", function () {
	console.log("클릭");
    console.dir(editor);
    editor.save().then((outputData) => {
//      console.log("Article data : ", outputData);
//      console.log(JSON.stringify(outputData));
    	
        $.ajax({
        	method : "post",
        	dataType : "json",
        	url : "user/dictionary/insert.do",
        	data : {
        		ssbjNo : $("#editorjs").attr("data-ssbjNo"),
        		content: JSON.stringify(outputData)
        	}
        })
        .done(function (result) {
        	console.log("db저장");
        });
    }).catch((error) => {
        console.log("Saving failed : ", error);
    });
});