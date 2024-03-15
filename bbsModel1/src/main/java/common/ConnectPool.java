package common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ConnectPool {
	public Connection conn;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;
	
	// 기본생성자로 생성
	public ConnectPool() {
		try {
			Context initCtx = new InitialContext();
			Context ctx = (Context) initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource) ctx.lookup("jdbc_maria");
			
			conn = ds.getConnection();
			
			System.out.println("DB 커넥션 풀 연결 성공");
		} catch (Exception e) {
			System.out.println("DB 커넥션 풀 연결 실패");
			e.printStackTrace();
		}
		
	}
	
	// close()메서드
	public void close() {
		try {
			if (rs != null) rs.close();
			if (stmt != null) stmt.clearBatch();
			if (psmt != null) psmt.close();
			if (conn != null) conn.close();
			
			System.out.println("DB 커넥션 풀 자원 해지 성공");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
