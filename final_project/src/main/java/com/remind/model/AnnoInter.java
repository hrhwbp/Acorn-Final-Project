package com.remind.model;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;


import com.remind.controller.BoardBean;
import com.remind.controller.FollowBean;
import com.remind.controller.LikeBean;
import com.remind.controller.MemberBean;
import com.remind.controller.ReplyBean;
import com.remind.controller.WishlistBean;

public interface AnnoInter {
	// sns board
	@Select("select b_no, b_image, b_content, b_date, b_like, (select m_name from member where m_no = b_mno) b_mname from board where b_mno = (select f_mno from follow where f_sno=#{m_no}) or b_mno = #{m_no}")
	List<BoardDto> showBoard(String m_no);
	
	@Select("select * from board where b_no=#{b_no}")
	BoardDto showBoardDetail(String b_no);

	@Delete("delete from board whre b_no=#{b_no}")
	boolean eraseBoard(String b_no);

	@Insert("insert into board (b_mno, b_image, b_content, b_like) values (#{b_mno}, #{b_image}, #{b_content}, #{b_like})")
	boolean write(BoardBean bean);
	
	@Update("update board set b_content=#{b_content} where b_no=#{b_no}")
	boolean updateBoard(BoardBean bean);

	
	
	// member
	@Select("select * from board where b_mno = #{b_mno}")
	List<BoardDto> showMyMain(String b_mno);
	@Select("select * from member where m_no=#{m_no}")
	MemberDto showMemberDetail(String m_no);
	
	@Insert("insert into member (m_name, m_bdate, m_email, m_gender, m_password) values (#{m_name}, #{m_bdate}, #{m_email}, #{m_gender}, #{m_password})")
	boolean joinMember(MemberBean bean);
	
	@Delete("delete from member where m_no = #{m_no}")
	boolean outMember(String m_no);
	
	@Update("update member set m_name = #{m_name}, m_bdate = #{m_bdate}, m_email = #{m_emali}, m_gender=#{m_gender}, m_password=#{m_password} where m_no = #{m_no}")
	boolean updateMember(MemberBean bean);
	
	@Select("select * from member where m_email = #{m_email} and m_password = #{m_password}")
	MemberDto login(MemberBean bean);

	
	// follow
	@Select("select * from follow where f_sno = #{m_no}")
	List<FollowDto> showMyFollower(String m_no);
	
	@Select("select * from follow where f_mno = #{m_no}")
	List<FollowDto> showIFollow(String m_no);
	
	@Insert("insert into follow (f_sno,f_mno) values(#{f_sno},#{f_mno})")
	boolean follow(FollowBean bean);	//f_sno�� f_mno�� follow
	
	@Delete("delete from follow where f_sno = #{f_sno} and f_mno = #{f_mno}")
	boolean followCancel(FollowBean bean);
	
	
	// reply
	@Select("select r_no, r_bno, r_content, r_date, (select m_name from member where m_no = r_mno) r_name from reply where r_bno = #{b_no} limit ${limit},5")
	List<ReplyDto> showReply(@Param("b_no") String b_no, @Param("limit")int limit);
	@Select("select count(*) from reply where r_bno = #{b_no}")
	int countreply(String b_no);
	
	@Select("select r_no, r_bno, r_content, r_date, (select m_name from member where m_no = r_mno) r_name from board "
			+ "left outer join reply on b_no = r_bno where b_mno = (select f_mno from follow where f_sno=#{m_no}) or b_mno = #{m_no}")
	List<ReplyDto> showReplyall(String m_no);
	
	@Select("select * from reply where r_no = #{r_no}")
	ReplyDto showReplyDetail(String r_no);
	@Select("select r_no, r_bno, r_content, r_date, (select m_name from member where m_no = r_mno) r_name from reply where r_bno = #{b_no}")
	List<ReplyDto> showReplyMore(String b_no);
	
	@Insert("insert into reply (r_mno, r_bno, r_content) values(#{r_mno}, #{r_bno},#{r_content})")
	boolean writeReply(ReplyBean bean);
	
	@Delete("delete from reply where r_no = #{r_no}")
	boolean deleteReply(String r_no);
	
	@Update("update reply set r_content = #{r_content} where r_no = #{r_no}")
	boolean updateReply(ReplyBean bean);

	
	//WishList
	@Select("select * from wishlist where w_mno = #{w_mno}")
	List<WishlistDto> showWishList(String w_mno);
	
	@Insert("insert into wishlist (w_mno, w_pname, w_price, w_image, w_addr, w_detail, w_lock) values(#{w_mno}, #{w_pname}, #{w_price}, #{w_image}, #{w_addr}, #{w_detail}, #{w_lock})")
	boolean writeWishlist(WishlistBean bean);
	
	@Delete("delete from wishlist where w_no = #{w_no}")
	boolean deleteWishlist(String w_no);
	
	@Update("update wishlist set w_pname=#{w_pname}, w_price=#{w_price}, w_image=#{w_image}, w_addr=#{w_addr}, w_detail=#{w_detail} where w_no = #{w_no}")
	boolean updateWishlist(WishlistBean bean);

	
	//WishGroup
	@Select("select * from wishgroup where wg_mno=#{wg_mno}")
	List<WishlistDto> showWishGroup(String wg_mno);
	
	@Insert("insert into wishgroup (wg_mno, wg_detail) values(#{wg_mno},#{wg_detail})")
	boolean insertWishGroup(WishlistBean bean);
	
	@Delete("delete from wishgroup where wg_no = #{wg_no}")
	boolean deleteWishGroup(String wg_no);
	
	@Update("update wishgroup set wg_detail=#{wg_detail} where wg_no = #{wg_no}")
	boolean updateWishGroup(WishlistBean bean);

	// like
	/*@Select("select l_bno, l_mno, (select m_name from member where m_no = l_mno) l_mname from likeTable left outer join board on l_bno = b_no "
			+ "where b_mno = #{m_no} or b_mno = (select f_mno from follow where f_sno=#{m_no})")
	List<LikeDto> showLike(String m_no);
	*/
	@Select("select l_bno, l_mno, (select m_name from member where m_no = l_mno) l_mname from likeTable where l_bno = #{b_no}")
	List<LikeDto> showLike(String b_no);
	
	@Select("select * from likeTable where l_bno = #{l_bno} and l_mno = #{l_mno}")
	LikeDto likeYN(LikeBean bean);
	
	/*@Select("select count(*) l_count, l_bno from likeTable left outer join board on l_bno = b_no "
			+ "where b_mno = #{m_no} or b_mno = (select f_mno from follow where f_sno=#{m_no})")
	List<LikeDto> countLike(String m_no);
	*/
	@Select("select count(*) l_count, l_bno from likeTable where l_bno = #{b_no}")
	LikeDto countLike(String b_no);
	
	@Insert("insert into likeTable (l_bno, l_mno) values(#{l_bno}, #{l_mno})")
	boolean like(LikeBean bean);
	
	@Delete("delete from likeTable where l_bno = #{l_bno} and l_mno = #{l_mno} ")
	boolean likeCancel(LikeBean bean);

}
