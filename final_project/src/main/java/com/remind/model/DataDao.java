package com.remind.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository
public class DataDao implements DataInter{
	@Autowired
	private AnnoInter inter;
	
	@Override
	public List<MemberDto> memberList() throws DataAccessException {
		return inter.selectMemberAll();
	}
}
