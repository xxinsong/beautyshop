package com.qimeng.bs.market.order.service;

import com.qimeng.bs.admin.merchant.bean.DmMerchant;
import com.qimeng.bs.admin.merchant.dao.DmMerchantMapper;
import com.qimeng.bs.market.goods.bean.DmGoodsInst;
import com.qimeng.bs.market.goods.dao.DmGoodsInstMapper;
import com.qimeng.bs.market.goods.dao.DmShoppingCartMapper;
import com.qimeng.bs.market.order.bean.DmCustOrder;
import com.qimeng.bs.market.order.bean.DmSubCustOrder;
import com.qimeng.bs.market.order.dao.DmCustOrderMapper;
import com.qimeng.bs.market.order.dao.DmSubCustOrderMapper;
import com.qimeng.bs.market.point.bean.DmPointsDetail;
import com.qimeng.bs.market.point.dao.DmPointsDetailMapper;
import com.qimeng.bs.market.point.service.DmPointService;
import com.qimeng.bs.market.user.service.ReferrerInfoService;
import com.qimeng.common.Page;
import com.qimeng.common.tools.PKUtils;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class DmCustOrderService {
	@Autowired
	private DmCustOrderMapper dmCustOrderMapper;
	@Autowired
	private DmSubCustOrderMapper dmSubCustOrderMapper;
	@Autowired
	private DmShoppingCartMapper dmShoppingCartMapper;
	@Autowired
	private DmGoodsInstMapper dmGoodsInstMapper;
	@Autowired
	private ReferrerInfoService referrerInfoService;
	@Autowired
	private DmPointsDetailMapper dmPointsDetailMapper;
	@Autowired
	private DmPointService dmPointService;
	@Autowired
	private DmMerchantMapper dmMerchantMapper;

	@Transactional
	public void insertOrder(DmCustOrder dmCustOrder) {
		this.dmCustOrderMapper.insert(dmCustOrder);
	}

	@Transactional
	public void updateOrder(DmCustOrder dmCustOrder) {
		this.dmCustOrderMapper.updateByPrimaryKey(dmCustOrder);
	}

	public Page selectCustOrderList(Map params, int pageIndex, int pageSize) {
		Page page = new Page(pageIndex, pageSize);
		page.setParams(params);
		List<DmCustOrder> list = this.dmCustOrderMapper.selectOrderByPage(page);
		for (DmCustOrder order : list) {
			List<DmSubCustOrder> subCustOrderList = this.dmSubCustOrderMapper.selectSubOrderByOrderId(order
					.getOrderId());
			order.setSubCustOrderList(subCustOrderList);
		}
		page.setRows(list);
		return page;
	}

	@Transactional
	public boolean cancelMyOrder(int merchantId, int orderId) {
		Map param = new HashMap();
		param.put("merchantId", Integer.valueOf(merchantId));
		param.put("orderId", Integer.valueOf(orderId));
		int ret = this.dmCustOrderMapper.cancelMyOrder(param);
		if (ret > 0) {
			param.put("state", "10C");
			this.dmSubCustOrderMapper.updateOrderState(param);
		}
		return ret > 0;
	}

	@Transactional
	public void updateOrderByPrimaryKeySelective(DmCustOrder dmCustOrder) {
		this.dmCustOrderMapper.updateByPrimaryKeySelective(dmCustOrder);
	}

	public Page selectOrderGoodsInstList(Map params, int pageIndex, int pageSize) {
		Page page = new Page(pageIndex, pageSize);
		page.setParams(params);
		List<DmSubCustOrder> list = this.dmSubCustOrderMapper.selectSubOrderByOrderIdPage(page);
		page.setRows(list);
		return page;
	}

	@Transactional
	public void submitOrder(DmCustOrder order, String mode) {
		List<DmSubCustOrder> subCustOrderList = order.getSubCustOrderList();
		List<Integer> goodsIds = new ArrayList();
		int orderId;
		if (StringUtils.equals(mode, "CREATE")) {
			this.dmCustOrderMapper.insert(order);
			orderId = PKUtils.lastInsertId();
			order.setOrderId(Integer.valueOf(orderId));
			for (DmSubCustOrder subCustOrder : subCustOrderList) {
				DmGoodsInst goodsInst = new DmGoodsInst();
				goodsInst.setMerchantId(order.getMerchantId());
				goodsInst.setGoodsId(subCustOrder.getGoodsId());
				goodsInst.setGoodsName(subCustOrder.getGoodsName());
				goodsInst.setInstNum(subCustOrder.getItemNo());
				goodsInst.setPrice(subCustOrder.getPrice());
				goodsInst.setState("00A");
				this.dmGoodsInstMapper.insert(goodsInst);
				int goodsInstId = PKUtils.lastInsertId();

				subCustOrder.setOrderId(Integer.valueOf(orderId));
				subCustOrder.setGoodsInstId(Integer.valueOf(goodsInstId));
				this.dmSubCustOrderMapper.insert(subCustOrder);

				goodsIds.add(subCustOrder.getGoodsId());
			}
		} else {
			this.dmCustOrderMapper.updateByPrimaryKeySelective(order);
			for (DmSubCustOrder subCustOrder : subCustOrderList) {
				subCustOrder.setOrderId(order.getOrderId());
				this.dmSubCustOrderMapper.updateByPrimaryKeySelective(subCustOrder);
				goodsIds.add(subCustOrder.getGoodsId());
			}
		}
		if (!goodsIds.isEmpty()) {
			this.dmShoppingCartMapper.batchRemoveGoodsInCart(goodsIds);
		}
	}

	public boolean allowComment(int merchantId, String subOrderId) {
		boolean allow = false;
		Map params = new HashMap();
		params.put("merchantId", Integer.valueOf(merchantId));
		params.put("subOrderId", subOrderId);
		DmSubCustOrder subCustOrder = this.dmSubCustOrderMapper.selectCommentOrder(params);
		if ((subCustOrder != null)
				&& ((StringUtils.isEmpty(subCustOrder.getCommentated())) || (StringUtils.equals(
						subCustOrder.getCommentated(), "0")))) {
			allow = true;
		}
		return allow;
	}

	public DmCustOrder selectCustOrder(Map params) {
		DmCustOrder order = this.dmCustOrderMapper.selectCustOrderByMerchantId(params);
		if (order != null) {
			List<DmSubCustOrder> subCustOrderList = this.dmSubCustOrderMapper.selectSubOrderByOrderId(order
					.getOrderId());
			order.setSubCustOrderList(subCustOrderList);
			int itemNo = order.getItemNo();
			for (DmSubCustOrder subOrder : subCustOrderList) {
				itemNo += subOrder.getItemNo().intValue();
			}
			order.setItemNo(itemNo);
			order.setFreight(itemNo > 1 ? 0.0F : 10.0F);
		}
		return order;
	}

	public List<DmSubCustOrder> selectSubCustOrder(int orderId) {
		List<DmSubCustOrder> subCustOrderList = this.dmSubCustOrderMapper.selectSubOrderByOrderId(Integer
				.valueOf(orderId));
		return subCustOrderList;
	}

	public List<DmCustOrder> selectCustOrderList(int merchantId) {
		List<DmCustOrder> list = this.dmCustOrderMapper.selectOrderByMerchantId(merchantId);
		for (DmCustOrder order : list) {
			List<DmSubCustOrder> subCustOrderList = this.dmSubCustOrderMapper.selectSubOrderByOrderId(order
					.getOrderId());
			order.setSubCustOrderList(subCustOrderList);
		}
		return list;
	}

	@Transactional
	public void updateOrderStateByOrderNo(String orderNo, String state) {
		Map param = new HashMap();
		param.put("orderNo", orderNo);
		param.put("state", state);
		this.dmCustOrderMapper.updateStateByOrderNo(param);
	}
	
	@Transactional
	public DmCustOrder selectByOrderNo(String orderNo) {
		return this.dmCustOrderMapper.selectByOrderNo(orderNo);
	}

	public Page<DmCustOrder> queryAllOrder(Map params, int pageIndex, int pageSize) {
		Page page = new Page(pageIndex, pageSize);
		page.setParams(params);
		List<DmCustOrder> list = this.dmCustOrderMapper.selectAllOrderByPage(page);

		page.setRows(list);
		return page;
	}

	public boolean deliverGoods(Integer orderId) {
		DmCustOrder dmCustOrder = this.dmCustOrderMapper.selectByPrimaryKey(orderId);
		dmCustOrder.setOperDate(new Date());
		dmCustOrder.setState("10D");
		this.dmCustOrderMapper.updateByPrimaryKeySelective(dmCustOrder);
		return true;
	}

	public Page<DmSubCustOrder> querySubOrder(Map params, int pageIndex, int pageSize) {
		Page<DmSubCustOrder> page = new Page(pageIndex, pageSize);
		page.setParams(params);
		List<DmSubCustOrder> list = this.dmSubCustOrderMapper.selectSubOrderByOrderIdPage(page);
		page.setRows(list);
		return page;
	}

	public boolean deleteOrder(Integer orderId) {
		int ret = this.dmCustOrderMapper.deleteByPrimaryKey(orderId);
		this.dmSubCustOrderMapper.deleteSubOrderByOrderId(orderId);
		return ret > 0;
	}

	public boolean confirmReceiveMoney(Integer orderId) {
		DmCustOrder dmCustOrder = this.dmCustOrderMapper.selectByPrimaryKey(orderId);
		dmCustOrder.setOperDate(new Date());
		dmCustOrder.setState("10B");
		this.dmCustOrderMapper.updateByPrimaryKeySelective(dmCustOrder);
	     //modify by xinxs 一盒送1个积分，几盒送几个积分
        int point = 0;
        Float amount = dmCustOrder.getAmount();
        point = (int) (amount/75);

		DmMerchant dmMerchant = this.dmMerchantMapper.selectByPrimaryKey(dmCustOrder.getMerchantId());
		Integer userId = dmMerchant.getUserId();
		List<Integer> upReferrers = this.referrerInfoService.getUp5LevelsReferrers(userId);
		for (Integer referrer : upReferrers) {
			this.dmPointService.increaseTotalPoint(referrer,point);

			DmPointsDetail dmPointsDetail = new DmPointsDetail();
			dmPointsDetail.setOrderNo(dmCustOrder.getOrderNo());
			dmPointsDetail.setUserId(referrer);
			dmPointsDetail.setPresenteeId(Integer.valueOf(userId.intValue()));
			dmPointsDetail.setPoint(point);
			dmPointsDetail.setGainTime(new Date());
			dmPointsDetail.setState("00A");

			this.dmPointsDetailMapper.insert(dmPointsDetail);
		}
		return true;
	}
}
