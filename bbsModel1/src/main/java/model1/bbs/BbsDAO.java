package model1.bbs;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.JDBConnect;
import jakarta.servlet.ServletContext;

public class BbsDAO extends JDBConnect {
	public BbsDAO() {}
	public BbsDAO (ServletContext application) {
		super(application);
	}
	
	public int bbsTotalCount(Map<String, Object> map) {
		int total_count = 0;
		StringBuilder sb = new StringBuilder();
		sb.append( "SELECT COUNT(*) FROM tbl_bbs");  // 편의상 StringBuilder 로 했는데 그냥 String에 + 하면서 써도 됨.
		
		if (!map.get("search_category").equals("") && !map.get("search_word").equals("")) {
			sb.append(" WHERE " + map.get("search_category"));
			sb.append(" LIKE '%" + map.get("search_word") + "%'");
		}
		try {
			String sql = sb.toString();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			total_count = rs.getInt(1);
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("게시글 개수 조회 에러");
		}
		return total_count;
	}
	
	
	public List<BbsDTO> bbsList(Map<String, Object> map) {
		List<BbsDTO> list = new Vector<BbsDTO>();
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT idx, ref_idx, level_idx, sort_order");
		sb.append(", user_id, title, content, read_cnt, display_date");
		sb.append(", reg_date, modify_date");
		sb.append(" FROM tbl_bbs");
		if (!map.get("search_category").equals("") && !map.get("search_word").equals("")) {
			sb.append(" WHERE " + map.get("search_category"));
			sb.append(" LIKE '%" + map.get("search_word") + "%'");
		}
		sb.append(" ORDER BY idx DESC");
		try {
			String sql = sb.toString();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				BbsDTO dto = new BbsDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setRef_idx(rs.getInt("ref_idx"));
				dto.setLevel_idx(rs.getInt("level_idx"));
				dto.setSort_order(rs.getInt("sort_order"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setRead_cnt(rs.getInt("read_cnt"));
				dto.setDisplay_date(rs.getString("display_date"));
				dto.setReg_date(rs.getDate("reg_date"));
				dto.setModify_date(rs.getDate("modify_date"));
				list.add(dto);	
			}
			
		} catch(Exception e) {
			System.out.println("게시물 리스트 조회 에러");
			e.printStackTrace();
		}
		return list;
	}
	
	public List<BbsDTO> bbsPagingList(Map<String, Object> map) {
		List<BbsDTO> list = new Vector<BbsDTO>();
		int starNo = (map.get("page_selected") == null)? 0 : ((Integer)(map.get("page_selected"))*10)-10;
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT idx, ref_idx, level_idx, sort_order");
		sb.append(", user_id, title, content, read_cnt, display_date");
		sb.append(", reg_date, modify_date");
		sb.append(" FROM tbl_bbs");
		if (!map.get("search_category").equals("") && !map.get("search_word").equals("")) {
			sb.append(" WHERE " + map.get("search_category"));
			sb.append(" LIKE '%" + map.get("search_word") + "%'");
		}
		sb.append(" ORDER BY idx DESC");
		sb.append(" LIMIT ?, 10");
		try {
			String sql = sb.toString();
			psmt = conn.prepareStatement(sql);
			//System.out.println("sql문에 세팅하는 곳 : "+map.get("page_selected"));
			psmt.setInt(1, starNo);
			//System.out.println("나의 sql문 : "+psmt);
			rs = psmt.executeQuery();
			while(rs.next()) {
				BbsDTO dto = new BbsDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setRef_idx(rs.getInt("ref_idx"));
				dto.setLevel_idx(rs.getInt("level_idx"));
				dto.setSort_order(rs.getInt("sort_order"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setRead_cnt(rs.getInt("read_cnt"));
				dto.setDisplay_date(rs.getString("display_date"));
				dto.setReg_date(rs.getDate("reg_date"));
				dto.setModify_date(rs.getDate("modify_date"));
				list.add(dto);	
			}
			
		} catch(Exception e) {
			System.out.println("게시물 리스트 조회 에러");
			e.printStackTrace();
		}
		return list;
	}
	
	public BbsDTO bbsView(int idx) {
		BbsDTO dto = new BbsDTO();
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT idx, ref_idx, level_idx, sort_order");
		sb.append(", user_id, title, content, read_cnt, display_date");
		sb.append(", reg_date, modify_date");
		sb.append(" FROM tbl_bbs");
		sb.append(" WHERE idx = ?");
		
		try {
			String sql = sb.toString();
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, idx);
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				dto.setIdx(rs.getInt("idx"));
				dto.setRef_idx(rs.getInt("ref_idx"));
				dto.setLevel_idx(rs.getInt("level_idx"));
				dto.setSort_order(rs.getInt("sort_order"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setRead_cnt(rs.getInt("read_cnt"));
				dto.setDisplay_date(rs.getString("display_date"));
				dto.setReg_date(rs.getDate("reg_date"));
				dto.setModify_date(rs.getDate("modify_date"));
			}
		} catch(Exception e) {
			System.out.println("게시판 데이터 조회 오류");
			e.printStackTrace();
		}
		return dto;
	}
	
	public int bbsRegister(BbsDTO dto) {
		int result = 0;
		StringBuilder sb = new StringBuilder();
		sb.append("INSERT INTO tbl_bbs (user_id, title, content)");
		sb.append(" VALUES (?, ?, ?)");
		
		try {
			String sql = sb.toString();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getUser_id());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			
			result = psmt.executeUpdate();
			
		} catch(Exception e) {
			System.out.print("게시글 등록에 실패하였습니다.");
			e.printStackTrace();
		}
		return result;
	}
	
	public int bbsModify(BbsDTO dto) {
		int result = 0;
		StringBuilder sb = new StringBuilder();
		sb.append("UPDATE tbl_bbs SET title =?, content=?, modify_date=NOW()");
		sb.append(" WHERE idx=? user_id=?");
		
		try {
			String sql = sb.toString();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setInt(3, dto.getIdx());
			psmt.setString(4, dto.getUser_id());
			
			result = psmt.executeUpdate();
			
		} catch(Exception e) {
			System.out.print("게시글 수정에 실패하였습니다.");
			e.printStackTrace();
		}
		return result;
	}
	
	public int bbsDelete(int idx) {
		int result = 0;
		StringBuilder sb = new StringBuilder();
		sb.append("DELETE FROM tbl_bbs");
		sb.append(" WHERE idx=?");
		
		try {
			String sql = sb.toString();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, idx);
			
			result = psmt.executeUpdate();
			
		} catch(Exception e) {
			System.out.print("게시글 삭제에 실패하였습니다.");
			e.printStackTrace();
		}
		return result;
	}
}
