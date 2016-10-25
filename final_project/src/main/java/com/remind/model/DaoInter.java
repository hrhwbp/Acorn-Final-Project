package com.remind.model;

import java.util.List;

import com.remind.controller.BoardBean;
import com.remind.controller.FollowBean;
import com.remind.controller.MemberBean;
import com.remind.controller.ReplyBean;
import com.remind.controller.WishlistBean;

public interface DaoInter {
	//sns board
	List<BoardDto> showBoard();
	BoardDto showBoardDetail();
	boolean eraseBoard(String b_no1);
	boolean write(BoardBean bean);
	boolean updateBoard(BoardBean bean);
	
	
	//member
	MemberDto showMemberDetail();
	boolean joinMember(MemberBean bean);
	boolean outMember(String m_no);
	boolean updateMember(MemberBean bean);
	
	//follow
	List<FollowDto> showMyFollower(String m_no);
	List<FollowDto> showIFollow(String m_no);
	boolean follow(FollowBean bean);
	boolean followCancel(String f_mno);
	
	//reply
	List<ReplyDto> showReply(String b_no1);
	boolean writeReply(ReplyBean bean);
	boolean deleteReply(String r_no);
	boolean updateReply(ReplyBean bean);
	
	//wishlist
	List<WishlistDto> showWishList(String w_mno);
	boolean writeWishlist(WishlistBean bean);
	boolean deleteWishlist(String w_mno);
	boolean updateWishlist(WishlistBean bean);
	
	
	
	
	

}
