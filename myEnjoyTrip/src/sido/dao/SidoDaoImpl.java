package sido.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.DBManager;
import sido.dto.SidoDto;

public class SidoDaoImpl implements SidoDao {
	@Override
	public List<SidoDto> sido() {
		List<SidoDto> sidoList = new ArrayList<SidoDto>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = DBManager.getConnection();
			pstmt = con.prepareStatement("SELECT * FROM enjoy_trip.sido;");
			rs = pstmt.executeQuery();
			
			while( rs.next() ) {
				sidoList.add(new SidoDto(
						rs.getInt("sido_code"),
						rs.getString("sido_name")
						));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.releaseConnection(rs, pstmt, con);
		}
		return sidoList;
	}
}
