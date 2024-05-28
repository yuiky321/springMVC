package kr.co.spring.model;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

//import org.apache.ibatis.io.Resources;
//import org.apache.ibatis.session.SqlSession;
//import org.apache.ibatis.session.SqlSessionFactory;
//import org.apache.ibatis.session.SqlSessionFactoryBuilder;


import kr.co.spring.model.BoardVO;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSessionFactory sqlSessionFactory; //[O O O O O ]

	   // 회원전체 리스트보기
	   public List<BoardVO> memberList() {
	  
		   // [Connection+Statement]=>SqlSession
		   SqlSession session=sqlSessionFactory.openSession();
		   List<BoardVO> list=session.selectList("memberList");
		   session.close();//반납
		   return list;
	   } 
	   
	   
	   
	   
//	   // 회원가입
//	   public int memberInsert(MemberVO vo) {
//		   SqlSession session=sqlSessionFactory.openSession();
//		   int cnt=session.insert("memberInsert", vo);
//		   session.commit();
//		   session.close();//반납
//		   return cnt;
//	   }
//	   //회원가입 +파일업로드
//	   public int memberInsertFile(MemberVO vo) {
//		   SqlSession session=sqlSessionFactory.openSession();
//		   int cnt=session.insert("memberInsertFile", vo);
//		   
//		   session.commit();
//		   session.close();//반납
//		   return cnt;
//		}
//	   // 회원삭제
//	   public int memberDelete(int num) {
//		   SqlSession session=sqlSessionFactory.openSession();
//		   int cnt=session.delete("memberDelete", num);
//		   session.commit();
//		   session.close();
//		   return cnt;
//	   }
//	   // 회원상세보기
//	   public MemberVO memberContent(int num) {
//		   SqlSession session=sqlSessionFactory.openSession();
//		   MemberVO vo=session.selectOne("memberContent", num);
//		   session.close();
//		   return vo;
//	   }
//	   // 회원수정하기
//	   public int memberUpdate(MemberVO vo) {
//		   SqlSession session=sqlSessionFactory.openSession();
//		   int cnt=session.update("memberUpdate", vo);
//		   session.commit();
//		   session.close();
//		   return cnt;
//	   }
//	   // 회원로그인
//	   public String memberLogin(MemberVO vo) {
//		   SqlSession session=sqlSessionFactory.openSession();
//		   String user_name=session.selectOne("memberLogin", vo);
//		   session.close();
//		   return user_name;
//	   }
//	   //아이디 중복체크
//		public String memberDoubleCheck(String id) {
//			 SqlSession session=sqlSessionFactory.openSession();
//			 String checkId=session.selectOne("memberDoubleCheck", id);
//			 String isCheck="no";
//			 if(checkId !=null) {
//				 isCheck="yes";
//			 }
//			 session.close();
//			return isCheck;
//		}
//		public int memberDeleteFile(int num) {
//			SqlSession session=sqlSessionFactory.openSession();
//			int cnt=session.delete("memberDeleteFile", num);
//			 session.commit();
//			 session.close();
//			return cnt;
//		}
//		public int memberFileUpdate(MemberVO vo) {
//			SqlSession session=sqlSessionFactory.openSession();
//			   int cnt=session.update("memberFileUpdate", vo);
//			   session.commit();
//			   session.close();
//			   return cnt;
//		}
		
	

	   
	}