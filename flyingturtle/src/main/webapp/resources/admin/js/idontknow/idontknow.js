// npm install socket.io
const app = require("express")();
const server = require("http").createServer(app);
const io = require("socket.io")(server);

// 접속한 사용자 정보를 담는다.
var loginUsers = [];
var begin;


app.get("/", function (request, response) {
    response.sendFile("C:\bit2019\flying_turtle\flyingturtle\src\main\webapp\WEB-INF\view\admin\idontknow\idk.jsp");
});

// 사용자 소켓 접속할 때 발생
io.on("connection", function (socket) {
    //로그인 이벤트
    socket.on("login", function (loginId) {
        console.log("id:"+loginId);

            loginUsers[loginId] = socket.id;
            console.dir(loginUsers);
            
            //선생님이 접속하면 begin값 변경
            if(loginId == 'adtest'){
                begin = true; 
                io.emit("login", "선생님");
                socket.broadcast.emit("techer", "활성화 됨 선생님 들어옴");
            }else{
                console.log("들어온사람:"+loginId);
                io.emit("login", loginId);
            }
    });
   //닫기 버튼 이벤트  
    socket.on("loginOut", function (loginId) {
            if(loginId == 'adtest'){
                begin = false; 
                io.emit("loginOut", "선생님");
            }else{
                io.emit("loginOut", loginId);
                console.log("나간사람:"+loginId);
                console.dir(loginUsers);
            }
    });

    //몰라요 이벤트 설정===============================
    socket.on("dont", function (data) {
        if(begin== false){
            console.log("비활성화 몰라요 옴"+data.sendId+":::"+data.sendMsg);
            
            //본인에게 비활성상태 알림보냄
            io.to(loginUsers[data.sendId]).emit(
                "dontf", 
                "아직 몰라요가 활성화되지 않았습니다"
                );
        } else if(begin== true){
            console.log("활성화 몰라요 옴"+data.sendId+":::"+data.sendMsg);
            //선생님에게 몰라요 전송
            io.to(loginUsers[data.recvId]).emit(
                "dont", 
                data.sendId + "님의 상태는.\n" +
                data.sendMsg
                );
        }
        });
    //알아요 이벤트 설정===============================
    socket.on("know", function (data) {
        if(begin== false){
            //본인에게 비활성상태 알림보냄
            console.log("비활성화 몰라요 옴"+data.sendId+":::"+data.sendMsg);
            io.to(loginUsers[data.sendId]).emit(
                "knowf", 
                "\n아직 몰라요가 활성화되지 않았습니다\n"
                );
        } else if(begin== true){
            //선생님에게 알아요 전송
            console.log("활성화 몰라요 옴"+data.sendId+":::"+data.sendMsg);
            io.to(loginUsers[data.recvId]).emit(
                "know", 
                data.sendId + "님의 상태는\n" +
                data.sendMsg
                );
        }
    });
});

server.listen(10001, function () {
    console.log("10001번 구동중...");
});
