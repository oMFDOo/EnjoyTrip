package gugun.dao;

import java.util.List;

import gugun.dto.GugunDto;

public interface GugunDao {
	List<GugunDto> gugun(int sido_code); 
}
