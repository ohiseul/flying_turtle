package kr.co.flyingturtle.edu.batch;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class SpringBatch extends HandlerInterceptorAdapter {
	
	// 크롤링 자동화
	@Scheduled(cron = "0 00 10 * * *")
	public void execPythonJobData() {

		String comm = "python C://bit2019//flying_turtle//python//crawling.py";
		Runtime rt = Runtime.getRuntime();
		
		Process p;
		try {
			p = rt.exec(comm);
			p.getErrorStream().close();
			p.getInputStream().close();
			p.getOutputStream().close();
			p.waitFor();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
