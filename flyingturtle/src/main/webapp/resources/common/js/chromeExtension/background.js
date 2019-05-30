document.addEventListener("contextmenu", function (e) {
    e.preventDefault();
    if (document.getSelection().toString().length > 0) {
        let selectText = document.getSelection().toString();
        console.log(selectText);
    }   
});