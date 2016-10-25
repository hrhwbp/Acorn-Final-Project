package com.remind.model;

import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface AnnoInter {
	@Select("select * from member")
	public List<MemberDto> selectMemberAll();
}
