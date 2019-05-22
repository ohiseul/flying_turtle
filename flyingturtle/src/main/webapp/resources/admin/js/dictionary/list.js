$(document).ready( function() {
	// css 추가
	$('head').append('<link rel="stylesheet" type="text/css" href="/flyingturtle/resources/admin/css/dictionary/list.css">'
			+ '<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">'
	);
	$("main").hide();
	//등록된 과목명 불러오기
	getSubjectList();
	

//	과목명 버튼을 눌렀을 때 
    $(document).on("click", ".sideMenu", function(){
//    	소과목이 없으면 소과목을 추가해달라는 alert창 띄우기
    	
        //e.preventDefault();
        $(this).children().attr("readonly",true);

        var $this = $(this).parent().find('ul');
//        if($this.children().length == 0){
//        	alert("아직 용어사전이 없네요~소과목을 추가해볼까요?");
//        }
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
        dataType:"json",
		success:function(result) {
//			alert("전체 목록");
			console.dir(result);
			
			html ="";
			html +=`<li>
				<img id="addButton" src="/flyingturtle/resources/images/add.png" />
				</li>`;
			for(let i=0; i < result.sbj.length ; i++) {
				let data = result.sbj[i];
				html +=`<li>
							<div class='sideMenu'><input class='menuInput' data-sbjNo=${data.sbjNo} type='text' name ='menu' readonly value="${data.sbjName}"></div>
							<span class='ddBtn'>+</span>
							<ul class='dropdown'>`;
				for(let j = 0; j<result.ssbj.length;j++){		
					let smallData = result.ssbj[j];
					if(data.sbjNo == smallData.sbjNo ){
					html+=	`<li>
								<div class='childMenu'><input class='smallSubject' data-no=${smallData.ssbjNo} data-sbjNo=${smallData.sbjNo} type='text' name ='menu' value="${smallData.ssbjName}"readonly>
									<span class='removeBtn'>-</span>
								</div>
							</li>`;
					}
				}
				html += `</ul>
						</li>`;
			}
			$(".buttonList").html(html);
		}
	});
}
//input창 엔터치면 과목 등록완료
$(".buttonList").on("keyup",".menuInput",function(e) {
	
	let sbjNo = $(this).attr("data-sbjNo");
	console.log(sbjNo);
	let url;
	
	if(sbjNo == null){
		url = "admin/dictionary/subjectWrite.do";
	}else{
		console.log("수정 옴");
		url = "admin/dictionary/subjectUpdate.do";
	}
		
	if(e.keyCode==13){
		// 과목명 등록하기 ajax넣기
		$.ajax({
//			type:"post",
			url:url,
			data:{sbjName:$(this).val(),
				 sbjNo:sbjNo},
			success:function(result){
				console.log(result,"......");
				$(this).attr("data-sbjNo",result);
				$(this).attr("sbjName",result);
				getSubjectList(result);
				
			}
		});
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
	console.log($(this).val());
	
	
	if(e.keyCode==13){
		alert("엔터");
		// 과목명 등록하기 ajax넣기
		$.ajax({
//			type:"post",
			url:"admin/dictionary/smallSubjectWrite.do",
			data:{
				ssbjName:$(this).val(),
				sbjNo:$(this).attr("data-sbjNo")
			},
			success:function(result){
				$(this).data("data-no", result);
				$(this).data("proc", true);
				console.log("result다 ", $(this), result);
				getSubjectList(result);
				$(".first-page").hide();
				$("main").show();
			}
		});
	}
});



//소과목명 클릭 시 editorJS나와야함
$(".buttonList").on("click",".childMenu",function() {
    $(".smallSubject").attr("readonly",true);

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



$("body").on("mouseover",".sideMenu",function() {
    $(this).next().show();
});
$("body").on("mouseout",".sideMenu",function() {
    $(this).next().hide();
});
//+버튼 누르면 소과목 버튼 생김
$(".buttonList").on("click",".ddBtn",function() {
	let isproc = false;
	$(this).next().find('li').each(function(){
		if($(this).data("proc") == false) isproc=true;
	});
	if(isproc){alert("입력후 추가해주세요");return}
	
	let sbjNo = $(this).prev().children().attr("data-sbjNo");
    $(this).next().append("<li data-proc='false'><div class='childMenu'>" +
    		"<input class='smallSubject' type='text' name ='menu' placeholder='소과목 작성' data-sbjNo="+ sbjNo + ">" +
    		"<span class='removeBtn'>-</span>" +
    		"</div>" +
    		"</li>"
    );
    var $this = $(this).next().children().find('button');
    $(this).next().show();
    $(".removeBtn").hide();
    // // var $this = $(this).parent().find('ul');
    // // $(".dropdown button").not($this).slchl96300ideUp(200);
    // $(this).next().slideDown(200);
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