package com.test.semi.model;

import java.util.ArrayList;
import java.util.HashMap;

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
			
//			pstat.close();
//			conn.close();
			
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	// *** DAO에서는 데이터 가공 최대한 금지
	public ArrayList<BoardDto> list(HashMap<String, String> map) {
		
		try {
			
			// 목록보기: select * from vwBoard;
			// 검색하기: select * from vwBoard where 조건
			
			String where = "";
			
			if (map.get("search").equals("y")) {
				
				// where subject like '%검색어%'
				// where content like '%검색어%'
				// where name like '%검색어%'
				// where subject like '%검색어%' or content like '%검색어%'
				if(!map.get("column").equals("all")) {
					where = String.format("where %s like '%%%s%%'", map.get("column"), map.get("word"));
				} else {
					where = String.format("where subject like '%%%s%%' or content like '%%%s%%'", map.get("word"), map.get("word"));
				}
			}
			
			String sql = "";
			
			sql = String.format("select * from (select a.*, rownum as rnum from vwBoard a %s) where rnum BETWEEN %s and %s"
					,where
					,map.get("begin")
					,map.get("end")
					);
			
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
				dto.setCommentCount(rs.getString("commentCount"));
				
				list.add(dto);
			}
			
			return list;
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
		
	}

	public BoardDto get(String seq) {

		try {
			
			String sql = "select a.*, (select name from tblUser where id = a.id) as name from TBLBOARD a where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			if(rs.next()) {
				BoardDto dto = new BoardDto();
				
				dto.setSeq(rs.getString("seq"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setId(rs.getString("id"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setReadcount(rs.getString("readcount"));
				
				dto.setName(rs.getString("name"));
				
				return dto;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public void increaseReadcount(String seq) {
		
		try {
		
			String sql = "update tblBoard set readcount = readcount + 1 where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		
		}
		
	}

	public int edit(BoardDto dto) {
		
		try {
			
			String sql = "update tblBoard set subject = ?, content = ? where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getSubject());
			pstat.setString(2, dto.getContent());
			pstat.setString(3, dto.getSeq());
			
			int result = pstat.executeUpdate();
			
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public int del(String seq) {
			
		try {
			
			String sql = "delete from tblBoard where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			int result = pstat.executeUpdate();
			
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return 0;
	}

	public int getTotalCount(HashMap<String, String> map) {
		
		try {
			
			String where = "";
			
			if (map.get("search").equals("y")) {
				
				if(!map.get("column").equals("all")) {
					where = String.format("where %s like '%%%s%%'", map.get("column"), map.get("word"));
				} else {
					where = String.format("where subject like '%%%s%%' or content like '%%%s%%'", map.get("word"), map.get("word"));
				}
			}
			
			String sql = "select count(*) as cnt from vwBoard " + where;
			
			rs = stat.executeQuery(sql);
			if(rs.next()) {
				return rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return 0;
	}

	

}
