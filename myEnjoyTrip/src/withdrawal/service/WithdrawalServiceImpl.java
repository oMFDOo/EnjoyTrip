package withdrawal.service;

import withdrawal.dao.WithdrawalDao;
import withdrawal.dao.WithdrawalDaoImpl;

public class WithdrawalServiceImpl implements WithdrawalService {

	WithdrawalDao withdrawalDao = new WithdrawalDaoImpl();
	@Override
	public boolean withdrawal(String userId) {
		return withdrawalDao.withdrawal(userId);
	}

}
