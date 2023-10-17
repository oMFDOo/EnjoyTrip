package user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import loginout.service.loginoutService;
import loginout.service.loginoutServiceImpl;
import updateinfo.dao.UpdateInfoDaoImpl;
import updateinfo.service.UpdateInfoService;
import updateinfo.service.UpdateInfoServiceImpl;
import user.dto.UserDto;
import user.service.UserService;
import user.service.UserServiceImpl;
import withdrawal.service.WithdrawalService;
import withdrawal.service.WithdrawalServiceImpl;

@WebServlet("/users")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private UserService userService = new UserServiceImpl();
	private loginoutService loginoutService = new loginoutServiceImpl();
	private UpdateInfoService updateInfoService = new UpdateInfoServiceImpl();
	private WithdrawalService withdrawalService = new WithdrawalServiceImpl();
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String job = request.getParameter("job");
		switch(job) {
			case "signup" : signup(request, response); break;
			case "login" : login(request, response); break;
			case "logout" : logout(request, response); break;
			case "updateinfo" : updateinfo(request, response); break;
			case "withdrawal" : withdrawal(request, response); break;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private void withdrawal(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("withdrawal");

		UserDto userDto = (UserDto) request.getSession().getAttribute("userDto");
		String user_id = userDto.getUser_id();
		System.out.println("세션에서 GET!한 id정보 " + user_id);

		boolean withdrawalSuccess = withdrawalService.withdrawal(user_id);
		if(withdrawalSuccess) {
			System.out.println("회원탈퇴 성공!!!");
	        request.getRequestDispatcher("/index.jsp").forward(request, response);
		} else {
			System.out.println("회원탈퇴 실패!!!");				
		}
	}
	
	private void signup(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("signup");
		String user_id = request.getParameter("user_id");
		String user_password = request.getParameter("user_password");
		String user_name = request.getParameter("user_name");
		String user_job = request.getParameter("user_job");
		String user_email = request.getParameter("user_email");

		UserDto userDto = userService.signup(user_id, user_password, user_name, user_job, user_email);
		// 성공
		if(userDto != null) {
			System.out.println(userDto + "님의 회원가입을 축하합니다.");
			request.getRequestDispatcher("/contact.jsp").forward(request, response);
		}
		else {
			System.out.println("회원가입 실패");
		}
	}
	
	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("login");
		String user_id = request.getParameter("user_id");
		String user_password = request.getParameter("user_password");
		// DB 로그인 성공
		// 사용자정보를 DB 에서 가져와서 UserDto 객체를 만든 후 session 에 저장
		UserDto userDto = loginoutService.login(user_id, user_password);
		// 성공
		if( userDto != null ) {
			// session 에 로그인한 사용자 정보를 저장
			HttpSession session = request.getSession();
			session.setAttribute("userDto", userDto);

			System.out.println(user_id + " 로그인 성공!!!");
			// 화면
			request.getRequestDispatcher("/index.jsp").forward(request, response);	
		} else {
			
			// 로그인 실패 시 메시지를 화면에 표시
	        request.setAttribute("errorMessage", "로그인에 실패하였습니다.");
	        request.getRequestDispatcher("/contactFail.jsp").forward(request, response);
	    }
	}
	
	private void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("~~~~logout!~~~~~");
		
		// HttpSession 객체를 사용하여 세션을 삭제
		HttpSession session = request.getSession();
		session.invalidate(); // 세션을 무효화하여 삭제
		
		request.getRequestDispatcher("/contact.jsp").forward(request, response);
	}
	
	private void updateinfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		System.out.println("updateinfo");
		String user_password = request.getParameter("user_password");
		String user_confirmpassword = request.getParameter("user_confirmpassword");
		String user_job = request.getParameter("user_job");
		String user_email = request.getParameter("user_email");
		String user_profile = request.getParameter("user_profile");
		

		HttpSession session = request.getSession();
		UserDto userDto = (UserDto) session.getAttribute("userDto");
		String user_id = userDto.getUser_id();
		// DB 로그인 성공
		// 사용자정보를 DB 에서 가져와서 UserDto 객체를 만든 후 session 에 저장
		userDto = updateInfoService.updateinfo(userDto.getUser_num() ,userDto.getUser_name(), user_id, user_password, user_confirmpassword, user_job, user_email, "",user_profile);
		// 성공
		if( userDto != null ) {
			// session 에 로그인한 사용자 정보를 저장
			session.setAttribute("userDto", userDto);
			System.out.println("HERERHERERHERERHERERHERERHERERHERERHERERHERERHERERHERERHERERHERERHERERHERER : " + session.getAttribute("userDto"));
			// 화면
			request.getRequestDispatcher("/mypage.jsp").forward(request, response);	
		} else {
			request.getRequestDispatcher("/mypage.jsp").forward(request, response);
		}
	}

}
