package com.qimeng.bs.admin.goods.bean;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.directwebremoting.annotations.DataTransferObject;
@DataTransferObject
public class DmTags {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_tags.TAG_ID
     *
     * @mbggenerated Thu Dec 12 10:16:19 CST 2013
     */
    private Integer tagId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_tags.TAG_NAME
     *
     * @mbggenerated Thu Dec 12 10:16:19 CST 2013
     */
    private String tagName;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_tags.TAG_TYPE
     *
     * @mbggenerated Thu Dec 12 10:16:19 CST 2013
     */
    private String tagType;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_tags.PARENT_TAG_ID
     *
     * @mbggenerated Thu Dec 12 10:16:19 CST 2013
     */
    private Integer parentTagId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_tags.CREATE_DATE
     *
     * @mbggenerated Thu Dec 12 10:16:19 CST 2013
     */
    private Date createDate;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_tags.CREATE_OPER_ID
     *
     * @mbggenerated Thu Dec 12 10:16:19 CST 2013
     */
    private Integer createOperId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_tags.IS_LEAF
     *
     * @mbggenerated Thu Dec 12 10:16:19 CST 2013
     */
    private String isLeaf;
    
    private Boolean isParent;//非数据库字段
    
    private DmTags parentTag;
    
    private Set<DmTags> ChildrenTags = new HashSet<DmTags>();

    private Set<DmTagsItem> tagsItems = new HashSet<DmTagsItem>();
    
    
    private Integer tagGroupId;
    private Integer goodsId = -1;//商品id
    
    private String checked;
    
    private String state;
    
    

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_tags.TAG_ID
     *
     * @return the value of dm_tags.TAG_ID
     *
     * @mbggenerated Thu Dec 12 10:16:19 CST 2013
     */
    public Integer getTagId() {
        return tagId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_tags.TAG_ID
     *
     * @param tagId the value for dm_tags.TAG_ID
     *
     * @mbggenerated Thu Dec 12 10:16:19 CST 2013
     */
    public void setTagId(Integer tagId) {
        this.tagId = tagId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_tags.TAG_NAME
     *
     * @return the value of dm_tags.TAG_NAME
     *
     * @mbggenerated Thu Dec 12 10:16:19 CST 2013
     */
    public String getTagName() {
        return tagName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_tags.TAG_NAME
     *
     * @param tagName the value for dm_tags.TAG_NAME
     *
     * @mbggenerated Thu Dec 12 10:16:19 CST 2013
     */
    public void setTagName(String tagName) {
        this.tagName = tagName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_tags.TAG_TYPE
     *
     * @return the value of dm_tags.TAG_TYPE
     *
     * @mbggenerated Thu Dec 12 10:16:19 CST 2013
     */
    public String getTagType() {
        return tagType;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_tags.TAG_TYPE
     *
     * @param tagType the value for dm_tags.TAG_TYPE
     *
     * @mbggenerated Thu Dec 12 10:16:19 CST 2013
     */
    public void setTagType(String tagType) {
        this.tagType = tagType;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_tags.PARENT_TAG_ID
     *
     * @return the value of dm_tags.PARENT_TAG_ID
     *
     * @mbggenerated Thu Dec 12 10:16:19 CST 2013
     */
    public Integer getParentTagId() {
        return parentTagId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_tags.PARENT_TAG_ID
     *
     * @param parentTagId the value for dm_tags.PARENT_TAG_ID
     *
     * @mbggenerated Thu Dec 12 10:16:19 CST 2013
     */
    public void setParentTagId(Integer parentTagId) {
        this.parentTagId = parentTagId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_tags.CREATE_DATE
     *
     * @return the value of dm_tags.CREATE_DATE
     *
     * @mbggenerated Thu Dec 12 10:16:19 CST 2013
     */
    public Date getCreateDate() {
        return createDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_tags.CREATE_DATE
     *
     * @param createDate the value for dm_tags.CREATE_DATE
     *
     * @mbggenerated Thu Dec 12 10:16:19 CST 2013
     */
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_tags.CREATE_OPER_ID
     *
     * @return the value of dm_tags.CREATE_OPER_ID
     *
     * @mbggenerated Thu Dec 12 10:16:19 CST 2013
     */
    public Integer getCreateOperId() {
        return createOperId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_tags.CREATE_OPER_ID
     *
     * @param createOperId the value for dm_tags.CREATE_OPER_ID
     *
     * @mbggenerated Thu Dec 12 10:16:19 CST 2013
     */
    public void setCreateOperId(Integer createOperId) {
        this.createOperId = createOperId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_tags.IS_LEAF
     *
     * @return the value of dm_tags.IS_LEAF
     *
     * @mbggenerated Thu Dec 12 10:16:19 CST 2013
     */
    public String getIsLeaf() {
        return isLeaf;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_tags.IS_LEAF
     *
     * @param isLeaf the value for dm_tags.IS_LEAF
     *
     * @mbggenerated Thu Dec 12 10:16:19 CST 2013
     */
    public void setIsLeaf(String isLeaf) {
        this.isLeaf = isLeaf;
    }

	public Boolean getIsParent() {
		return "0".equals(getIsLeaf())?true:false;
	}

	public void setIsParent(Boolean isParent) {
		this.isParent = isParent;
	}

	public DmTags getParentTag() {
		return parentTag;
	}

	public void setParentTag(DmTags parentTag) {
		this.parentTag = parentTag;
	}

	public Set<DmTags> getChildrenTags() {
		return ChildrenTags;
	}

	public void setChildrenTags(Set<DmTags> childrenTags) {
		ChildrenTags = childrenTags;
	}

	public Set<DmTagsItem> getTagsItems() {
		return tagsItems;
	}

	public void setTagsItems(Set<DmTagsItem> tagsItems) {
		this.tagsItems = tagsItems;
	}

	public Integer getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}

	public String getChecked() {
		if(goodsId!=-1){
			setChecked("true");
		}else{
			setChecked("false");
		}
        return checked;
	}

	public void setChecked(String checked) {
		this.checked = checked;
	}

	public Integer getTagGroupId() {
		return tagGroupId;
	}

	public void setTagGroupId(Integer tagGroupId) {
		this.tagGroupId = tagGroupId;
	}

	public String getState() {
		return "0".equals(getIsLeaf())?"closed":"open";
	}

	public void setState(String state) {
		this.state = state;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((tagId == null) ? 0 : tagId.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		DmTags other = (DmTags) obj;
		if (tagId == null) {
			if (other.tagId != null)
				return false;
		} else if (!tagId.equals(other.tagId))
			return false;
		return true;
	}
}