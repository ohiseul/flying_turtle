package kr.co.flyingturtle.edu.user.memo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.flyingturtle.edu.user.memo.service.MemoService;
import kr.co.flyingturtle.repository.vo.Memo;

@Controller("kr.co.flyingturtle.edu.user.memo.controller")
@RequestMapping("/user/memo")
public class MemoController{

	@Autowired	
	public MemoService service;
	
	
	@RequestMapping("/list.json")
	public List<Memo> list() throws Exception {
		return service.listMemo();
	}
	
	@RequestMapping("/edit.json")
	public void edit(Memo memo)throws Exception {
		service.updateMemo(memo);
	}
	
	@RequestMapping("/save.json")
	public void save(Memo memo)throws Exception {
		service.insertMemo(memo);
	}
	
	@RequestMapping("/del.json")
	public String del(String id)throws Exception {
		service.deleteMemo(id);
		return "SUCCESS";
	}
}
