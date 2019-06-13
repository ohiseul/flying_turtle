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
            console.log("선생님 들어왔어::비긴값은?::"+begin);
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
                io.emit("logOut",loginId);
                console.log("로그아웃 현재남은사람**");
                console.dir(loginUsers);
                console.log("**현재남은사람");
            }
    });

    socket.on("disconnect", function (Id) {
        //나간사람 배열에서 제거 
        for (let i = 0; i < Object.keys(loginUsers).length; i++) {
              if (loginUsers[Object.keys(loginUsers)[i]] == socket.id) {
                  delete loginUsers[Object.keys(loginUsers)[i]];
                  io.emit("outPerson", Object.keys(loginUsers).length);
                  console.log("디스커넥 현재남은사람**");
                  console.dir(loginUsers);
                  console.log("**현재남은사람");
              }
              if (dontArry[Object.keys(loginUsers)[i]] == socket.id) {
                delete dontArry[Object.keys(loginUsers)[i]];
                io.emit("outPerson", Object.keys(loginUsers).length);
                console.log("몰라요 배열 현재남은사람##");
                console.dir(dontArry);
                console.log("##현재남은사람");
            }else if(knowArry[Object.keys(loginUsers)[i]] == socket.id) {
                delete knowArry[Object.keys(loginUsers)[i]];
                io.emit("outPerson", Object.keys(loginUsers).length);
                console.log("알아요 배열 현재남은사람##");
                console.dir(knowArry);
                console.log("##현재남은사람");
            }             
          }
      });

    //몰라요 이벤트 설정===============================
    socket.on("dont", function (data) {
        console.log("누군가 버튼을 눌렀다"+data.sendId);
        if(begin == false){
            //본인에게 비활성상태 알림보냄
            io.to(loginUsers[data.sendId]).emit(
                "dontf", 
                "아직 몰라요가 활성화되지 않았습니다"
            );
        } else if(begin == true){
            //몰라요 사람 배열로 관리
            dontArry[data.sendId]=socket.id;
            console.log("몰라요 배열@@");
            console.dir(dontArry);
            console.log("@@몰라요 배열");
            console.log("몰라요 사람의 수:"+ Object.keys(dontArry).length);
            //선생님에게 몰라요 전송
            io.to(lectureSocketId).emit(
                "dont", 
                data.sendId + "님의 상태는 몰라요ㅠㅠ"
            );
            //차트에 몰라요 전송
            io.emit(
                "dknum", 
                Object.keys(dontArry).length
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
            //알아요 사람 배열관리
            knowArry[data.sendId]=socket.id;
            console.log("알아요 배열@@");
            console.dir(knowArry);
            console.log("@@알아요 배열");
            console.log("알아요 사람의 수:"+ Object.keys(knowArry).length);
            //선생님에게 알아요 전송
            io.to(lectureSocketId).emit(
                "know", 
                data.sendId + "님의 상태는 알아요!!"
            );
            //차트에 알아요 전송
            io.emit(
                "knum", 
                Object.keys(knowArry).length
            );

        }
    });
});


server.listen(10001, function () {
    console.log("10001번 구동중...");
});
