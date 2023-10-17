package user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.DBManager;
import user.dto.UserDto;

public class UserDaoImpl implements UserDao {
	@Override
	public UserDto signup(String user_id, String user_password, String user_name, String user_job, String user_email) {
		UserDto userDto = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		int rs = 0;
		
		try {
			con = DBManager.getConnection();
			// ID 중복 여부 확인 
			PreparedStatement idDuplicationCheckQuery =  con.prepareStatement("select count(*) as id_count from user where user_id = ?;");
			idDuplicationCheckQuery.setString(1, user_id);
			ResultSet idCheckResltSet = idDuplicationCheckQuery.executeQuery();
			idCheckResltSet.next();
			System.out.println("idCheckResltSet : " + idCheckResltSet.getInt("id_count"));
			if(idCheckResltSet.getInt("id_count") != 0) {
				System.err.println("아이디가 중복됩니다.");
				return userDto;
			}
						
			// Emali 중복 여부 확인
			PreparedStatement emailDuplicationCheckQuery =  con.prepareStatement("select count(*) as mail_count from user where user_email = ?;");
			emailDuplicationCheckQuery.setString(1, user_email);
			ResultSet emailCheckResltSet = emailDuplicationCheckQuery.executeQuery();
			emailCheckResltSet.next();
			System.out.println("mailCheckResltSet : " + emailCheckResltSet.getInt("mail_count"));
			if(emailCheckResltSet.getInt("mail_count") != 0) {
				System.err.println("email이 중복됩니다.");
				return userDto;
			}

			pstmt = con.prepareStatement("insert into user (user_id, user_password, user_name, user_job, user_email) "
					+ "values(?, ?, ?, ?, ?);");
			pstmt.setString(1, user_id);
			pstmt.setString(2, user_password);
			pstmt.setString(3, user_name);
			pstmt.setString(4, user_job);
			pstmt.setString(5, user_email);
			rs = pstmt.executeUpdate();
			
			if( rs!=0 ) {
				userDto = new UserDto(user_id, user_password, user_name, user_job, user_email);
			}
		} catch (SQLException e) {
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
