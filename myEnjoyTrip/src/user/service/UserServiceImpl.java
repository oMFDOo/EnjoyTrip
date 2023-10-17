package user.service;

import user.dao.UserDao;
import user.dao.UserDaoImpl;
import user.dto.UserDto;

public class UserServiceImpl implements UserService {
	
	private UserDao userDao = new UserDaoImpl();
	
	@Override
	public UserDto signup(String user_id, String user_password, String user_name, String user_job, String user_email) {
		UserDto userDto = userDao.signup(user_id, user_password, user_name, user_job, user_email);
		return userDto;
	}
}
