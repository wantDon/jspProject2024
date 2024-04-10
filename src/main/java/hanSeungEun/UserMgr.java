package hanSeungEun;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import hanSeungEun.UserBean;

public class UserMgr {

	private DBConnectionMgr pool;

	public UserMgr() {
		pool = DBConnectionMgr.getInstance();
	}

	// 로그인
	public int loginMember(String id, String pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int mode = 0;
		// 0-id false, 1-id true pwd-false, 2-id&pwd true
		try {
			if (!checkId(id))
				return mode;
			con = pool.getConnection();
			sql = "select id, pwd from user where id = ? and pwd = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			if (rs.next())
				mode = 2;
			else
				mode = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return mode;
	}
	
	//ID 중복확인
		public boolean checkId(String id) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			boolean flag  = false;
			try {
				con = pool.getConnection();
				sql = "select id from user where id= ? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();//sql문 실행
				flag = rs.next();//true이면 중복, false 중복아님.
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return flag;
		}
		
		
		//회원가입
		public boolean insertMember(UserBean bean) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			boolean flag = false;
			try {
				con = pool.getConnection();
				sql = "insert into user (id, pwd, name, gender, birth, email, phone) values(?,?,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, bean.getId());
				pstmt.setString(2, bean.getPwd());
				pstmt.setString(3, bean.getName());
				pstmt.setInt(4, bean.getGender());
				pstmt.setString(5, bean.getBirth());
				pstmt.setString(6, bean.getEmail());
				pstmt.setString(7, bean.getPhone());
				if(pstmt.executeUpdate()==1) flag = true;
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
			return flag;
		}
		
		
		//아이디 찾기
		public String findId(String name, String email) {
	        String userName = null;
	        Connection con = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;

	        try {
	            con = pool.getConnection();
	            String sql = "select id from user where name = ? and email = ?";
	            pstmt = con.prepareStatement(sql);
	            pstmt.setString(1, name);
	            pstmt.setString(2, email);
	            rs = pstmt.executeQuery();
	            if (rs.next()) {
	                userName = rs.getString("name");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            pool.freeConnection(con, pstmt, rs);
	        }
	        return userName;
	    }

}
