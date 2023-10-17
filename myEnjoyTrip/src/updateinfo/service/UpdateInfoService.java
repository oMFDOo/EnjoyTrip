package updateinfo.service;

import user.dto.UserDto;

public interface UpdateInfoService {
	UserDto updateinfo(int user_num, String user_name, String user_id, String user_password, String user_confirmpassword, String user_job, String user_email,
			String user_introduce, String user_profile);
}
