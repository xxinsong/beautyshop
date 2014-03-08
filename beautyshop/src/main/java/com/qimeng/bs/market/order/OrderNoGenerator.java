package com.qimeng.bs.market.order;

import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * User: Simon
 * Date: 13-12-24
 * 订单编号生成器
 * 编号规则：订单类型(X)+YYMMDDhhmi+用户ID后5位，共16位
 */
@Component
public class OrderNoGenerator {

    public enum OrderType{
        DONT_USE,NORMAL, SPECIAL
    }

    public String genCode(OrderType orderType,int userId) {
        StringBuilder sb = new StringBuilder(16);
//        sb.append(orderType.ordinal())
        sb.append(DateFormatUtils.format(new Date(), "yyMMddHHmmss"))
//                .append(RandomStringUtils.randomNumeric(4))
                .append(StringUtils.right(StringUtils.leftPad(String.valueOf(userId), 4, "0"), 4));
        return sb.toString();
    }

    public static void main(String[] args) {
        OrderNoGenerator generator = new OrderNoGenerator();
        System.out.println(generator.genCode(OrderType.NORMAL,1));
        System.out.println(generator.genCode(OrderType.SPECIAL,2));
        System.out.println(generator.genCode(OrderType.NORMAL,100321));
        System.out.println(generator.genCode(OrderType.SPECIAL, 200002));
    }
}
