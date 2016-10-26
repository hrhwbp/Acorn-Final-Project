package com.remind.model;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.remind.controller.BoardBean;
import com.remind.controller.FollowBean;
import com.remind.controller.MemberBean;
import com.remind.controller.ReplyBean;
import com.remind.controller.WishlistBean;

public interface DaoInter {
	//sns board
	List<BoardDto> showBoard(String m_no) throws DataAccessException;
	BoardDto showBoardDetail(String b_no1) throws DataAccessException;
	boolean eraseBoard(String b_no1) throws DataAccessException;
	boolean write(BoardBean bean) throws DataAccessException;
	boolean updateBoard(BoardBean bean) throws DataAccessException;
	
	
	//member
	MemberDto showMemberDetail(String m_no) throws DataAccessException;
	boolean joinMember(MemberBean bean) throws DataAccessException;
	boolean outMember(String m_no) throws DataAccessException;
	boolean updateMember(MemberBean bean) throws DataAccessException;
	
	//follow
	List<FollowDto> showMyFollower(String m_no) throws DataAccessException;
	List<FollowDto> showIFollow(String m_no) throws DataAccessException;
	boolean follow(FollowBean bean) throws DataAccessException;
	boolean followCancel(FollowBean bean) throws DataAccessException;
	
	//reply
	List<ReplyDto> showReply(String b_no1) throws DataAccessException;
	boolean writeReply(ReplyBean bean) throws DataAccessException;
	boolean deleteReply(String r_no) throws DataAccessException;
	boolean updateReply(ReplyBean bean) throws DataAccessException;
	
	//wishlist
	List<WishlistDto> showWishList(String w_no) throws DataAccessException;
	boolean writeWishlist(WishlistBean bean) throws DataAccessException;
	boolean deleteWishlist(String w_no) throws DataAccessException;
	boolean updateWishlist(WishlistBean bean) throws DataAccessException;
	
	
	
	
	

}
