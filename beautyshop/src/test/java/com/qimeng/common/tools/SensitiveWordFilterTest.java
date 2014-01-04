package com.qimeng.common.tools;

import com.qimeng.com.ztesoft.test.BaseTest;
import com.qimeng.common.tools.filter.SensitiveInfo;
import org.junit.Assert;
import org.junit.Test;
import org.junit.Before;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * SensitiveWordFilter Tester.
 *
 * @author <Authors name>
 * @version 1.0
 */
public class SensitiveWordFilterTest extends BaseTest {
    @Autowired
    private SensitiveWordFilter wordFilter;

    @Before
    public void before() throws Exception {
        wordFilter.initWordDict();
    }


    /**
     * Method: filter()
     */
    @Test
    public void testFilter() throws Exception {
//        String sentence = "我们都是好人！";
        String sentence2 = "专题：\n" +
                "\n" +
                "永别了 曼德拉\n" +
                "\n" +
                "独家策划：\n" +
                "\n" +
                "曼德拉：促进和解转型的优秀政客\n" +
                "\n" +
                "逼迫南非白人政府妥协的国际撤资运动\n" +
                "\n" +
                "光影记录：曼德拉的斗争与遗产\n" +
                "\n" +
                "中新网12月6日电 1918年7月18日，南非“国父”纳尔逊•曼德拉出生在特兰斯凯一个大酋长家庭。在任职总统前，他是一名积极的反种族隔离人士，曾在牢中服刑27年。曼德拉是全面代议制民主选举所选出的首任南非元首，在40年的政治生涯中，他获得了超过一百项奖项，包括1993年的诺贝尔和平奖。\n" +
                "\n" +
                "酋长之子到反种族隔离斗士\n" +
                "\n" +
                "作为家中长子、酋长继承人的曼德拉心怀理想，他不愿以酋长身份统治一个受压迫的部族，而要“以一个战士的名义投身于民族逼解放事业”。曼德拉由此开始了其倍显坎坷的民族解放之路。\n" +
                "\n" +
                "曼德拉是其家族中唯一上过学的成员。他从16岁开始受业，用2年完成了惯常需要3年完成的初中学业。1938年，他进入黑尔堡学院，后又就读于威特沃特斯兰德大学，获法学学士学位。\n" +
                "\n" +
                "1944年，曼德拉参加主张非暴力斗争的南非非洲人国民大会(简称非国大)。1952年，曼德拉当选非国大“青年联盟”全国主席。1952年，他先后任非国大执委、德兰士瓦省主席、全国副主席。同年年底，他成功地组织并领导了“蔑视不公正法令运动”，赢得了外界的尊敬。\n" +
                "\n" +
                "曼德拉还和他的律师所同事奥利弗坦波开设了曼德拉坦波律师事务所，为请不起辩护律师的黑人提供免费或者低价的法律咨询服务。\n" +
                "\n" +
                "牢狱生涯数十载 难灭民族解放心\n" +
                "\n" +
                "投身政坛数十载，曼德拉历经风雨，早年求学、初涉政治，已经为其积累了丰富的经验。转入中期，曼德拉已经是可以独当一面的旗帜人物，但不料等待他的却是近30年的牢狱生活。然而，经受了牢狱洗礼之后的他，让自己的信念变得更加坚定，希望民族解放的心从未改变。\n" +
                "\n" +
                "1961年，曼德拉领导罢工运动，抗议和抵制白人种族主义者成立的“南非共和国”。1961年6月曼德拉创建非国大军事组织“民族之矛”，任总司令。他曾秘密赴国外访问，并出席在亚的斯亚贝巴召开的泛非自由运动大会，呼吁对南非实行经济制裁。";
//        wordFilter.filter(sentence) ;
        SensitiveInfo si = wordFilter.filter(sentence2);
        Assert.assertNotNull(si.getFoundWords());
        for(String word:si.getFoundWords()){
            System.out.println(word);
        }
    }



} 
