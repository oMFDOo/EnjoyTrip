package loginout.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import common.DBManager;
import user.dto.UserDto;

public class LoginoutDaoImpl implements LoginoutDao {

	@Override
	public UserDto login(String userId) {
		UserDto userDto = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = DBManager.getConnection();
			StringBuilder sb = new StringBuilder();
			sb.append("SELECT user_num, user_id, user_password, user_name, user_job, user_email from user")
					.append(" where user_id = ? "); // unique

			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				userDto = new UserDto(
						rs.getString("user_id"),
						rs.getString("user_password"),
						rs.getString("user_name"),
						rs.getString("user_job"),
						rs.getString("user_email"));
				userDto.setUser_num(Integer.parseInt(rs.getString("user_num")));
			}
			System.out.println("LoginoutDatImple = NOT!!! : " + userDto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.releaseConnection(rs, pstmt, con);
		}

		return userDto;
	}

}
