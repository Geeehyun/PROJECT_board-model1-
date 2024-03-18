package common;

import java.util.List;

import model1.bbs.BbsDTO;

public class PageUtil {
	public static String makeMageNumber(int total_page, int start_page, int page_selected, String queryString) {
		String text = "";
		StringBuilder sb = new StringBuilder();
		for(int i = start_page; i < (start_page + 10); i++) {
			if(i > total_page) {
				break;
			} else {
				String url = "list.jsp?page_selected="+i+"&"+queryString;
				String selected = "";
				if(i == page_selected) {
					selected = "class='selected'";
				}
				
				sb.append("<span><a href='"+url+"'"+selected+">"+ i +"</a></span>");
			}
		}
		text = sb.toString();
		
		return text;
	}
	
	public static String makeList(List<BbsDTO> bbsList, int total_count, int page_selected, String queryString) {
		String text = "";
		StringBuilder sb = new StringBuilder();
		
		
		if(!bbsList.isEmpty()) {
			int row_no = (total_count) - (page_selected > 1 ? ((page_selected)-1)*10 : 0);
			for(BbsDTO e : bbsList) {		
				String viewURL = "view.jsp?"+"idx="+e.getIdx()+"&"+queryString;
				sb.append("<tr>");
				sb.append("<td><a href='"+viewURL+"'>"+row_no+"</a></td>");
				sb.append("<td><a href='"+viewURL+"'>"+e.getTitle()+"</a></td>");
				sb.append("<td><a href='"+viewURL+"'>"+e.getUser_id()+"</a></td>");
				sb.append("<td><a href='"+viewURL+"'>"+e.getRead_cnt()+"</a></td>");
				sb.append("<td><a href='"+viewURL+"'>"+e.getReg_date()+"</a></td>");
				sb.append("</tr>");
				
				row_no --;
			}
		} else {
			sb.append("<tr>");
			sb.append("<td colspan='5'>표시할 게시글이 없습니다.</td>");
			sb.append("</tr>");
		}
		
		text = sb.toString();
		
		return text;
	}
}
