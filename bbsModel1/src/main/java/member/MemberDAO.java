package member;

import common.JDBConnect;
import jakarta.servlet.ServletContext;

public class MemberDAO extends JDBConnect {
	public MemberDAO() {}
	public MemberDAO (ServletContext application) {
		super(application);
	}
	
	public MemberDTO getMemberInfo(String id, String pwd) {
		MemberDTO dto = new MemberDTO();
		
		String sql = "SELECT * FROM tbl_member WHERE memberId=?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			if(rs.next()) {
				if (rs.getString("pwd").equals(pwd)) {
					dto.setMemberId(rs.getString("memberId"));
					dto.setName(rs.getString("name"));
					dto.setPwd(rs.getString("pwd"));
					dto.setJumin(rs.getString("jumin"));
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	} 
}
