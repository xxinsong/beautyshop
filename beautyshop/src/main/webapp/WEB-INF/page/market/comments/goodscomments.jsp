<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>

<script>
    var allowComment = "<%=request.getAttribute("allowComment")%>";
</script>
<script type="text/javascript" src="<%=path%>/market/comments/js/goodscomments.js"></script>
<div class="pro_info_con" rel_tab="goods_commment" style="display: none;">
    <div class="product_tab_box pro_detail_tab_box">
        <div class="user_show fix">
            <div class="user_stat_feel">
                <div class="myd">
                    <p class="percent"><em class="arial"><span id="favour_pct">0</span>%</em></p>
                    <p class="name">好评度</p>
                </div>
                <ul class="my_stat fix">
                    <li>
                        <span class="attri">喜欢<em id="like_pct">(0%)</em></span>
                        <p id="like_pct_bar" w="88.0%" class="stat_box">
                            <span style="width: 88%;" class="width"></span>
                        </p>
                    </li>
                    <li>
                        <span class="attri">不喜欢<em id="dislike_pct">(0%)</em></span>
                        <p id="dislike_pct_bar" w="6.0%" class="stat_box">
                            <span style="width: 6%;" class="width"></span>
                        </p>
                    </li>
                </ul>
            </div>
            <div id="avg_score" class="new_user_show">
                <%--<em class="star_b_curr"></em><em class="star_b_curr"></em><em class="star_b_curr"></em><em class="star_b_half"></em><em class="star_b_gray"></em>--%>
            </div>
        </div>
        <div class="product_tab product_tabC fix mt10">
            <ul class="pro_pinglun_tab fix">
                <li class="cur">
                    <a id="all_comments" href="javascript:void(0)">全部评价</a>
                </li>
                <li>
                    <a id="like_comments" href="javascript:void(0)">喜欢</a>
                </li>
                <li>
                    <a id="dislike_comments" href="javascript:void(0)">不喜欢</a>
                </li>
            </ul>
        </div>
        <div class="product_tab_tabC fix" id="pro_pinglun_tab_box">
            <div class="product_tab_box pro_pinglun_tab_box">
                <div id="userCommMain_all">
                    <ul id="comments_list" class="pinglun_list fix">
                        <li id="comment_tpl" style="display: none">
                            <div class="user_face">
                                <img name="merchant_head" alt="" src="<%=path%>/market/main/images/user_defoult.jpg">
                                <span name="merchant_name" class="a1">匿名</span>
                            </div>
                            <div class="pinglun_info">
                                <div class="top_info">
                                    <span class="title b" name="l_score">
                                        <%--<em class="star_curr"></em><em class="star_curr"></em><em class="star_curr"></em>--%>
                                    </span>
                                </div>
                                <ul class="pingjia fix">
                                    <li>
                                        <span class="attri a tr">优点：</span>
                                        <p name="l_advantage">手机和包装都很票亮，<br />在设置里怎么着不到开发者选项，链接不上电脑</p>
                                    </li>
                                    <li>
                                        <span class="attri a tr">缺点：</span>
                                        <p name="l_disadvantage">手机和包装都很票亮，<br />在设置里怎么着不到开发者选项，链接不上电脑</p>
                                    </li>
                                    <li>
                                        <span class="attri a tr">评价：</span>
                                        <p name="l_comment">手机和包装都很票亮，<br />在设置里怎么着不到开发者选项，链接不上电脑</p>
                                    </li>
                                </ul>
                                <div name="l_create_time" class="viewAll viewReply fix">

                                </div>
                                <span class="arrow"></span>
                            </div>
                            <div class="clear"></div>
                        </li>
                    </ul>
                    <div id="comments_page" style="display: block;" class="turnPageBottom">
                    </div>
                    <div class="clear"></div>
                </div>
                <div id="comment_box" class="mt pinglun_box" style="display: none;">
                    <div class="top_info"><b>发表评论</b></div>
                    <div class="pinglun_table">
                        <form id="form_comment">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <th>评分：</th>
                                    <td>
                                        <input id="score" type="hidden" name="score" value="5"/>
                                        <input id="orderDetailNo" type="hidden" name="orderDetailNo" value=""/>
                                        <span class="title b">
                                            <em name="star" value=1 class="star_curr"></em>
                                            <em name="star" value=2 class="star_curr"></em>
                                            <em name="star" value=3 class="star_curr"></em>
                                            <em name="star" value=4 class="star_curr"></em>
                                            <em name="star" value=5 class="star_curr"></em>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <th>优点：</th>
                                    <td><input type="text" id="advantage" name="advantage" style="width:500px" class="resig_ipt" maxlength="50"/></td>
                                </tr>
                                <tr>
                                    <th>缺点：</th>
                                    <td><input type="text" id="disadvantage" name="disadvantage" style="width:500px" class="resig_ipt" maxlength="50"/></td>
                                </tr>
                                <tr>
                                    <th>内容：</th>
                                    <td>
                                        <textarea name="comment" id="comment"  nullable="false" style="width:500px" cols="45" rows="5" class="resig_txt"></textarea>
                                        <span id="comment_hint" class="explain"></span>
                                    </td>
                                </tr>
                                <tr>
                                    <th>验证码：</th>
                                    <td><input type="text" id="verification_code" name="verification_code" nullable="false" class="resig_ipt" style="width:80px;" />&nbsp;<img id="img_verf_code" alt="验证码" title="看不清？点击换另一张" onclick="" src="../../public/verificode.jsp"></td>
                                </tr>
                                <tr>
                                    <th>&nbsp;</th>
                                    <td><a id="btn_submit" href="javascript:void(0)" class="greenBtn" style="width:60px;">提交</a></td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </div>
            </div>
            <!-- 很喜欢 -->
            <div class="product_tab_box pro_pinglun_tab_box hide"></div>
            <!-- 一般 -->
            <div class="product_tab_box pro_pinglun_tab_box hide"></div>
            <!-- 不喜欢 -->
            <div class="product_tab_box pro_pinglun_tab_box hide"></div>
            <!-- 有晒单 -->
            <div class="product_tab_box pro_pinglun_tab_box hide"></div>
        </div>
    </div>
</div>
</div>
</div>