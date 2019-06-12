// npm install socket.io
const app = require("express")();
const server = require("http").createServer(app);
const io = require("socket.io")(server);

// 접속한 사용자 정보를 담는다.
let loginUsers = [];

app.get("/", function (request, response) {
    response.sendFile("C:\\bit2019\\flying_turtle\\flyingturtle\\src\\main\\webapp\\WEB-INF\\view\\user\\idontknow\\idk.jsp");
});

// 사용자 소켓 접속할 때 발생
io.on("connection", function (socket) {
    console.log("사용자 접속했음...");

    socket.on("login", function (loginId) {
        console.log(loginId + "," + socket.id);
        loginUsers[loginId] = socket.id;
        //전체 사용자를 보내줌 
        io.emit("login", loginUsers);
    });

    //몰라요 이벤트 설정
    socket.on("dont", function (data) {
        // 아이디가 data.recvId로 로그인한 사용자에게 메세지 전송
        io.to(loginUsers[data.recvId]).emit(
            "dont", 
            data.sendId + "님은.\n" +
            data.sendMsg + "입니다."
            );
        });
    //알아요 이벤트 설정
    socket.on("know", function (data) {
        // 아이디가 data.recvId로 로그인한 사용자에게 메세지 전송
        io.to(loginUsers[data.recvId]).emit(
            "know", 
            data.sendId + "님은.\n" +
            data.sendMsg + "입니다."
        );
    });
});

server.listen(10001, function () {
    console.log("10001번 구동중...");
});