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
        if(loginId == 'adtest'){
            begin = true;
            io.emit("login", "선생님");
            socket.broadcast.emit("teacher", "활성화:::선생님 들어옴");
            lectureSocketId = socket.id;
        }else{
            loginUsers[loginId] = socket.id;
            console.log("들어온 사람**");
            console.dir(loginUsers);
            console.log("**들어온 사람");
            //들어온 사람 아이디 전송
            io.emit("login", loginId);
            //들어온 사람 인원수
            io.emit("welcom", Object.keys(loginUsers).length);            
        }
    });

   //닫기 버튼 이벤트  
    socket.on("logOut", function (loginId) {
            //선생님이면 비활성화 + 안내
            if(loginId == 'adtest'){
                begin = false; 
                lectureSocketId = "";
                console.log("선생님 나감:"+lectureSocketId);
                socket.broadcast.emit("teacherOut", "비활성화:::선생님 나감");
            }else{
                //화면리스트에서 나간사람 제거
                for (let i = 0; i < Object.keys(loginUsers).length; i++) {
        
                    if (loginUsers[Object.keys(loginUsers)[i]] == socket.id) {
                        delete loginUsers[Object.keys(loginUsers)[i]];
                        console.log("디스커넥 현재남은사람**");
                        console.dir(loginUsers);
                        console.log("**현재남은사람");
                    }
                    if (dontArry[Object.keys(loginUsers)[i]] == socket.id) {
                      delete dontArry[Object.keys(loginUsers)[i]];
                      console.log("몰라요 배열 현재남은사람##");
                      console.dir(dontArry);
                      console.log("##현재남은사람");
                  }else if(knowArry[Object.keys(loginUsers)[i]] == socket.id) {
                      delete knowArry[Object.keys(loginUsers)[i]];
                      console.log("알아요 배열 현재남은사람##");
                      console.dir(knowArry);
                      console.log("##현재남은사람");
                  }   
                }
                //for문 처리 후 모든 인원 업데이트
                io.emit("ChangePerson", { "total":  Object.keys(loginUsers).length,
                                          "personD":Object.keys(dontArry).length,
                                          "personK":Object.keys(knowArry).length,
                                          "id":loginId
                                        });          
            }
    });
    //몰라요 이벤트 설정===============================
    socket.on("dont", function (data) {
        if(begin == false){
            //본인에게 비활성상태 알림보냄
            io.to(loginUsers[data.sendId]).emit(
                "dontf", 
                "아직 몰라요가 활성화되지 않았습니다"
            );
        } else if(begin == true){
            //몰라요 눌렀는데 알아요 배열에 있으면 제거
            for (let i = 0; i < Object.keys(loginUsers).length; i++) {
                if(knowArry[Object.keys(loginUsers)[i]] == socket.id) {
                    delete knowArry[Object.keys(loginUsers)[i]];
                    io.emit("ChangePerson", {    "total":  Object.keys(loginUsers).length,
                                                 "personD":Object.keys(dontArry).length,
                                                 "personK":Object.keys(knowArry).length,
                                                 "id":sendId
                    });
                    console.log("몰라요 눌렀는데 알아요에 있으면===================중복배열 제거");
                    console.dir(knowArry);
                    console.log("===============================");

            }  }
            //몰라요 사람 배열로 관리
            dontArry[data.sendId]=socket.id;
            console.log("몰라요 배열@@");
            console.dir(dontArry);
            console.log("@@몰라요 배열");
            console.log("몰라요 사람의 수:"+ Object.keys(dontArry).length);

            //선생님에게 몰라요 전송
            io.to(lectureSocketId).emit(
                "dont", 
                data.sendId
            );
            //차트에 몰라요 전송
            io.emit(
                "dknum", 
                {"kcnt":Object.keys(knowArry).length,
                "dcnt":Object.keys(dontArry).length
                }
            );        
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
            //알아요 눌렀는데 몰라요 배열에 있으면 제거
            for (let i = 0; i < Object.keys(loginUsers).length; i++) {
                if (dontArry[Object.keys(loginUsers)[i]] == socket.id) {
                    delete dontArry[Object.keys(loginUsers)[i]];
                    io.emit("ChangePerson", { "total":  Object.keys(loginUsers).length,
                                              "personD":Object.keys(dontArry).length,
                                              "personK":Object.keys(knowArry).length,
                                              "id":sendId
                  });
                    console.log("알아요 눌렀는데 몰라요에 있으면===================중복배열 제거");
                    console.dir(dontArry);
                    console.log("===============================");
            }}

            //알아요 사람 배열관리
            knowArry[data.sendId]=socket.id;
            console.log("알아요 배열@@");
            console.dir(knowArry);
            console.log("@@알아요 배열");
            console.log("알아요 사람의 수:"+ Object.keys(knowArry).length);

            //선생님에게 알아요 전송
            io.to(lectureSocketId).emit(
                "know", 
                data.sendId
            );
            //차트에 알아요 전송
            io.emit(
                "knum", 
                {"kcnt":Object.keys(knowArry).length,
                "dcnt":Object.keys(dontArry).length
            }
            );

        }
    });
});


server.listen(10001, function () {
    console.log("10001번 구동중...");
});
