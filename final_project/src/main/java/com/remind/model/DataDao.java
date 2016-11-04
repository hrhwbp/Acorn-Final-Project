package com.remind.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.remind.controller.BoardBean;
import com.remind.controller.FollowBean;
import com.remind.controller.LikeBean;
import com.remind.controller.MemberBean;
import com.remind.controller.ReplyBean;
import com.remind.controller.WishlistBean;

import ch.qos.logback.classic.net.SyslogAppender;

@Repository
public class DataDao implements DaoInter {
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
	public boolean eraseBoard(String b_no1) throws DataAccessException {
		try {
			annoInter.eraseBoard(b_no1);
			return true;
		} catch (Exception e) {
			System.out.println("eraseboard err");
			return false;
		}

	}

	@Override
	public boolean write(BoardBean bean) throws DataAccessException {
		try {
			annoInter.write(bean);
			return true;
		} catch (Exception e) {
			System.out.println("write err");
			return false;
		}
	}

	@Override
	public boolean updateBoard(BoardBean bean) throws DataAccessException {
		try {
			annoInter.updateBoard(bean);
			return true;
		} catch (Exception e) {
			System.out.println("updateboard err");
			return false;
		}
	}

	
	@Override
	public List<BoardDto> showMyMain(String b_mno) {

		return annoInter.showMyMain(b_mno);
	}

	@Override
	public MemberDto showMemberDetail(String m_no) throws DataAccessException {
		return annoInter.showMemberDetail(m_no);
	}

	@Override
	public boolean joinMember(MemberBean bean) throws DataAccessException {
		try {
			annoInter.joinMember(bean);
			return true;
		} catch (Exception e) {
			System.out.println("joinmember err" + e);
			return false;
		}
	}

	@Override
	public boolean outMember(String m_no) throws DataAccessException {
		try {
			annoInter.outMember(m_no);
			return true;
		} catch (Exception e) {
			System.out.println("eraseboard err");
			return false;
		}
	}

	@Override
	public boolean updateMember(MemberBean bean) throws DataAccessException {
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
	public List<FollowDto> showMyFollower(String m_no) throws DataAccessException {
		return annoInter.showMyFollower(m_no);
	}

	@Override
	public List<FollowDto> showIFollow(String m_no) throws DataAccessException {
		return annoInter.showIFollow(m_no);
	}

	@Override
	public boolean follow(FollowBean bean) throws DataAccessException {
		try {
			annoInter.follow(bean);
			return true;
		} catch (Exception e) {
			System.out.println("follow err");
			return false;
		}
	}

	@Override
	public boolean followCancel(FollowBean bean) throws DataAccessException {
		try {
			annoInter.followCancel(bean);
			return true;
		} catch (Exception e) {
			System.out.println("followCancel err");
			return false;
		}
	}

	@Override
	public List<ReplyDto> showReply(String b_no1) throws DataAccessException {
		if (annoInter.countreply(b_no1) < 5) {
			return annoInter.showReply(b_no1, 0);
		} else {
			return annoInter.showReply(b_no1, annoInter.countreply(b_no1) - 5);
		}
	}
	

	@Override
	public int countReply(String b_no) throws DataAccessException {
		
		return annoInter.countreply(b_no);
	}
	@Override
	public List<ReplyDto> showReplyMore(String b_no) throws DataAccessException {
		// TODO Auto-generated method stub
		return annoInter.showReplyMore(b_no);
	}
	@Override
	public List<ReplyDto> showReplyall(String b_no) throws DataAccessException {
		return annoInter.showReplyall(b_no);
	}
	
	@Override
	public ReplyDto showReplyDetail(String r_no) throws DataAccessException {

		return annoInter.showReplyDetail(r_no);
	}

	@Override
	public boolean writeReply(ReplyBean bean) throws DataAccessException {
		try {
			annoInter.writeReply(bean);
			return true;
		} catch (Exception e) {
			System.out.println("writereply err");
			return false;
		}
	}

	@Override
	public boolean deleteReply(String r_no) throws DataAccessException {
		try {
			annoInter.deleteReply(r_no);
			return true;
		} catch (Exception e) {
			System.out.println("deletereply err");
			return false;
		}
	}

	@Override
	public boolean updateReply(ReplyBean bean) throws DataAccessException {
		try {
			annoInter.updateReply(bean);
			return true;
		} catch (Exception e) {
			System.out.println("updatereply err");
			return false;
		}
	}

	@Override
	public List<WishlistDto> showWishList(String w_mno) throws DataAccessException {
		return annoInter.showWishList(w_mno);
	}

	@Override
	public boolean writeWishlist(WishlistBean bean) throws DataAccessException {
		try {
			annoInter.writeWishlist(bean);
			return true;
		} catch (Exception e) {
			System.out.println("writewishlist err");
			return false;
		}
	}

	@Override
	public boolean deleteWishlist(String w_no) throws DataAccessException {
		try {
			annoInter.deleteWishlist(w_no);
			return true;
		} catch (Exception e) {
			System.out.println("deletewishlist err");
			return false;
		}
	}

	@Override
	public boolean updateWishlist(WishlistBean bean) throws DataAccessException {
		try {
			annoInter.updateWishlist(bean);
			return true;
		} catch (Exception e) {
			System.out.println("Delete Wishlist err");
			return false;
		}
	}

	// like
	@Override
	public List<LikeDto> showLike(String b_no) throws DataAccessException {

		return annoInter.showLike(b_no);
	}

	@Override
	public int likeYN(LikeBean bean) throws DataAccessException {
		if (annoInter.likeYN(bean) != null)
			return 1;
		else
			return 0;
	}

	@Override
	public LikeDto countLike(String b_no) throws DataAccessException {
		return annoInter.countLike(b_no);
	}

	@Override
	public boolean like(LikeBean bean) throws DataAccessException {
		try {
			annoInter.like(bean);
			return true;
		} catch (Exception e) {
			System.out.println("like err" + e);
			return false;
		}
	}

	@Override
	public boolean likeCancel(LikeBean bean) throws DataAccessException {
		try {
			annoInter.likeCancel(bean);
			return true;
		} catch (Exception e) {
			System.out.println("deletewishlist err");
			return false;
		}
	}

	// WISHGROUP LIST
	@Override
	public List<WishlistDto> showWishGroup(String wg_mno) throws DataAccessException {
		return annoInter.showWishGroup(wg_mno);
	}

	@Override
	public boolean insertWishGroup(WishlistBean bean) throws DataAccessException {
		try {
			annoInter.insertWishGroup(bean);
			return true;
		} catch (Exception e) {
			System.out.println("writewishlistgroup err");
			return false;
		}
	}

	@Override
	public boolean deleteWishGroup(String wg_no) throws DataAccessException {
		try {
			annoInter.deleteWishGroup(wg_no);
			return true;
		} catch (Exception e) {
			System.out.println("deletewishlistGroup err");
			return false;
		}
	}

	@Override
	public boolean updateWishGroup(WishlistBean bean) throws DataAccessException {
		try {
			annoInter.updateWishGroup(bean);
			return true;
		} catch (Exception e) {
			System.out.println("Delete WishListGroup err");
			return false;
		}

	}

}
