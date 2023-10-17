package gugun.service;

import java.util.List;

import gugun.dao.GugunDao;
import gugun.dao.GugunDaoImpl;
import gugun.dto.GugunDto;

public class GugunServiceImpl implements GugunService {
	private GugunDao gugunDao = new GugunDaoImpl();
	@Override
	public List<GugunDto> gugun(int sido_code) {
		List<GugunDto> gugunDto = gugunDao.gugun(sido_code);
		return gugunDto;
	}
}
