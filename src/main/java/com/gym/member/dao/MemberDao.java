package com.gym.member.dao;

import java.sql.Blob;
import java.sql.Date;
import java.util.List;

import org.hibernate.sql.Update;

import com.gym.member.model.MemberBean;

public interface MemberDao{

	// 新增
	public boolean insert(MemberBean bean);

	// 刪除
	public boolean delete(String member_id);

	// 更新
	public MemberBean update(String member_id, String password, String username, int member_type, int member_height,
			int member_weight, String mobile, int gender, Date birth, String address, double point, String facebook_account,
			String google_account, String detail, String memberphoto, int activate, String register_num);

	// 查詢 by member_id
	public MemberBean selectByMember_id(String member_id);

	// 查全部
	public List<MemberBean> selectAll();
	
	public void updatePoint(MemberBean bean);
	
	//點數加值
	public void addPoint(String memberId,Double point); 

}
