package kr.co.flyingturtle.edu.test;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import kr.co.flyingturtle.edu.controller.QnaController;


public class Test {
		public static void main(String[] args) {
			try {
				AbstractApplicationContext context = new GenericXmlApplicationContext(
						"config/db/spring/servlet-context.xml"
				);
				
				QnaController controller = context.getBean(QnaController.class);
				//게시물 전체 조회
				controller.retrieveBoard();
				//하나라도 문제가 있다면 실행불가;
						             
//				controller.tranTest();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
}
