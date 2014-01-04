package com.qimeng.common;

import org.directwebremoting.annotations.DataTransferObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 分页组件封装SQL查询的分页信息
 */
@DataTransferObject
public class Page<T> {

    private int pageIndex = 1;//页码，默认是第一页
    private int pageSize = 15;//每页显示的记录数，默认是15
    private int total;//总记录数
    private int pageCount;//总页数
    private List<T> rows = new ArrayList<T>();//对应的当前页记录
    private Map<String, Object> params = new HashMap<String, Object>();

    public Page(){}

    public Page(int pageIndex, int pageSize) {
        this.pageIndex = pageIndex;
        this.pageSize = pageSize;
    }

    public int getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(int pageIndex) {
        this.pageIndex = pageIndex;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
        int totalPage = total %pageSize==0 ? total /pageSize : total /pageSize + 1;
        this.setPageCount(totalPage);
    }

    public int getPageCount() {
        return pageCount;
    }

    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }

    public List<T> getRows() {
        return rows;
    }

    public void setRows(List<T> rows) {
        this.rows = rows;
    }

    public Map<String, Object> getParams() {
        return params;
    }

    public void setParams(Map<String, Object> params) {
        this.params = params;
    }

   /* @Override
    public String toString() {
        StringBuilder builder = new StringBuilder();
        builder.append("Page [pageIndex=").append(pageIndex).append(", pageSize=")
                .append(pageSize).append(", rows=").append(rows).append(
                ", pageCount=").append(pageCount).append(
                ", total=").append(total).append("]");
        return builder.toString();
    }*/

}
