package kr.co.flyingturtle.edu.test;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;


public class Test {
		public static void main(String[] args) {
			try {
				AbstractApplicationContext context = new GenericXmlApplicationContext(
						"config/spring/servlet-context.xml"
				);

			}catch (Exception e) {
				e.printStackTrace();
			}
		}
}
