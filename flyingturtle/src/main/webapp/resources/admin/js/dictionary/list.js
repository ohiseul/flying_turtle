$(document).ready( function() {
	// css 추가
	$('head').append('<link rel="stylesheet" type="text/css" href="/flyingturtle/resources/admin/css/dictionary/list.css">'
			+ '<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">'
	);
	
	//등록된 과목명 불러오기
	getSubjectList();
	
	
	
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
    // $(document).on("click",".sideMenu",function() {
    //     $(this).children().addClass("inputFocus");
    // });
});


// 처음 로딩 시 전체 메뉴 목록 가져오기
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
							<button class='sideMenu'><input class='menuInput' type='text' name ='menu' readonly value="${data.sbjName}"></button>
							<span class='ddBtn'>+</span>
							<ul class='dropdown'>
								<li>
								<button class='childMenu'><input class='smallSubject' type='text' name ='menu' value="${data.ssbjName}"></button>
								</li>
							</ul>
						</li>`
			}
			$(".buttonList").append(html);
		}
	});
}

// 과목명 더블클릭 시 수정 가능
$(".buttonList1").on("dblclick",".menuInput", function() {

    let menu = $(".menuInput").val();
    if (menu != null) {    
        $(".menuInput").attr("readonly", false);
        return;
    }
});

//input창 엔터치면 과목 등록완료
$(".buttonList").on("keyup",".menuInput",function(e) {
	if(e.keyCode==13){
		// 과목명 등록하기 ajax넣기
		$.ajax({
//			type:"post",
			url:"admin/dictionary/subjectWrite.do",
			data:"sbjName="+$(this).val(),
			success:function(result){
			}
		});
	}
});
$(".buttonList").on("keyup",".smallSubject",function(e) {
	if(e.keyCode==13){
		// 과목명 등록하기 ajax넣기
		$.ajax({
//			type:"post",
			url:"admin/dictionary/smallsubjectWrite.do",
			data:"ssbjName="+$(this).val(),
			success:function(result){
				
			}
		});
	}
});


//소과목명 버튼 더블클릭 시 수정 가능
$(".buttonList1").on("dblclick",".smallSubject",function() {
    let smallMenu = $(".smallSubject").val();
    console.log("smallMenu",smallMenu);
    
    if(smallMenu != null){
        $(".smallSubject").attr("readonly",false);
        return;
    }

});
//소과목명 클릭 시 editorJS나와야함
//$(".buttonList").on("click",".childMenu",function() {
//    $(".smallSubject").attr("readonly",true);
//
//});


var num = 0;
$(".buttonList").on("click","#addButton",function() {
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
    $(this).next().append("<li><button class='childMenu'><input class='smallSubject' type='text' name ='menu' placeholder='소과목 작성'></button></li>")
    var $this = $(this).next().children().find('button');
    $(this).next().show();
    // // var $this = $(this).parent().find('ul');
    // // $(".dropdown button").not($this).slideUp(200);
    // $(this).next().slideDown(200);
});













/*
    Editor JS
    이미지의 경우 확장자가 이미지 확장자로 종료되어야 한다.
*/ 
const editor = new EditorJS({
    holderId: 'editorjs',
    
    autofocus: true,
//    data: "db에서 가져온 데이터",
    tools: {
        warning: {
            class: Warning,
            inlineToolbar: true,
            shortcut: 'CMD+SHIFT+W',
            config: {
                titlePlaceholder: 'Title',
                messagePlaceholder: 'Message',
            },
        },
        image: {
            class: ImageTool,
            config: {
                endpoints: {
                byFile: 'http://localhost:8008/uploadFile', // Your backend file uploader endpoint
                byUrl: 'http://localhost:8008/fetchUrl', // Your endpoint that provides uploading by Url
                }
            }
        },         
        table: {
            class: Table,
            inlineToolbar: true,
            config: {
                rows: 2,
                cols: 3,
            },
        },                       
        quote: Quote,
        image: {
            class: ImageTool,
            config: {
                uploader: {
                    uploadByFile(file){

                        function imgUpload() {
                            console.dir(file);
                            let fileData = new FormData();
                                fileData.append("attach", file);    

                            return new Promise(function (resolve, reject) {
                                /*
                                $.ajax({
                                    url: 'http://localhost:....', 
                                    data: fileData,
                                    success: function (response) {
                                        resolve({
                                            cnt: 1,
                                            url: 'https://codex.so/upload/redactor_images/o_80beea670e49f04931ce9e3b2122ac70.jpg'
                                        });
                                    },
                                    error: function () {
                                        reject(new Error("imgUpload 실패함"));
                                    }
                                });
                                */
                            });
                        }
                        return imgUpload().then((result) => {
                            alert("업로드 성공함");
                            console.dir(result);
                            return {
                                success: result.cnt,
                                file: {
                                    url: result.url
                                }
                            };
                        });
                    }
                }
            }
        },            
        raw: RawTool,
        header: {
            class: Header,
            inlineToolbar: ['link']
        }, 
        checklist: {
            class: Checklist,
            inlineToolbar: true,
        },
        linkTool: {
            class: LinkTool,
            config: {
                endpoint: 'http://127.0.0.1:5500', // Your backend endpoint for url data fetching
            }
        },
        marker: {
            class: Marker,
            shortcut: 'ALT+M'
        },
        list: {
            class: List,
            inlineToolbar: ['link', 'bold']
        },
        embed: {
            class: Embed,
            inlineToolbar: false,
            config: {
                services: {
                    youtube: true,
                    coub: true
                }    
            }
        }
    }
});


    
/* editorJS 저장 */
let saveBtn = document.querySelector("#save-btn");
saveBtn.addEventListener("click", function () {
    console.dir(editor)
    editor.save().then((outputData) => {
//        console.log("Article data : ", outputData);
//        console.log(JSON.stringify(outputData));
        
        $.ajax({
        	method : "post",
        	dataType : "json",
        	url : "user/dictionary/insert.do",
        	data : JSON.stringify(outputData)
        })
        .done(function () {
        	// 등록 후 가져오기
        	console.log("db저장");
        });
        
    }).catch((error) => {
        console.log("Saving failed : ", error);
    });
});