package com.qimeng.bs.admin.goods.bean;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.directwebremoting.annotations.DataTransferObject;
@DataTransferObject
public class DmGoods {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_goods.GOODS_ID
     *
     * @mbggenerated Mon Dec 16 14:14:23 CST 2013
     */

    private Integer goodsId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_goods.CATALOG_ID
     *
     * @mbggenerated Mon Dec 16 14:14:23 CST 2013
     */
    private Integer catalogId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_goods.GOODS_NO
     *
     * @mbggenerated Mon Dec 16 14:14:23 CST 2013
     */
    private String goodsNo;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_goods.GOODS_NAME
     *
     * @mbggenerated Mon Dec 16 14:14:23 CST 2013
     */
    private String goodsName;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_goods.ALIAS
     *
     * @mbggenerated Mon Dec 16 14:14:23 CST 2013
     */
    private String alias;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_goods.TYPE
     *
     * @mbggenerated Mon Dec 16 14:14:23 CST 2013
     */
    private String type;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_goods.IMAGE_URI
     *
     * @mbggenerated Mon Dec 16 14:14:23 CST 2013
     */
    private String imageUri;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_goods.SALE_WAY
     *
     * @mbggenerated Mon Dec 16 14:14:23 CST 2013
     */
    private String saleWay;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_goods.PRICE
     *
     * @mbggenerated Sun Jan 05 18:38:28 CST 2014
     */
    private Float price;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_goods.ORI_PRICE
     *
     * @mbggenerated Sun Jan 05 18:38:28 CST 2014
     */
    private Float oriPrice;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_goods.STATE
     *
     * @mbggenerated Mon Dec 16 14:14:23 CST 2013
     */
    private String state;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_goods.CREATE_STAFF
     *
     * @mbggenerated Mon Dec 16 14:14:23 CST 2013
     */
    private String createStaff;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_goods.CREATE_DATE
     *
     * @mbggenerated Mon Dec 16 14:14:23 CST 2013
     */
    private Date createDate;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_goods.EFF_DATE
     *
     * @mbggenerated Mon Dec 16 14:14:23 CST 2013
     */
    private Date effDate;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_goods.EXP_DATE
     *
     * @mbggenerated Mon Dec 16 14:14:23 CST 2013
     */
    private Date expDate;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_goods.PUTAWAY_TIME
     *
     * @mbggenerated Mon Dec 16 14:14:23 CST 2013
     */
    private Date putawayTime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_goods.GOODS_DESC
     *
     * @mbggenerated Mon Dec 16 14:14:23 CST 2013
     */
    private String goodsDesc;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_goods.GOODS_PROPS
     *
     * @mbggenerated Mon Dec 16 14:14:23 CST 2013
     */
    private String goodsProps;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_goods.VIEW_COUNT
     *
     * @mbggenerated Mon Dec 16 14:14:23 CST 2013
     */
    private Integer viewCount;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dm_goods.HINTS
     *
     * @mbggenerated Mon Dec 16 14:14:23 CST 2013
     */
    private String hints;
    
    private DmGoodsCatalog goodsCatalog;
    
    private Set<DmTags> tags = new HashSet<DmTags>();
    
    private Set<DmTagsItem> tagsItems = new HashSet<DmTagsItem>(); //商品特定标签的标签值

    private Integer tagGroupId;//当前商品与特定标签的关系主键
    
    private int inst_num;
    private int comment_num;
    private Float planPrice;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_goods.GOODS_ID
     *
     * @return the value of dm_goods.GOODS_ID
     *
     * @mbggenerated Mon Dec 16 14:14:23 CST 2013
     */
    public Integer getGoodsId() {
        return goodsId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_goods.GOODS_ID
     *
     * @param goodsId the value for dm_goods.GOODS_ID
     *
     * @mbggenerated Mon Dec 16 14:14:23 CST 2013
     */
    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_goods.CATALOG_ID
     *
     * @return the value of dm_goods.CATALOG_ID
     *
     * @mbggenerated Mon Dec 16 14:14:23 CST 2013
     */
    public Integer getCatalogId() {
        return catalogId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_goods.CATALOG_ID
     *
     * @param catalogId the value for dm_goods.CATALOG_ID
     *
     * @mbggenerated Mon Dec 16 14:14:23 CST 2013
     */
    public void setCatalogId(Integer catalogId) {
        this.catalogId = catalogId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_goods.GOODS_NO
     *
     * @return the value of dm_goods.GOODS_NO
     *
     * @mbggenerated Mon Dec 16 14:14:23 CST 2013
     */
    public String getGoodsNo() {
        return goodsNo;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_goods.GOODS_NO
     *
     * @param goodsNo the value for dm_goods.GOODS_NO
     *
     * @mbggenerated Mon Dec 16 14:14:23 CST 2013
     */
    public void setGoodsNo(String goodsNo) {
        this.goodsNo = goodsNo;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_goods.GOODS_NAME
     *
     * @return the value of dm_goods.GOODS_NAME
     *
     * @mbggenerated Mon Dec 16 14:14:23 CST 2013
     */
    public String getGoodsName() {
        return goodsName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_goods.GOODS_NAME
     *
     * @param goodsName the value for dm_goods.GOODS_NAME
     *
     * @mbggenerated Mon Dec 16 14:14:23 CST 2013
     */
    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_goods.ALIAS
     *
     * @return the value of dm_goods.ALIAS
     *
     * @mbggenerated Mon Dec 16 14:14:23 CST 2013
     */
    public String getAlias() {
        return alias;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_goods.ALIAS
     *
     * @param alias the value for dm_goods.ALIAS
     *
     * @mbggenerated Mon Dec 16 14:14:23 CST 2013
     */
    public void setAlias(String alias) {
        this.alias = alias;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_goods.TYPE
     *
     * @return the value of dm_goods.TYPE
     *
     * @mbggenerated Mon Dec 16 14:14:23 CST 2013
     */
    public String getType() {
        return type;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_goods.TYPE
     *
     * @param type the value for dm_goods.TYPE
     *
     * @mbggenerated Mon Dec 16 14:14:23 CST 2013
     */
    public void setType(String type) {
        this.type = type;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_goods.IMAGE_URI
     *
     * @return the value of dm_goods.IMAGE_URI
     *
     * @mbggenerated Mon Dec 16 14:14:23 CST 2013
     */
    public String getImageUri() {
        return imageUri;
    }

    public String getSmallImageUri() {
        if(StringUtils.isNotEmpty(imageUri)){
            int subfixPos = imageUri.lastIndexOf(".");
            return imageUri.substring(0,subfixPos)+"_mini"+imageUri.substring(subfixPos);
        }
        return imageUri;
    }

    public String getMidImageUri() {
        if(StringUtils.isNotEmpty(imageUri)){
            int subfixPos = imageUri.lastIndexOf(".");
            return imageUri.substring(0,subfixPos)+"_mid"+imageUri.substring(subfixPos);
        }
        return imageUri;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_goods.IMAGE_URI
     *
     * @param imageUri the value for dm_goods.IMAGE_URI
     *
     * @mbggenerated Mon Dec 16 14:14:23 CST 2013
     */
    public void setImageUri(String imageUri) {
        this.imageUri = imageUri;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_goods.SALE_WAY
     *
     * @return the value of dm_goods.SALE_WAY
     *
     * @mbggenerated Mon Dec 16 14:14:23 CST 2013
     */
    public String getSaleWay() {
        return saleWay;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_goods.SALE_WAY
     *
     * @param saleWay the value for dm_goods.SALE_WAY
     *
     * @mbggenerated Mon Dec 16 14:14:23 CST 2013
     */
    public void setSaleWay(String saleWay) {
        this.saleWay = saleWay;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_goods.PRICE
     *
     * @return the value of dm_goods.PRICE
     *
     * @mbggenerated Sun Jan 05 18:38:28 CST 2014
     */
    public Float getPrice() {
        return price;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_goods.PRICE
     *
     * @param price the value for dm_goods.PRICE
     *
     * @mbggenerated Sun Jan 05 18:38:28 CST 2014
     */
    public void setPrice(Float price) {
        this.price = price;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_goods.ORI_PRICE
     *
     * @return the value of dm_goods.ORI_PRICE
     *
     * @mbggenerated Sun Jan 05 18:38:28 CST 2014
     */
    public Float getOriPrice() {
        return oriPrice;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_goods.ORI_PRICE
     *
     * @param oriPrice the value for dm_goods.ORI_PRICE
     *
     * @mbggenerated Sun Jan 05 18:38:28 CST 2014
     */
    public void setOriPrice(Float oriPrice) {
        this.oriPrice = oriPrice;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_goods.STATE
     *
     * @return the value of dm_goods.STATE
     *
     * @mbggenerated Mon Dec 16 14:14:23 CST 2013
     */
    public String getState() {
        return state;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_goods.STATE
     *
     * @param state the value for dm_goods.STATE
     *
     * @mbggenerated Mon Dec 16 14:14:23 CST 2013
     */
    public void setState(String state) {
        this.state = state;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_goods.CREATE_STAFF
     *
     * @return the value of dm_goods.CREATE_STAFF
     *
     * @mbggenerated Mon Dec 16 14:14:23 CST 2013
     */
    public String getCreateStaff() {
        return createStaff;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_goods.CREATE_STAFF
     *
     * @param createStaff the value for dm_goods.CREATE_STAFF
     *
     * @mbggenerated Mon Dec 16 14:14:23 CST 2013
     */
    public void setCreateStaff(String createStaff) {
        this.createStaff = createStaff;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_goods.CREATE_DATE
     *
     * @return the value of dm_goods.CREATE_DATE
     *
     * @mbggenerated Mon Dec 16 14:14:23 CST 2013
     */
    public Date getCreateDate() {
        return createDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_goods.CREATE_DATE
     *
     * @param createDate the value for dm_goods.CREATE_DATE
     *
     * @mbggenerated Mon Dec 16 14:14:23 CST 2013
     */
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_goods.EFF_DATE
     *
     * @return the value of dm_goods.EFF_DATE
     *
     * @mbggenerated Mon Dec 16 14:14:23 CST 2013
     */
    public Date getEffDate() {
        return effDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_goods.EFF_DATE
     *
     * @param effDate the value for dm_goods.EFF_DATE
     *
     * @mbggenerated Mon Dec 16 14:14:23 CST 2013
     */
    public void setEffDate(Date effDate) {
        this.effDate = effDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_goods.EXP_DATE
     *
     * @return the value of dm_goods.EXP_DATE
     *
     * @mbggenerated Mon Dec 16 14:14:23 CST 2013
     */
    public Date getExpDate() {
        return expDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_goods.EXP_DATE
     *
     * @param expDate the value for dm_goods.EXP_DATE
     *
     * @mbggenerated Mon Dec 16 14:14:23 CST 2013
     */
    public void setExpDate(Date expDate) {
        this.expDate = expDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_goods.PUTAWAY_TIME
     *
     * @return the value of dm_goods.PUTAWAY_TIME
     *
     * @mbggenerated Mon Dec 16 14:14:23 CST 2013
     */
    public Date getPutawayTime() {
        return putawayTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_goods.PUTAWAY_TIME
     *
     * @param putawayTime the value for dm_goods.PUTAWAY_TIME
     *
     * @mbggenerated Mon Dec 16 14:14:23 CST 2013
     */
    public void setPutawayTime(Date putawayTime) {
        this.putawayTime = putawayTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_goods.GOODS_DESC
     *
     * @return the value of dm_goods.GOODS_DESC
     *
     * @mbggenerated Mon Dec 16 14:14:23 CST 2013
     */
    public String getGoodsDesc() {
        return goodsDesc;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_goods.GOODS_DESC
     *
     * @param goodsDesc the value for dm_goods.GOODS_DESC
     *
     * @mbggenerated Mon Dec 16 14:14:23 CST 2013
     */
    public void setGoodsDesc(String goodsDesc) {
        this.goodsDesc = goodsDesc;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_goods.GOODS_PROPS
     *
     * @return the value of dm_goods.GOODS_PROPS
     *
     * @mbggenerated Mon Dec 16 14:14:23 CST 2013
     */
    public String getGoodsProps() {
        return goodsProps;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_goods.GOODS_PROPS
     *
     * @param goodsProps the value for dm_goods.GOODS_PROPS
     *
     * @mbggenerated Mon Dec 16 14:14:23 CST 2013
     */
    public void setGoodsProps(String goodsProps) {
        this.goodsProps = goodsProps;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_goods.VIEW_COUNT
     *
     * @return the value of dm_goods.VIEW_COUNT
     *
     * @mbggenerated Mon Dec 16 14:14:23 CST 2013
     */
    public Integer getViewCount() {
        return viewCount;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_goods.VIEW_COUNT
     *
     * @param viewCount the value for dm_goods.VIEW_COUNT
     *
     * @mbggenerated Mon Dec 16 14:14:23 CST 2013
     */
    public void setViewCount(Integer viewCount) {
        this.viewCount = viewCount;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dm_goods.HINTS
     *
     * @return the value of dm_goods.HINTS
     *
     * @mbggenerated Mon Dec 16 14:14:23 CST 2013
     */
    public String getHints() {
        return hints;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dm_goods.HINTS
     *
     * @param hints the value for dm_goods.HINTS
     *
     * @mbggenerated Mon Dec 16 14:14:23 CST 2013
     */
    public void setHints(String hints) {
        this.hints = hints;
    }

	public DmGoodsCatalog getGoodsCatalog() {
		return goodsCatalog;
	}

	public void setGoodsCatalog(DmGoodsCatalog goodsCatalog) {
		this.goodsCatalog = goodsCatalog;
	}

	public Set<DmTags> getTags() {
		return tags;
	}

	public void setTags(Set<DmTags> tags) {
		this.tags = tags;
	}

	public Set<DmTagsItem> getTagsItems() {
		return tagsItems;
	}

	public void setTagsItems(Set<DmTagsItem> tagsItems) {
		this.tagsItems = tagsItems;
	}

	public Integer getTagGroupId() {
		return tagGroupId;
	}

	public void setTagGroupId(Integer tagGroupId) {
		this.tagGroupId = tagGroupId;
	}

	public int getInst_num() {
		return inst_num;
	}

	public void setInst_num(int instNum) {
		inst_num = instNum;
	}

	public int getComment_num() {
		return comment_num;
	}

	public void setComment_num(int commentNum) {
		comment_num = commentNum;
	}

	public Float getPlanPrice() {
		return planPrice;
	}

	public void setPlanPrice(Float planPrice) {
		this.planPrice = planPrice;
  }
	
}