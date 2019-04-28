package kr.co.mlec.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.Controller;
import org.springframework.web.WebConstants;

import com.google.gson.Gson;

import kr.co.mlec.common.db.MyAppSqlConfig;
import kr.co.mlec.repository.domain.Comment;
import kr.co.mlec.repository.mapper.BoardMapper;

public class CommentListController implements Controller {
	// AJAX 방식에서는 
	public String service(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int no = Integer.parseInt(request.getParameter("no"));
		BoardMapper mapper = MyAppSqlConfig.getSqlSessionInstance().getMapper(BoardMapper.class);
		List<Comment> list = mapper.selectCommentByNo(no);
		
		/*
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(new Gson().toJson(list));
		out.close();
		
		return "ajax:" + new Gson().toJson(list); // ajax로 처리하라.
		*/
		return WebConstants.AJAX + new Gson().toJson(list);
		
	}
}









