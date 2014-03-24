package com.qimeng.bs.admin.notice.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.qimeng.common.Page;
import com.qimeng.bs.admin.notice.bean.DmNotice;

@SuppressWarnings("unchecked")
@Repository
public interface DmNoticeMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_notice
     *
     * @mbggenerated Thu Jan 16 15:16:23 CST 2014
     */
    int deleteByPrimaryKey(Integer noticeId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_notice
     *
     * @mbggenerated Thu Jan 16 15:16:23 CST 2014
     */
    int insert(DmNotice record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_notice
     *
     * @mbggenerated Thu Jan 16 15:16:23 CST 2014
     */
    int insertSelective(DmNotice record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_notice
     *
     * @mbggenerated Thu Jan 16 15:16:23 CST 2014
     */
    DmNotice selectByPrimaryKey(Integer noticeId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_notice
     *
     * @mbggenerated Thu Jan 16 15:16:23 CST 2014
     */
    int updateByPrimaryKeySelective(DmNotice record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dm_notice
     *
     * @mbggenerated Thu Jan 16 15:16:23 CST 2014
     */
    int updateByPrimaryKey(DmNotice record);
    
	List<DmNotice> selectDmNoticeByPage(Page page);
    
    List<DmNotice> selectDmNoticeList(Map params);
}