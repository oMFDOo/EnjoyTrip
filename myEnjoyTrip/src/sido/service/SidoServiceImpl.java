package sido.service;

import java.util.ArrayList;
import java.util.List;

import sido.dao.SidoDao;
import sido.dao.SidoDaoImpl;
import sido.dto.SidoDto;

public class SidoServiceImpl implements SidoService {
	
	static SidoDao sidoDao = new SidoDaoImpl();
	
	@Override
	public List<SidoDto> sido() {
		List<SidoDto> sidoDto = sidoDao.sido();
		return sidoDto;
	}
}
