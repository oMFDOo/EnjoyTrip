package updateinfo.service;

import updateinfo.dao.UpdateInfoDao;
import updateinfo.dao.UpdateInfoDaoImpl;
import user.dto.UserDto;

public class UpdateInfoServiceImpl implements UpdateInfoService {
	
	private UpdateInfoDao updateInfoDao = new UpdateInfoDaoImpl();
	@Override
	public UserDto updateinfo(int user_num, String user_name, String user_id, String user_password, String user_confirmpassword, String user_job, String user_email,
			String user_introduce, String user_profile) {
		UserDto userDto = updateInfoDao.updateinfo(user_num, user_name, user_id, user_password, user_confirmpassword, user_job, user_email, user_introduce, user_profile);
		if( userDto != null) {
			return userDto;
		}
		return null;
	}
}
