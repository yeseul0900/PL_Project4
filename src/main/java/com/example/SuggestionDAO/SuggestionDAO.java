package com.example.SuggestionDAO;

import com.example.SuggestionVO.SuggestionVO;
import com.example.common.FileUpload;
import com.example.util.JDBCUtil;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import java.io.File;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SuggestionDAO {
	
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	private final String BOARD_INSERT = "insert into Suggestion (Name, Nickname, S_number, major, department, category, suggestions, photo) values (?,?,?,?,?,?,?,?)";
	private final String BOARD_UPDATE = "update Suggestion set Name = ?, Nickname = ?, S_number = ?, major = ?, department = ?, category = ?, suggestions = ?, photo = ? where PersonID = ?";
	private final String BOARD_DELETE = "delete from Suggestion  where PersonID=?";
	private final String BOARD_GET = "select * from Suggestion  where PersonID=?";
	private final String BOARD_LIST = "select * from Suggestion order by PersonID desc";

	public int insertBoard(SuggestionVO vo) {
		System.out.println("===> JDBC로 insertBoard() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_INSERT);
			stmt.setString(1, vo.getName());
			stmt.setString(2, vo.getNickname());
			stmt.setInt(3, vo.getS_number());
			stmt.setString(4, vo.getMajor());
			stmt.setString(5, vo.getDepartment());
			stmt.setString(6, vo.getCategory());
			stmt.setString(7, vo.getSuggestions());
			stmt.setString(8, vo.getphoto());
			stmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	// 글 삭제
	public void deleteBoard(SuggestionVO vo) {
		System.out.println("===> JDBC로 deleteBoard() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_DELETE);
			stmt.setInt(1, vo.getPersonID());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//업데이트
	public int updateBoard(SuggestionVO vo) {
		System.out.println("===> JDBC로 updateBoard() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_UPDATE);
			stmt.setString(1, vo.getName());
			stmt.setString(2, vo.getNickname());
			stmt.setInt(3, vo.getS_number());
			stmt.setString(4, vo.getMajor());
			stmt.setString(5, vo.getDepartment());
			stmt.setString(6, vo.getCategory());
			stmt.setString(7, vo.getSuggestions());
			stmt.setString(8, vo.getphoto());
			stmt.setInt(9, vo.getPersonID());
			System.out.println(vo.getName() + "-" + vo.getNickname() + "-" + vo.getS_number() + "-" + vo.getMajor() + "-" + vo.getDepartment() + "-" + vo.getCategory() + "-" + vo.getSuggestions());
			stmt.executeUpdate();
			return 1;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}	
	
	public SuggestionVO getBoard(int PersonID) {
		SuggestionVO one = new SuggestionVO();
		System.out.println("===> JDBC로 getBoard() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_GET);
			stmt.setInt(1, PersonID);
			rs = stmt.executeQuery();
			if(rs.next()) {
				one.setPersonID(rs.getInt("PersonID"));
				one.setName(rs.getString("Name"));
				one.setNickname(rs.getString("Nickname"));
				one.setMajor(rs.getString("major"));
				one.setDepartment(rs.getString("department"));
				one.setCategory(rs.getString("category"));
				one.setS_number(rs.getInt("S_number"));
				one.setRegdate(rs.getDate("Regdate"));
				one.setSuggestions(rs.getString("suggestions"));
				one.setphoto(rs.getString("photo"));
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return one;
	}
	
	public List<SuggestionVO> getBoardList(){
		List<SuggestionVO> list = new ArrayList<SuggestionVO>();
		System.out.println("===> JDBC로 getBoardList() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_LIST);
			rs = stmt.executeQuery();
			while(rs.next()) {
				SuggestionVO one = new SuggestionVO();
				one.setPersonID(rs.getInt("PersonID"));
				one.setName(rs.getString("Name"));
				one.setNickname(rs.getString("Nickname"));
				one.setMajor(rs.getString("major"));
				one.setDepartment(rs.getString("department"));
				one.setCategory(rs.getString("category"));
				one.setS_number(rs.getInt("S_number"));
				one.setRegdate(rs.getDate("Regdate"));
				one.setSuggestions(rs.getString("suggestions"));
				one.setphoto(rs.getString("photo"));
				list.add(one);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return list;
	}
	public static String getPhotoFilename(int personID) {
		String filename = null;
		try{
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_GET);
			stmt.setInt(1,personID);
			rs = stmt.executeQuery();
			if(rs.next()){
				filename = rs.getString("photo");
			}
			rs.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		System.out.println("JDBC 기능처리");
		return filename;
	}
}


