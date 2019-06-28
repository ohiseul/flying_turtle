package kr.co.flyingturtle.edu.batch;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.flyingturtle.repository.mapper.AttendMapper;

@Component
public class SpringBatchAttend extends HandlerInterceptorAdapter {
	
	@Autowired
	private AttendMapper mapper;
	
	
//	public static void main(String[] args) {
/*		 Connection con = null;
	       
	        String user = "flyingturtle";
	        String password = "helloturtle^";
	        String url = "jdbc:mysql://203.236.209.131:3306/flyingturtle";


		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, user, password);
			String qu = "select * from tb_member";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(qu);
			
			while(rs.next()) {
				int memberNo = rs.getInt("memberNo");
				System.out.println(memberNo);
			}
		}catch(Exception e) {
			System.out.println(e);
		}
	}
	*/
	
	
	//결석 자동화
//	@Scheduled(cron = "0 00 00 * * *")
//	public void attendData() {
//
//		String comm = "python C://bit2019//flying_turtle//python//crawling.py";
//		Runtime rt = Runtime.getRuntime();
//		
//		Process p;
//		try {
//			p = rt.exec(comm);
//			p.getErrorStream().close();
//			p.getInputStream().close();
//			p.getOutputStream().close();
//			p.waitFor();
//		} catch(Exception e) {
//			e.printStackTrace();
//		}
//	}
	
}
