package common;

import java.util.List;

import model1.bbs.BbsDTO;

public class PageUtil {
	public static String makeMageNumber(int total_page, int page_size, int page_selected, String queryString) {
		String text = "";
		StringBuilder sb = new StringBuilder();
		
		// 페이징의 시작 페이지 번호 계산
		int start_page = ((int) Math.floor((((double)page_selected - 1)*0.1))*page_size)+1; // 좀 더 쉬운방법이 있으면 좋겠음.
		
		// <<, <, >, >> 버튼 클릭 시 이동할 페이징 계산
		int grandPrev = (page_selected > 1) ? (((page_selected - 10) > 1) ? page_selected - 10 : 1) : 1;
		int prev = (page_selected > 1)? page_selected - 1 : 1;
		int next = (page_selected < total_page)? page_selected + 1 : page_selected;
		int grandNext = (page_selected < total_page) ? (((page_selected + 10) < total_page) ? page_selected + 10 : total_page) : total_page;
		
		sb.append("<span><a class='prev' href='list.jsp?page_selected="+ grandPrev + "&" + queryString +"'>&lt;&lt;</a></span>");
		sb.append("<span><a class='prev' href='list.jsp?page_selected="+ prev + "&" + queryString +"'>&lt;</a></span>");
		for(int i = start_page; i < (start_page + page_size); i++) {
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
		sb.append("<span><a class='next' href='list.jsp?page_selected="+ next + "&" + queryString +"'>&gt;</a></span>");
		sb.append("<span><a class='next' href='list.jsp?page_selected="+ grandNext + "&" + queryString +"'>&gt;&gt;</a></span>");
		
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
