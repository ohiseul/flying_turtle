// npm install socket.io
const app = require("express")();
const server = require("http").createServer(app);
const io = require("socket.io")(server);

// 접속한 사용자 정보를 담는다.
var loginUsers = [];
let lectureSocketId = "";
var dontArry = [];
var knowArry = [];
var begin = false;

app.get("/", function (request, response) {
    response.sendFile("C:\bit2019\flying_turtle\flyingturtle\src\main\webapp\WEB-INF\view\admin\idontknow\idk.jsp");
});

// 사용자 소켓 접속할 때 발생
io.on("connection", function (socket) {
    //로그인 이벤트
    socket.on("login", function (loginId) {

        //선생님이 접속하면 begin값 변경
        if(loginId == 'test5'){
            begin = true;
            io.emit("teacher", "활성화:::선생님o");
            lectureSocketId = socket.id;
        }else{
            if(loginUsers[loginId] != loginId){
                loginUsers[loginId] = socket.id;
                console.dir(loginUsers);
                //들어온 사람 인원수
                io.emit("welcom",{ "total":Object.keys(loginUsers).length,
                                "personD":Object.keys(dontArry).length,
                                "personK":Object.keys(knowArry).length}
                );  

            }
        }
    });

   //닫기 버튼 이벤트  
    socket.on("logOut", function (loginId) {
            //선생님이면 비활성화 + 안내
            if(loginId == 'test5'){
                begin = false; 
                lectureSocketId = "";
                loginUsers = [];
                dontArry = [];
                knowArry = [];
                io.emit("teacherOut", {"msg":"비활성화:::선생님x",
                                       "total":Object.keys(loginUsers).length,
                                       "personD":Object.keys(dontArry).length,
                                       "personK":Object.keys(knowArry).length}
                );
            }
    });

    //사용자가 다시 선택시 아이디값 배열초기화===================
    socket.on("rechoice", function (loginId) {
                delete dontArry[loginId];
                delete knowArry[loginId];
    });
    //몰라요 이벤트 설정===============================
    socket.on("dont", function (data) {
        if(begin == false){
            io.to(loginUsers[data.sendId]).emit(
                "dontf", 
                "아직 몰라요가 활성화되지 않았습니다"
            );
        } else if(begin == true){
            //몰라요 사람 배열로 관리
            if(dontArry[data.sendId] != data.sendId){

                dontArry[data.sendId]=socket.id;
                //선생님에게 몰라요 전송
                io.to(lectureSocketId).emit(
                    "whoDont", 
                    data.sendId
                    );
                    //차트에 몰라요 전송
                    io.emit(
                        "dknum", {"personD":Object.keys(dontArry).length,
                                  "personK":Object.keys(knowArry).length}
                        );        
                    }
        }    
    });
            
    //알아요 이벤트 설정===============================
    socket.on("know", function (data) {
        if(begin == false){
            //본인에게 비활성상태 알림보냄
            io.to(loginUsers[data.sendId]).emit(
                "knowf", 
                "\n아직 몰라요가 활성화되지 않았습니다\n"
            );
        } else if(begin == true){
            if(knowArry[data.sendId] != data.sendId){
            //알아요 사람 배열관리
            knowArry[data.sendId]=socket.id;
            //선생님에게 알아요 전송
            io.to(lectureSocketId).emit(
                "whoKnow", 
                data.sendId
            );
            //차트에 알아요 전송
            io.emit(
                "knum",{ "personD":Object.keys(dontArry).length,
                         "personK":Object.keys(knowArry).length}
            );
        }
    }
    });
});


server.listen(10001, function () {
    console.log("10001번 구동중...");
});

