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
// 알림 유저
let noteUsers = [];

function containsD(element) {
    if( Object.keys(dontArry)[0] == element){
        console.log("containsD조건확인:"+Object.keys(dontArry)[0]);
        
        return true;
    }

return false;
};
function containsK(element) {
        if( Object.keys(knowArry)[0] == element){
            console.log("containsK조건확인:"+Object.keys(knowArry)[0]);
        
            return true;
        }
    
    return false;
};

//app.get("/", function (request, response) {
//    response.sendFile("C:\bit2019\flying_turtle\flyingturtle\src\main\webapp\WEB-INF\view\admin\idontknow\idk.jsp");
//});

// 사용자 소켓 접속할 때 발생
io.on("connection", function (socket) {
	
    //로그인 이벤트
    socket.on("login", function (loginId) {

        //선생님이 접속하면 begin값 변경
        if (loginId == 'test') {
            begin = true;
            io.emit("teacher", "선생님이 들어왔어요!");
            lectureSocketId = socket.id;
        } else {
            if (loginUsers[loginId] != loginId) {
                loginUsers[loginId] = socket.id;
                console.log("로그인 배열");
                console.dir(loginUsers);
                
                
                //들어온 사람 인원수
                io.emit("welcom", {
                    "total": Object.keys(loginUsers).length,
                    "personD": Object.keys(dontArry).length,
                    "personK": Object.keys(knowArry).length
                });
                console.log("-----------------------------------------------");
                console.log("로그인 --전체 배열:" + Object.keys(loginUsers).length);
                console.log("로그인 --몰라요 배열:" + Object.keys(dontArry).length);
                console.log("로그인 --알아요 배열:" + Object.keys(knowArry).length);
                console.log("-----------------------------------------------");


            }
        }
    });

    //닫기 버튼 이벤트  
    socket.on("logOut", function (loginId) {
        //선생님이면 비활성화 + 안내
        if (loginId == 'test') {
            begin = false;
            lectureSocketId = "";
            loginUsers = [];
            dontArry = [];
            knowArry = [];
            io.emit("teacherOut", {
                "msg": "선생님을 기다리는 중입니다",
                "total": Object.keys(loginUsers).length,
                "personD": Object.keys(dontArry).length,
                "personK": Object.keys(knowArry).length
            });
        }
    });

    //사용자가 다시 선택시 아이디값 배열초기화===================
    socket.on("rechoice", function (loginId) {
            delete knowArry[loginId];
            delete dontArry[loginId];
        io.emit("renum", {
            "personD": Object.keys(dontArry).length,
            "personK": Object.keys(knowArry).length
        });
    });
    //몰라요 이벤트 설정===============================
    socket.on("dont", function (data) {
        if (begin == false) {
            io.to(loginUsers[data.sendId]).emit(
                "dontf",
                "아직 몰라요가 활성화되지 않았습니다"
            );
        } else if (begin == true) {
            //몰라요 사람 배열로 관리
            var flagK = containsK(data.sendId);
            var flagD = containsD(data.sendId);
            console.log("-----------------------------------------------");
            console.log("1.알아요 함수 반환값" + flagK);
            console.log("1.몰라요 함수 반환값" + flagD);
            console.log("-----------------------------------------------");
            console.log("알아요조건 들어가기 전 ------알아요배열");
            console.dir(knowArry);
            console.log("알아요조건 들어가기 전--------몰라요배열");
            console.dir(dontArry);
            console.log("-----------------------------------------------");
            if(flagK == true){
                delete knowArry[data.sendId];
                flagK == false; 

            }
            if(flagD == true){
                delete dontArry[data.sendId];
                flagD == false;
            }
            if (Object.keys(dontArry)[0] != data.sendId) {
                dontArry[data.sendId] = socket.id;
                console.log("몰라요~~~~-----------------------------------------------");
                console.log("조건 포함된 알아요배열");
                console.dir(knowArry);
                console.log("조건 포함된 몰라요배열");
                console.dir(dontArry);
                console.log("-----------------------------------------------");
                
                //선생님에게 몰라요 전송
                io.to(lectureSocketId).emit(
                    "whoDont",
                    data.sendId
                    );
                    //차트에 몰라요 전송
                    io.emit(
                        "dknum", {
                            "personD": Object.keys(dontArry).length,
                            "personK": Object.keys(knowArry).length
                        });
                        console.log("-----------------------------------------------");
                        console.log("몰라요 --몰라요 배열:" + Object.keys(dontArry).length);
                        console.log("몰라요 --알아요 배열:" + Object.keys(knowArry).length);
                        console.log("-----------------------------------------------");
            }
        }

    });

    //알아요 이벤트 설정===============================
    socket.on("know", function (data) {
        if (begin == false) {
            //본인에게 비활성상태 알림보냄
            io.to(loginUsers[data.sendId]).emit(
                "knowf",
                "\n아직 몰라요가 활성화되지 않았습니다\n"
            );
        } else if (begin == true) {
            var flagK = containsK(data.sendId);
            var flagD = containsD(data.sendId);
            console.log("-----------------------------------------------");
            console.log("2.알아요 함수 반환값" + flagK);
            console.log("2.몰라요 함수 반환값" + flagD);
            console.log("-----------------------------------------------");
            console.log("알아요조건 들어가기 전 ------알아요배열");
            console.dir(knowArry);
            console.log("알아요조건 들어가기 전--------몰라요배열");
            console.dir(dontArry);
            console.log("-----------------------------------------------");
            if(flagK == true){
                delete knowArry[data.sendId];
                flagK == false; 

            }
            if(flagD == true){
                delete dontArry[data.sendId];
                flagD == false;
            }
            if (Object.keys(knowArry)[0] != data.sendId) {
                //알아요 사람 배열관리
                knowArry[data.sendId] = socket.id;
                console.log("알아요~~~~-----------------------------------------------");
                console.log("조건 포함된 알아요배열");
                console.dir(knowArry);
                console.log("조건 포함된 몰라요배열");
                console.dir(dontArry);
                console.log("-----------------------------------------------");
                //선생님에게 알아요 전송
                io.to(lectureSocketId).emit("whoKnow", data.sendId);
                //차트에 알아요 전송
                io.emit("knum", {
                    "personD": Object.keys(dontArry).length,
                    "personK": Object.keys(knowArry).length
                });
                console.log("-----------------------------------------------");
                console.log("알아요 --몰라요 배열:" + Object.keys(dontArry).length);
                console.log("알아요 --알아요 배열:" + Object.keys(knowArry).length);
                console.log("-----------------------------------------------");
            }
        } 
    });
    
    
    // 알림 추가 --------------------------------------------------------------

    // 사용자 로그인 
    socket.on("notelogin", function (loginId) {
    	noteUsers[loginId] = socket.id;
    	console.log("login",noteUsers);
    });
    
    // 강사 알림 전송
    // 선택한 사용자 모두에게 메세지 전송
    socket.on("notemsg", function (data) {
    	console.log(data.recvNo);
    	console.log(data.msg)
    	console.log(noteUsers)
    	console.log(noteUsers[data.recvNo]);
    	// 사용자 전송하기
    	io.to(noteUsers[data.recvNo]).emit("notemsg", data.msg);
    });
});


server.listen(10001, function () {
    console.log("10001번 구동중...");
});

