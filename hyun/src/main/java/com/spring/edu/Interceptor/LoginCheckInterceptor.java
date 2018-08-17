package com.spring.edu.Interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.spring.edu.vo.UsersVo;

import lombok.extern.slf4j.Slf4j;

/**
  * @FileName : LoginCheckInterceptor.java
  * @Project : hyun
  * @Date : 2018. 7. 3. 
  * @작성자 : 유현재
  * @변경이력 :
  * @프로그램 설명 : 로그인 세션 관리 인터셉터 설정
  */
@Slf4j
public class LoginCheckInterceptor extends HandlerInterceptorAdapter {

	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        // session 객체를 가져옴
        HttpSession session = request.getSession();
        // login처리를 담당하는 사용자 정보를 담고 있는 객체를 가져옴
        UsersVo usersVo = (UsersVo) session.getAttribute("login");
        if ( usersVo == null ){
            // 로그인이 안되어 있는 상태임으로 메인페이지로 다시 돌려보냄(redirect)      
        	
        	response.setContentType("text/html; charset=UTF-8");
            PrintWriter printwriter = response.getWriter();
            printwriter.print("<script>alert('로그인 후 이용가능합니다.'); history.go(-1);</script>");
            printwriter.flush();
            /*printwriter.close();*/
          /* response.sendRedirect("/");*/         
            return false; // 더이상 컨트롤러 요청으로 가지 않도록 false로 반환함
        }else if(request.getRequestURI().contains("admin")) {
        	if(usersVo.getUrGrade().equals("admin")) {
        		return true;
        	}else if(usersVo.getUrGrade().equals("USER")){
                response.setContentType("text/html; charset=UTF-8");
                PrintWriter printwriter = response.getWriter();
                printwriter.print("<script>alert('권한이 없습니다.'); history.go(-1);</script>");
                printwriter.flush();
        		/*response.sendRedirect("/");*/
        		return false;
        	}
        }
        
        // preHandle의 return은 컨트롤러 요청 uri로 가도 되냐 안되냐를 허가하는 의미임
        // 따라서 true로하면 컨트롤러 uri로 가게 됨.
        return true;
    }



	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		super.afterCompletion(request, response, handler, ex);
	}

	@Override
	public void afterConcurrentHandlingStarted(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		super.afterConcurrentHandlingStarted(request, response, handler);
	}

	
}
