package com.remind.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.remind.controller.BoardBean;
import com.remind.controller.FollowBean;
import com.remind.controller.MemberBean;
import com.remind.controller.ReplyBean;
import com.remind.controller.WishlistBean;

@Repository
public class DataDao implements DaoInter{
	@Autowired
	private AnnoInter annoInter;
	@Override
	public List<BoardDto> showBoard(String m_no) throws DataAccessException {
		return annoInter.showBoard(m_no);
	}
	@Override
	public BoardDto showBoardDetail(String b_no1) throws DataAccessException {
		return annoInter.showBoardDetail(b_no1);
	}
	@Override
	public boolean eraseBoard(String b_no1) throws DataAccessException{
		try {
			annoInter.eraseBoard(b_no1);
			return true;
		} catch (Exception e) {
			System.out.println("eraseboard err");
			return false;
		}
		
	}
	@Override
	public boolean write(BoardBean bean) throws DataAccessException{
		try {
			annoInter.write(bean);
			return true;
		} catch (Exception e) {
			System.out.println("write err");
			return false;
		}
	}
	@Override
	public boolean updateBoard(BoardBean bean) throws DataAccessException{
		try {
			annoInter.updateBoard(bean);
			return true;
		} catch (Exception e) {
			System.out.println("updateboard err");
			return false;
		}
	}
	@Override
	public MemberDto showMemberDetail(String m_no) throws DataAccessException{
		return annoInter.showMemberDetail(m_no);
	}
	@Override
	public boolean joinMember(MemberBean bean) throws DataAccessException{
		try {
			annoInter.joinMember(bean);
			return true;
		} catch (Exception e) {
			System.out.println("joinmember err" + e);
			return false;
		}
	}
	@Override
	public boolean outMember(String m_no) throws DataAccessException{
		try {
			annoInter.outMember(m_no);
			return true;
		} catch (Exception e) {
			System.out.println("eraseboard err");
			return false;
		}
	}
	@Override
	public boolean updateMember(MemberBean bean) throws DataAccessException{
		try {
			annoInter.updateMember(bean);
			return true;
		} catch (Exception e) {
			System.out.println("eraseboard err");
			return false;
		}
	}
	@Override
	public MemberDto login(MemberBean bean) {
		return annoInter.login(bean);
	}
	
	@Override
	public List<FollowDto> showMyFollower(String m_no) throws DataAccessException{
		return annoInter.showMyFollower(m_no);
	}
	@Override
	public List<FollowDto> showIFollow(String m_no) throws DataAccessException{
		return annoInter.showIFollow(m_no);
	}
	@Override
	public boolean follow(FollowBean bean) throws DataAccessException{
		try {
			annoInter.follow(bean);
			return true;
		} catch (Exception e) {
			System.out.println("follow err");
			return false;
		}
	}
	@Override
	public boolean followCancel(FollowBean bean) throws DataAccessException{
		try {
			annoInter.followCancel(bean);
			return true;
		} catch (Exception e) {
			System.out.println("followCancel err");
			return false;
		}
	}
	@Override
	public List<ReplyDto> showReply(String b_no1) throws DataAccessException{
		return annoInter.showReply(b_no1);
	}
	@Override
	public List<ReplyDto> showReplyall() throws DataAccessException {
		
		return annoInter.showReplyall();
	}
	@Override
	public ReplyDto showReplyDetail(String r_no) throws DataAccessException {
		
		return annoInter.showReplyDetail(r_no);
	}
	@Override
	public boolean writeReply(ReplyBean bean) throws DataAccessException{
		try {
			annoInter.writeReply(bean);
			return true;
		} catch (Exception e) {
			System.out.println("writereply err");
			return false;
		}
	}
	@Override
	public boolean deleteReply(String r_no) throws DataAccessException{
		try {
			annoInter.deleteReply(r_no);
			return true;
		} catch (Exception e) {
			System.out.println("deletereply err");
			return false;
		}
	}
	@Override
	public boolean updateReply(ReplyBean bean) throws DataAccessException{
		try {
			annoInter.updateReply(bean);
			return true;
		} catch (Exception e) {
			System.out.println("updatereply err");
			return false;
		}
	}
	@Override
	public List<WishlistDto> showWishList(String w_mno) throws DataAccessException{
		return annoInter.showWishList(w_mno);
	}
	@Override
	public boolean writeWishlist(WishlistBean bean) throws DataAccessException{
		try {
			annoInter.writeWishlist(bean);
			return true;
		} catch (Exception e) {
			System.out.println("writewishlist err");
			return false;
		}
	}
	@Override
	public boolean deleteWishlist(String w_no) throws DataAccessException{
		try {
			annoInter.deleteWishlist(w_no);
			return true;
		} catch (Exception e) {
			System.out.println("deletewishlist err");
			return false;
		}
	}
	@Override
	public boolean updateWishlist(WishlistBean bean) throws DataAccessException{
		try {
			annoInter.updateWishlist(bean);
			return true;
		} catch (Exception e) {
			System.out.println("eraseboard err");
			return false;
		}
	}
	
	
}