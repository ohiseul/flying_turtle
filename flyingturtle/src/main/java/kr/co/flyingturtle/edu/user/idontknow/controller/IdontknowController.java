package kr.co.flyingturtle.edu.user.idontknow.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("kr.co.flyingturtle.edu.user.idontknow.controller")
@RequestMapping("/user/idontknow")
public class IdontknowController {
	
    @RequestMapping("/idk.do")
    public void home() throws Exception {
        System.out.println("몰라요 홈 컨트롤러 옴");
    }

	   

	@RequestMapping(value = "/start", method = RequestMethod.POST, consumes = "application/json")
	//consumes 하는 형태는 application/json 형태이다.
	@ResponseBody
	public String startApp(@RequestBody String body) {
			System.out.println(body);
			return "/";
	}
}