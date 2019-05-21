$(document).ready( function() {
	$('head').append(
			`<link rel="stylesheet" type="text/css" href="/flyingturtle/resources/user/css/dictionary/list.css">
			 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" 
			 integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" 
			 crossorigin="anonymous">`
	);
	$("main").hide();	// editorJS 숨기기
	
	getSubjectList();	//등록된 과목명 불러오기
	
	$(".dropdown").on("click", ".childMenu", getWordDictionary);	// 소과목 선택시 해당 내용 가져오기
	
	$(document).on("click", ".sideMenu", function(){
        //e.preventDefault();
        $(this).children().attr("readonly",true);

        var $this = $(this).parent().find('ul');
        $(".buttonList ul").not($this).slideUp(100);
        $this.slideToggle(200);
    });
	
    $(document).on("mouseover",".ddBtn",function() {
        $(this).show();
    });
    $(document).on("mouseout",".ddBtn",function() {
        $(this).hide();
    });
});


//처음 로딩 시 전체 메뉴 목록 가져오기
function getSubjectList(){
	$.ajax({
        url:"admin/dictionary/menulist.do",
		success:function(result) {
			alert("전체 목록");
			html ="";
			for(let i=0; i<result.length ; i++) {
				console.log(result.length);
				let data = result[i];
				html +=`<li>
							<button class='sideMenu'>
								<input class='menuInput' data-sbjNo=${data.sbjNo} type='text' name ='menu' readonly value="${data.sbjName}">
							</button>
							<span class='ddBtn'>+</span>
							<ul class='dropdown'>
								<li>
									<button class='childMenu'>
										<input class='smallSubject' data-no=${data.ssbjNo} data-sbjNo=${data.sbjNo} type='text' name ='menu' value="${data.ssbjName}">
										<span class='removeBtn'>-</span>
									</button>
								</li>
							</ul>
						</li>`
			}
			$(".buttonList").append(html);
		}
	});
};

// 과목명 더블클릭 시 수정 가능
$(".buttonList1").on("dblclick",".menuInput", function() {
	$.ajax({
		url:"admin/dictionary/subjectwrite.do",
		data:"subName="+$(this).val(),
		success:function(){
		}
	});

	let menu = $(".menuInput").val();
	if (menu != null) {    
		$(".menuInput").attr("readonly", false);
		return;
	}
});

// 소과목명 버튼 더블클릭 시 수정 가능
$(".buttonList1").on("dblclick",".smallSubject",function() {
    let smallMenu = $(".smallSubject").val();
    console.log("smallMenu",smallMenu);
    
    if(smallMenu != null) {
        $(".smallSubject").attr("readonly",false);
        return;
    }
});

var num = 0;
$("#addButton").click(function() {
    num++;    
    $(this).parent().parent().append("<li>"
    + "<button class='sideMenu'><input class='menuInput' type='text' name ='menu' placeholder='과목 작성' readonly></button>"
    +" <span class='ddBtn' id='menu"+num+"'>+</span>"
    +" <ul class='dropdown'>"
    +"</ul>"   
    +" </li>");
    $(".ddBtn").hide();
});


$("body").on("mouseover",".sideMenu",function() {
    $(this).next().show();
});
$("body").on("mouseout",".sideMenu",function() {
    $(this).next().hide();
});

$(".buttonList").on("click",".ddBtn",function() {
	$(this).next().append(
    		`<li>
	    		<button class='childMenu'>
	    			<input class='smallSubject' type='text' id="" name ='menu' placeholder='소과목 작성'>
	    		</button>
    		</li>`
    );
    
    var $this = $(this).next().children().find('button');
    $(this).next().show();
    
    $(".first-page").hide();	// 용어사전 첫 페이지 숨기기
    $("main").show();			// editor JS 보이기
});



//해당 소과목에 맞는 용어사전 내용 가져오기
function getWordDictionary() {
	var dictionary = "";
		
	$.ajax({
		url : "user/dictionary/selectdic.do",
		data : "input 값",
		beforeSend() {
			if(data == null) return;
		}
	})
	.done( function(dic) {
		dictionary = dic;
	});

	/*
		Editor JS
		이미지의 경우 확장자가 이미지 확장자로 종료되어야 한다.
	*/
	const editor = new EditorJS({
	    holderId: 'editorjs',
	    
	    autofocus: true,
	    data: dictionary,
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
	    }
	});
};

/* editorJS 저장 	*/
let saveBtn = document.querySelector("#save-btn");

saveBtn.addEventListener("click", function () {
	console.log("클릭");
    console.dir(editor)
    editor.save().then((outputData) => {
//      console.log("Article data : ", outputData);
//      console.log(JSON.stringify(outputData));
        
        $.ajax({
        	method : "post",
        	dataType : "json",
        	url : "user/dictionary/insert.do",
        	data : {
        		sbjNo : "1",	   // 소과목 번호 넣어주기
        		content: JSON.stringify(outputData)
        	}
        })
        .done(function (result) {
        	// 등록 후 가져오기
        	console.log("db저장");
        	
        });
    }).catch((error) => {
        console.log("Saving failed : ", error);
    });
});