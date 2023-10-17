package loginout.service;

import loginout.dao.LoginoutDao;
import loginout.dao.LoginoutDaoImpl;
import user.dto.UserDto;

public class loginoutServiceImpl implements loginoutService {
	
	private LoginoutDao loginoutDao = new LoginoutDaoImpl();
	@Override
	public UserDto login(String userId, String userPassword) {
		UserDto userDto = loginoutDao.login(userId);

		if( userDto != null && userDto.getUser_password().equals(userPassword) ) {
			// password invalidation
			userDto.setUser_password(userPassword);
			return userDto;
		}
		return null; // userEmail �씠 �삱諛붾Ⅴ吏� �븡嫄곕굹, userPassword 媛� �삱諛붾Ⅴ吏� �븡�� 2媛�吏�媛� 紐⑤몢 �룷�븿.
	}
}
