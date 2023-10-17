package withdrawal.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import common.DBManager;

public class WithdrawalDaoImpl implements WithdrawalDao {

	@Override
	public boolean withdrawal(String userId) {
		boolean withdraw = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		int rs = 0;
		try {
			con = DBManager.getConnection();
			pstmt = con.prepareStatement("DELETE FROM user WHERE user_id = ?;");
			pstmt.setString(1, userId);
			rs = pstmt.executeUpdate();
			if( rs != 0 ) {
				withdraw = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if( pstmt!= null ) pstmt.close();
				if( con!= null ) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return withdraw;
	}

}
