package kr.co.flyingturtle.edu.user.idontknow.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("kr.co.flyingturtle.edu.user.idontknow.controller")
@RequestMapping("/user/idontknow")
public class IdontknowController {
	
    @RequestMapping("/idk.do")
    public void home() throws Exception {
        System.out.println("몰라요 홈 컨트롤러 옴");
    }

	   
}
