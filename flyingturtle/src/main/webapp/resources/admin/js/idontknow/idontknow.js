// npm install socket.io
const app = require("express")();
const server = require("http").createServer(app);
const io = require("socket.io")(server);

// 접속한 사용자 정보를 담는다.
var loginUsers = [];
var begin;
var end;
var cnt;


app.get("/", function (request, response) {
    response.sendFile("${pageContext.request.contextPath}/WEB-INF/view/admin/idontknow/idk.jsp");
});

// 사용자 소켓 접속할 때 발생
io.on("connection", function (socket) {
    //로그인 이벤트
    socket.on("login", function (loginId) {
        console.log("id:"+loginId);

            loginUsers[loginId] = socket.id;
            cnt++;
            console.log("지금 총인원:"+cnt);
            console.dir(loginUsers);
            
            //선생님이 접속하면 begin값 변경
            if(loginId == 'adtest'){
                begin = true; 
                end = false;
                io.emit("login", "선생님");
            }else{
                io.emit("login", loginId);
            }
    });
   //닫기 버튼 이벤트  
    socket.on("loginOut", function (loginId) {
            if(loginId == 'adtest'){
                begin = false; 
                end = true;
                io.emit("loginOut", "선생님");
            }else{
                io.emit("loginOut", loginId);
                cnt--;
                console.log("지금 총인원:"+cnt);
                console.dir(loginUsers);
            }
    });

    //몰라요 이벤트 설정===============================
    socket.on("dont", function (data) {
        if(begin== false){
            //본인에게 비활성상태 알림보냄
            io.to(loginUsers[data.sendId]).emit(
                "dont", 
                "아직 몰라요가 활성화되지 않았습니다"
                );
        } else if(begin== true){

            //선생님에게 몰라요 전송
            io.to(loginUsers[data.recvId]).emit(
                "dont", 
                data.sendId + "님은.\n" +
                data.sendMsg + "입니다."
                );
        }
        });
    //알아요 이벤트 설정===============================
    socket.on("know", function (data) {
        if(begin== false){
            //본인에게 비활성상태 알림보냄
            io.to(loginUsers[data.sendId]).emit(
                "know", 
                "아직 몰라요가 활성화되지 않았습니다"
                );
        } else if(begin== true){
            //선생님에게 알아요 전송
            io.to(loginUsers[data.recvId]).emit(
                "know", 
                data.sendId + "님은.\n" +
                data.sendMsg + "입니다."
                );
        }
    });
});

server.listen(10001, function () {
    console.log("10001번 구동중...");
});
