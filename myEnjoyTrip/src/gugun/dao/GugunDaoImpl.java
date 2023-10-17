package gugun.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.DBManager;
import gugun.dto.GugunDto;

public class GugunDaoImpl implements GugunDao {
	@Override
	public List<GugunDto> gugun(int sido_code) {
		List<GugunDto> gugunDto = new ArrayList<GugunDto>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = DBManager.getConnection();
			pstmt = con.prepareStatement("SELECT * FROM enjoy_trip.gugun where sido_code = ?;");
			pstmt.setInt(1, sido_code);
			rs = pstmt.executeQuery();
			
			while( rs.next() ) {
				gugunDto.add(new GugunDto(
						rs.getInt("gugun_code"),
						rs.getString("gugun_name")
						));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.releaseConnection(rs, pstmt, con);
		}
		
		return gugunDto;
	}
}
