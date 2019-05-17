const http = require("http");
const port = 10001;

const fs = require("fs");

// 서버 생성
http.createServer(function (request, response) {
    fs.readFile("view/list.html", function (err, data) {
        response.writeHead(200, {"Content-Type":"text/html; charset=utf-8"});
        response.end(data);
    });
}).listen(port, function () {
    console.log("이게 바로 NodeJS");
});