package kr.co.flyingturtle.edu.user.idontknow.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("kr.co.flyingturtle.edu.user.idontknow.controller")
@RequestMapping("/user/idontknow")
public class IdontknowController {

	
	/**과목 리스트 */
    @RequestMapping("/idk.do")
    public void fmain() throws Exception {
        System.out.println("컨트롤러 옴");
    }
	
}