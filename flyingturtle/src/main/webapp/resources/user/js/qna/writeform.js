window.onload = function() {
	$('head').append('<link rel="stylesheet" type="text/css" href="/flyingturtle/resources/user/css/qna/write.css">');
};

/*파일업로드*/
   $(document).ready(function(){
   var fileTarget = $('.filebox .upload-hidden');

    fileTarget.on('change', function(){
        if(window.FileReader){
            // 파일명 추출
            var filename = $(this)[0].files[0].name;
        } 

        else {
            // Old IE 파일명 추출
            var filename = $(this).val().split('/').pop().split('\\').pop();
        };

        $(this).siblings('.upload-name').val(filename);
    });

    //preview image 
    var imgTarget = $('.preview-image .upload-hidden');

    imgTarget.on('change', function(){
        var parent = $(this).parent();

        if(window.FileReader){
            //image 파일만
            if (!$(this)[0].files[0].type.match(/image\//)) return;
            
            var reader = new FileReader();
            reader.onload = function(e){
                var src = e.target.result;
                $("#imgtarget").prepend('<div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div>');
            }
            reader.readAsDataURL($(this)[0].files[0]);
        }

        else {
            $(this)[0].select();
            $(this)[0].blur();
            var imgSrc = document.selection.createRange().text;
            $("#imgtarget").text('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

            var img = $(this).siblings('.upload-display').find('img');
            img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";        
        }
    });
});
   
   /*유튜브 동영상 재생*/
   function player(){
	   var addr = $("#playaddr").val().split('/');
	   var num = addr.length-1;
	   var link = addr[num];
	   var realaddr = null;
	   alert(addr[3]+"::"+addr[2]+"::"+addr[num]);
	 if(addr[3]+':contains(you)'){
	    realaddr=`https://www.youtube.com/embed/`+link;
	 }else{
	   alert("유효하지 않은 주소입니다.");
	 }
	   $("#playbox").html(`<div style="position: relative; max-width: 100%; padding-bottom: 56.25%; height: 0;"><iframe width="320" height="180" src="`+realaddr+`" frameborder="0" allowfullscreen="" style="position: absolute; position: absolute; top: 0; left: 0; width: 100%; height: 100%;"></iframe></div>`);

	 }
