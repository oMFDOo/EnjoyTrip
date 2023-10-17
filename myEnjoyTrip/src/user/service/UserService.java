package user.service;

import user.dto.UserDto;

public interface UserService {
	UserDto signup(String user_id, String user_password, String user_name, String user_job, String user_email);
}
