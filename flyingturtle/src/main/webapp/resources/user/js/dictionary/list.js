$(document).ready( function() {
	// css 추가
	$('head').append('<link rel="stylesheet" type="text/css" href="/flyingturtle/resources/user/css/dictionary/list.css">'
			+ '<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">'
	);
	
	// 소과목 선택시
	$.ajax({
    	dataType : "json",
    	url : "user/dictionary/list.do",
    	data : {
    		//sbjNo : ${param.subNo}
    	}
    })
    .done(function (result) {
    	
    });
	
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

// 과목명 더블클릭 시 수정 가능
$(".buttonList1").on("dblclick",".menuInput", function() {
    let menu = $(".menuInput").val();
    if (menu != null) {    
        $(".menuInput").attr("readonly", false);
        return;
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
$(".buttonList").on("click",".childMenu",function() {
    $(".smallSubject").attr("readonly",true);

});


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
    
    // 소과목 생성시 editor JS 생성
    $(".content").html(
    		`<main>
      			<div id='dic-title'><span >소과목 타이틀</span></div>
	          	<div id="editorjs"></div>
	          	<div class="btn-area">
	            	<button id="save-btn">저장</button>
	          	</div>
          	</main>`
    );
    
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
//saveBtn.addEventListener("click", function () {
$(document).on("click", saveBtn,function () {
	console.log("클릭");
    console.dir(editor)
    editor.save().then((outputData) => {
//        console.log("Article data : ", outputData);
//        console.log(JSON.stringify(outputData));
        
        $.ajax({
        	method : "post",
        	dataType : "json",
        	url : "user/dictionary/insert.do",
        	data : {
        		sbjNo : "1",	// 소과목 번호 넣어주기
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