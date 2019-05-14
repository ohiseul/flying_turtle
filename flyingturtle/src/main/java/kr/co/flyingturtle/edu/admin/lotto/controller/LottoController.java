package kr.co.flyingturtle.edu.admin.lotto.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("kr.co.flyingturtle.edu.admin.lotto.controller")
@RequestMapping("/admin/lotto")
public class LottoController {
	@RequestMapping("/lotto.do")
	public void dashBoard() {
	}
}
