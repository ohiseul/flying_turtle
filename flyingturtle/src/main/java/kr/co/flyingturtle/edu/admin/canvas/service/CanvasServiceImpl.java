package kr.co.flyingturtle.edu.admin.canvas.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.flyingturtle.repository.mapper.CanvasMapper;


@Service("kr.co.flyingturtle.edu.admin.canvas.service")
public class CanvasServiceImpl implements CanvasService {
	@Autowired
	private CanvasMapper mapper;
}
