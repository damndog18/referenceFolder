package com.jjojjo.mybatis.mybatis;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.jjojjo.mybatis.domain.BoardDTO;

public class BoardManager {
	
	private static SqlSessionFactory sqlSessionFactory;
	
	public BoardManager(){}
	
	static{
		try{
			Reader reader = Resources.getResourceAsReader("com/jjojjo/mybatis/mybatis/mybatisConfig.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		}
		catch(Exception err){
			throw new RuntimeException("SqlSessionFactory 인스턴스 생성 실패 : " + err);
		}
	}
	
	public static List getList(){
		
		List list = null;
		
		SqlSession session = sqlSessionFactory.openSession();
		
		// getList : mybatisConfig.xml에서 설정한 이름.
		list = session.selectList("getList");
		
		return list;
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
