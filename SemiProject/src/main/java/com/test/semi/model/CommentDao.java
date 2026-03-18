package com.test.semi.model;

import java.util.ArrayList;

import com.test.library.BasicDao;

public class CommentDao extends BasicDao {

	public void add(CommentDto dto) {
		
		try {
			
			String sql = "insert into tblComment (seq, content, regdate, id, bseq) values (seqComment.nextVal, ?, default, ?, ?)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getContent());
			pstat.setString(2, dto.getId());
			pstat.setString(3, dto.getBseq());
			
			pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public ArrayList<CommentDto> clist(String seq) {
		
		try {
			
			String sql = "select a.*, (select name from tblUser where id = a.id) as name from tblComment a where bseq = ? order by seq asc";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			ArrayList<CommentDto> clist = new ArrayList<CommentDto>();
			
			while (rs.next()) {
				//레코드 1줄 > DTO 1개
				CommentDto dto = new CommentDto();
				dto.setSeq(rs.getString("seq"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setBseq(rs.getString("bseq"));
				
				clist.add(dto);
			}
			
			return clist;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public void del(String seq) {
		
		try {
			
			String sql =  "delete from tblComment where seq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public void edit(CommentDto dto) {
		
		try {
			
			String sql =  "update tblComment set content = ? where seq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getContent());
			pstat.setString(2, dto.getSeq());
			
			pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
