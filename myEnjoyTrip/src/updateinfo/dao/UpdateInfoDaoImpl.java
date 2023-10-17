package updateinfo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import common.DBManager;
import user.dto.UserDto;

public class UpdateInfoDaoImpl implements UpdateInfoDao {
	@Override
	public UserDto updateinfo(int user_num, String user_name, String user_id, String user_password, String user_confirmpassword, String user_job, String user_email,
			String user_introduce, String user_profile) {
		UserDto userDto = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		int rs = 0;
		
		if(!user_password.equals(user_confirmpassword)) return userDto; // new password�� confirm password媛� �떎瑜� 寃쎌슦 null return
		
		try {
			con = DBManager.getConnection();
			pstmt = con.prepareStatement("UPDATE `user` SET `user_password` = ?, `user_job` = ?, `user_email` = ?, `user_profile` = ? WHERE (`user_id` = ?);");
			pstmt.setString(1, user_password);
			pstmt.setString(2, user_job);
			pstmt.setString(3, user_email);
			pstmt.setString(4, user_profile);
			pstmt.setString(5, user_id);
			rs = pstmt.executeUpdate();
			
			if( rs!=0 ) {
				userDto = new UserDto(user_num, user_id, user_password, user_confirmpassword, user_name, user_job, user_email, user_introduce, user_profile);
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
		
		return userDto;
	}
}
