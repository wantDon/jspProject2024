package hanSeungEun;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import hanSeungEun.ReservationBean;

public class ReservationMgr {
	private DBConnectionMgr pool;

	public ReservationMgr() {
		pool = DBConnectionMgr.getInstance();
	}

	// 지점명 목록을 반환하는 메서드
	public List<String> getBranches() {
		List<String> branches = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = pool.getConnection();
			String sql = "select city from location";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				String branchId = rs.getString("city");
				branches.add(branchId);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		return branches;
	}

	// 비회원 예약
	public boolean inRes(ReservationBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert into reservation (name, phonenum, population, frnum, reservdate, time) values(?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getPhonenum());
			pstmt.setInt(3, bean.getPopulation());
			pstmt.setInt(4, bean.getFrnum());
			pstmt.setString(5, bean.getReservdate());
			pstmt.setString(6, bean.getTime());
			if (pstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	// 예약 조회
	
	
	
	// 예약번호 찾기
	public int findRev(String name, String phonenum, String pwd) {
		int revNum = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = pool.getConnection();
			String sql = "select num from reservation where name = ? and phonenum = ? and pwd = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, phonenum);
			pstmt.setString(3, pwd);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				revNum = rs.getInt("num");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return revNum;
	}
	
	// 예약조회
		public ReservationBean checkRev(String name, String phonenum, String pwd) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			ReservationBean bean = new ReservationBean();
			try {
				con = pool.getConnection();
				String sql = "select num, name, phonenum, population, frnum, reservdate, time from reservation where name = ? and phonenum = ? and pwd = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, phonenum);
				pstmt.setString(3, pwd);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					bean.setNum(rs.getInt("num"));
					bean.setName(rs.getString("name"));
					bean.setPhonenum(rs.getString("phonenum"));
					bean.setPopulation(rs.getInt("population"));
					bean.setFrnum(rs.getInt("frnum"));
					bean.setReservdate(rs.getString("reservdate"));
					bean.setTime(rs.getString("time"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return bean;
		}
}
