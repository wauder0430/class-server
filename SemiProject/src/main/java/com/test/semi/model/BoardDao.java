package com.test.semi.model;

import java.util.ArrayList;

import com.test.library.BasicDao;

public class BoardDao extends BasicDao{

	public int add(BoardDto dto) {

		try {
			
			String sql = "insert into tblboard (seq, subject, content, id, regdate, readcount) values (seqBoard.nextVal, ?, ?, ?, default, default)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getSubject());
			pstat.setString(2, dto.getContent());
			pstat.setString(3, dto.getId());
			
			int result = pstat.executeUpdate();
			
			pstat.close();
			conn.close();
			
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	// *** DAO에서는 데이터 가공 최대한 금지
	public ArrayList<BoardDto> list() {
		
		try {
			
			String sql = "select * from vwBoard";
			
			rs = stat.executeQuery(sql);
			
			ArrayList<BoardDto> list = new ArrayList<BoardDto>();
			
			// rs > (복사) > list
			while(rs.next()) {
				// 레코드 1줄 > DTO 1개
				BoardDto dto = new BoardDto();
				
				dto.setSeq(rs.getString("seq"));
				dto.setSubject(rs.getString("subject"));
				dto.setId(rs.getString("id"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setReadcount(rs.getString("readcount"));
				
				dto.setName(rs.getString("name"));
				dto.setIsnew(rs.getDouble("isnew"));
				
				list.add(dto);
			}
			
			return list;
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
		
	}

}
