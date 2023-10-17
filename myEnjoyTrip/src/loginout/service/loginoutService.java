package loginout.service;

import user.dto.UserDto;

public interface loginoutService {
	UserDto login(String userId, String userPassword);
}
