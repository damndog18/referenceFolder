package com.jjojjo.mybatis.mybatis;

import java.io.Reader;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.web.util.WebUtils;

import com.jjojjo.mybatis.domain.BoardDTO;
import com.jjojjo.mybatis.domain.Member;

public class MemberManager {
	
	private static SqlSessionFactory sqlSessionFactory;
	
	public MemberManager(){}
	
	static{
		try{
			Reader reader = Resources.getResourceAsReader("com/jjojjo/mybatis/mybatis/mybatisConfig.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		}
		catch(Exception err){
			throw new RuntimeException("SqlSessionFactory 인스턴스 생성 실패 : " + err);
		}
	}
	
	public static Member getIdPw(Member member, HttpServletRequest req){
		
		Member mem = null;
		
		SqlSession session = sqlSessionFactory.openSession();
		
		mem = session.selectOne("getIdPw", member);
		
		if(mem != null){
			// WebUtils : session.setAttribute 기능을 spring에서 지원하는 객체임.
			WebUtils.setSessionAttribute(req, "USER_EMAIL", mem.getEmail());
			return mem;
		}
		else{
			return null;
		}
	}
	
	public static void write(BoardDTO board){
		
		SqlSession session = sqlSessionFactory.openSession();
		
		session.insert("write", board);
		
		// insert, delete, update 등등의 쿼리문은 반드시 커밋 해 줘야 완료 된다.
		session.commit();
	}
	
	public static BoardDTO findBySeq(int seq){
		
		SqlSession session = sqlSessionFactory.openSession();
		
		BoardDTO board = session.selectOne("findBySeq", seq);
		
		return board;
	}
	
	public static void update(BoardDTO board){
		
		SqlSession session = sqlSessionFactory.openSession();
		
		session.update("update", board);
		
		session.commit();
	}
}
