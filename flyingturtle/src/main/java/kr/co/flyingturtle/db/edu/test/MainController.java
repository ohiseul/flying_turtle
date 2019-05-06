package kr.co.flyingturtle.db.edu.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

    @RequestMapping("/main.do")
    public String initMain() throws Exception {
        return "notice/list(notice)";
    }
}