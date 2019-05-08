/** 
	// 실제 사용자가 요청한 기능이 실행되기 전에 작동하는 인터셉터

	페이지 호출시 세션이 필요한지 아닌지 체크하고
	필요하다면 세션이 존재하는지/없는지를 체크해
	각 상태(상황)에 맞는 페이지로 이동시킨다.
	클래스 정의 후 spring-mvc.xml 에 환경설정하여 스프링이 인식할 수 있도록 만들어야 한다 !!
 */

package kr.co.flyingturtle.edu.interceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.flyingturtle.edu.login.service.LoginService;
import kr.co.flyingturtle.repository.vo.Member;

public class AuthInterceptor extends HandlerInterceptorAdapter {
	// 인터셉터 실행 시점 : alt+shift+s -> v
	
	@Resource
	private LoginService loginService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("인터셉터 호출 ======== ");
		// 오버라이딩 된 메소드라 매개변수를 맘대로 바꿀수 없으므로 request객체에서 세션정보를 불러온다. 
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("user");
		System.out.println("m : " + m);
		if( m != null) {
			return true;		// 인터셉터를 부른 쪽에 별다른 처리 없이 사용자가 요청한 페이지(마이페이지)로 넘어가도록 한다.
		}
		
		// 세션 정보가 없다면 로그인폼 페이지로 이동시킨다.
		response.sendRedirect(request.getContextPath() + "/login/loginform.do");
		return false; 			// 사용자가 요청한 페이지로 이동하지 못하게 막는다.
	}
}
