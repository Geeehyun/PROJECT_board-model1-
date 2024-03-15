/**
 * 
 */
package model1.bbs;

import java.sql.Date;

/**
 * 
 */
public class BbsDTO {
	private int idx;
	private int ref_idx;
	private int level_idx;
	private int sort_order;
	private String user_id;
	private String title;
	private String content;
	private String display_date;
	private Date reg_date;
	private Date modify_date;
	private int read_cnt;
	private String file_path;
	private String file_name;
	private String file_ext;
	private int file_size;
	
	public BbsDTO() {}
	/**
	 * @return the idx
	 */
	public int getIdx() {
		return idx;
	}
	/**
	 * @param idx the idx to set
	 */
	public void setIdx(int idx) {
		this.idx = idx;
	}
	/**
	 * @return the ref_idx
	 */
	public int getRef_idx() {
		return ref_idx;
	}
	/**
	 * @param ref_idx the ref_idx to set
	 */
	public void setRef_idx(int ref_idx) {
		this.ref_idx = ref_idx;
	}
	/**
	 * @return the level_idx
	 */
	public int getLevel_idx() {
		return level_idx;
	}
	/**
	 * @param level_idx the level_idx to set
	 */
	public void setLevel_idx(int level_idx) {
		this.level_idx = level_idx;
	}
	/**
	 * @return the sort_order
	 */
	public int getSort_order() {
		return sort_order;
	}
	/**
	 * @param sort_order the sort_order to set
	 */
	public void setSort_order(int sort_order) {
		this.sort_order = sort_order;
	}
	/**
	 * @return the user_id
	 */
	public String getUser_id() {
		return user_id;
	}
	/**
	 * @param user_id the user_id to set
	 */
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}
	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}
	/**
	 * @return the content
	 */
	public String getContent() {
		return content;
	}
	/**
	 * @param content the content to set
	 */
	public void setContent(String content) {
		this.content = content;
	}
	/**
	 * @return the display_date
	 */
	public String getDisplay_date() {
		return display_date;
	}
	/**
	 * @param display_date the display_date to set
	 */
	public void setDisplay_date(String display_date) {
		this.display_date = display_date;
	}
	/**
	 * @return the reg_date
	 */
	public Date getReg_date() {
		return reg_date;
	}
	/**
	 * @param reg_date the reg_date to set
	 */
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	/**
	 * @return the modify_date
	 */
	public Date getModify_date() {
		return modify_date;
	}
	/**
	 * @param modify_date the modify_date to set
	 */
	public void setModify_date(Date modify_date) {
		this.modify_date = modify_date;
	}
	/**
	 * @return the read_cnt
	 */
	public int getRead_cnt() {
		return read_cnt;
	}
	/**
	 * @param read_cnt the read_cnt to set
	 */
	public void setRead_cnt(int read_cnt) {
		this.read_cnt = read_cnt;
	}
	/**
	 * @return the file_path
	 */
	public String getFile_path() {
		return file_path;
	}
	/**
	 * @param file_path the file_path to set
	 */
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	/**
	 * @return the file_name
	 */
	public String getFile_name() {
		return file_name;
	}
	/**
	 * @param file_name the file_name to set
	 */
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	/**
	 * @return the file_ext
	 */
	public String getFile_ext() {
		return file_ext;
	}
	/**
	 * @param file_ext the file_ext to set
	 */
	public void setFile_ext(String file_ext) {
		this.file_ext = file_ext;
	}
	/**
	 * @return the file_size
	 */
	public int getFile_size() {
		return file_size;
	}
	/**
	 * @param file_size the file_size to set
	 */
	public void setFile_size(int file_size) {
		this.file_size = file_size;
	}
}
