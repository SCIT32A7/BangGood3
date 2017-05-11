package global.sesoc.banggood.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		String loginId = (String) session.getAttribute("loginId");
		
		if (loginId == null) {
			response.setContentType("text/html; charset=utf-8");
			request.setAttribute("interceptor", "interceptor");
			request.getRequestDispatcher("/").forward(request, response); 
			return false;
		}
		return super.preHandle(request, response, handler);
	}

}
