window.onload = function() {
	$('head').append('<link rel="stylesheet" type="text/css" href="/flyingturtle/resources/user/css/dictionary/list.css">'
		+ '<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">'
	);
};

$(".buttonList ul").hide();
$(".buttonList>li>.sideMenu").click(function(){
  //e.preventDefault();
  var $this = $(this).parent().find('ul');
  $(".buttonList ul").not($this).slideUp(100);
  $this.slideToggle(200);
});


/*
    Editor JS
    이미지의 경우 확장자가 이미지 확장자로 종료되어야 한다.
*/ 
const editor = new EditorJS({
    holderId: 'editorjs',

    autofocus: true,
    // data: {"time":1557295973064,"blocks":[{"type":"warning","data":{"title":"asdfasdf","message":"dasfdsaf"}},{"type":"warning","data":{"title":"","message":""}}],"version":"2.13.0"},
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
        console.log("Article data : ", outputData);
        console.log(JSON.stringify(outputData));
    }).catch((error) => {
        console.log("Saving failed : ", error);
    });
});