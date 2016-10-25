package com.remind.model;

import java.util.List;

import org.springframework.dao.DataAccessException;

public interface DataInter {
	List<MemberDto> memberList() throws DataAccessException;
}
