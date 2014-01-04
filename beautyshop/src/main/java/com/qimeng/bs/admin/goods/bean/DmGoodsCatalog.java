package com.qimeng.bs.admin.goods.bean;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.directwebremoting.annotations.DataTransferObject;
@DataTransferObject
public class DmGoodsCatalog {
    private Integer catalogId;

    private String catalogName;

    private String alias;

    private String catalogDesc;

    private Integer upCatalogId;

    private String state;

    private String createStaffNo;

    private Date createDate;

    private Integer orderId;

    private String isLeaf;
    
    private Boolean isParent;//非数据库字段
    private DmGoodsCatalog parentCatalog;
    
    private Set<DmGoodsCatalog> childrenCatalogs = new HashSet<DmGoodsCatalog>();
    public Integer getCatalogId() {
        return catalogId;
    }

    public void setCatalogId(Integer catalogId) {
        this.catalogId = catalogId;
    }

    public String getCatalogName() {
        return catalogName;
    }

    public void setCatalogName(String catalogName) {
        this.catalogName = catalogName;
    }

    public String getAlias() {
        return alias;
    }

    public void setAlias(String alias) {
        this.alias = alias;
    }

    public String getCatalogDesc() {
        return catalogDesc;
    }

    public void setCatalogDesc(String catalogDesc) {
        this.catalogDesc = catalogDesc;
    }

    public Integer getUpCatalogId() {
        return upCatalogId;
    }

    public void setUpCatalogId(Integer upCatalogId) {
        this.upCatalogId = upCatalogId;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCreateStaffNo() {
        return createStaffNo;
    }

    public void setCreateStaffNo(String createStaffNo) {
        this.createStaffNo = createStaffNo;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

	public String getIsLeaf() {
		return isLeaf;
	}

	public void setIsLeaf(String isLeaf) {
		this.isLeaf = isLeaf;
	}

	public Boolean getIsParent() {
		return "0".equals(getIsLeaf())?true:false;
	}

	public void setIsParent(Boolean isParent) {
		this.isParent = isParent;
	}

	public Set<DmGoodsCatalog> getChildrenCatalogs() {
		return childrenCatalogs;
	}

	public void setChildrenCatalogs(Set<DmGoodsCatalog> childrenCatalogs) {
		this.childrenCatalogs = childrenCatalogs;
	}

	public DmGoodsCatalog getParentCatalog() {
		return parentCatalog;
	}

	public void setParentCatalog(DmGoodsCatalog parentCatalog) {
		this.parentCatalog = parentCatalog;
	}
}