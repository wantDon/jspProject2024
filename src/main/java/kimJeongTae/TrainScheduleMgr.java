package kimJeongTae;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class TrainScheduleMgr {
	//트레이너 강사이름,시작시간,끝나는시간 각각 출력하는 기능 구현해야 한다.
	private DBConnectionMgr pool;
	
	public TrainScheduleMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	//강의스케줄정보의 트레이너 이름 반환
	public String getTrainerName(int trainerNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		String trainerName = null;
		
		try {
			con = pool.getConnection();
			sql = "SELECT user.name\r\n"
					+ "FROM trainer\r\n"
					+ "JOIN user ON trainer.user = user.num\r\n"
					+ "WHERE trainer.num = ?;";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, trainerNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {	
			}			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return trainerName;
	}
	//현재 날짜를 기준으로 전후 기간의 스케줄을 반납하는 함수
	public Vector<TrainScheduleBean> getTrainSchedule(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<TrainScheduleBean> vlist = new Vector<TrainScheduleBean>();
		try {
			con = pool.getConnection();
			sql = "SELECT user.name\r\n"
					+ "FROM trainer\r\n"
					+ "JOIN user ON trainer.user = user.num\r\n"
					+ "WHERE trainer.num = ?;";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {	
			}			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return vlist;
	}

	
	
	
}
