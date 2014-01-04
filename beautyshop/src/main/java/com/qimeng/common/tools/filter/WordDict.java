package com.qimeng.common.tools.filter;

import org.springframework.stereotype.Component;

import java.io.UnsupportedEncodingException;

/**
 * User: Simon
 * Date: 13-12-5
 */
@Component
public class WordDict {
    /**
     *第一维 wordItem_real[i] 其含义是：具有相同开头汉字X，的所有违禁词（一组）。其中下标 i 为 X 的 GB2312 码，这样只要对文档中的某一个汉字一转码，就能马上找到以此汉字开头的所有违禁词，算是一种散列吧；
     *另：每组违禁词 是有序的（升序），先按长度排序，再按 char 排序。查找时用到了二分查找所以需要保持有序。
     *
     *第二维 wordItem_real[i][j] 其含义是：具体的一个违禁词的字符串数组，例如违禁词“红薯” = {'红','薯'}。
     *
     *第三维 wordItem_real[i][j][k] 就是 词中某个汉字了。
     */
    private char[][][] wordItem_real;

    public boolean isEqual(char[] charArray, int foundIndex) {
        int index = getGBKId(charArray[0]);
        char[][] items = wordItem_real[index];
        char[] found = items[foundIndex];
        return charArray.length == found.length;
    }

    public int getPrefixMatch(char[] charArray) {
        return getPrefixMatch(charArray, 0);
    }

    public int getPrefixMatch(char[] charArray, int knownStart) {
        int index = getGBKId(charArray[0]);
        if (index == -1){
            return -1;
        }
        char[][] items = wordItem_real[index];
        if (items == null) {
            return -1; //没有以此字开头的违禁词
        }
        int start = knownStart, end = items.length - 1;
        int mid = (start + end) / 2, cmpResult;

        // 二分查找法
        while (start <= end) {
            cmpResult = compareArrayByPrefix(charArray, 0, items[mid],
                    0);
            if (cmpResult == 0) {
                // 获取第一个匹配到的（短的优先）
                while (mid >= 0
                        && compareArrayByPrefix(charArray, 0,
                        items[mid], 0) == 0) {
                   mid--;
                }
                mid++;
                return mid;// 找到第一个以charArray为前缀的单词
            } else if (cmpResult < 0) {
                end = mid - 1;
            } else {
                start = mid + 1;
            }
            mid = (start + end) / 2;
        }
        return -1;
    }

    /**
     * 根据前缀来判断两个字符数组的大小，当前者为后者的前缀时，表示相等，当不为前缀时，按照普通字符串方式比较
     *
     * @param shortArray
     * @param shortIndex
     * @param longArray
     * @param longIndex
     * @return
     */

    private int compareArrayByPrefix(char[] shortArray, int shortIndex, char[] longArray, int longIndex) {
        // 空数组是所有数组的前缀，不考虑index
        if (shortArray == null) {
            return 0;
        } else if (longArray == null) {
            return (shortIndex < shortArray.length) ? 1 : 0;
        }

        int si = shortIndex, li = longIndex;
        while (si < shortArray.length && li < longArray.length
                && shortArray[si] == longArray[li]) {
            si++;
            li++;
        }
        if (si == shortArray.length) {
            // shortArray 是 longArray的prefix
            return 0;
        } else {
            // 此时不可能si>shortArray.length因此只有si <
            // shortArray.length，表示si没有到达shortArray末尾

            // shortArray没有结束，但是longArray已经结束，因此shortArray > longArray
            if (li == longArray.length) {
                return 1;
            } else {
                // 此时不可能li>longArray.length因此只有li < longArray.length
                // 表示shortArray和longArray都没有结束，因此按下一个数的大小判断
                return (shortArray[si] > longArray[li]) ? 1 : -1;
            }
        }
    }

    /**
     * GBK：
     * CharPos := ((高8bit - 0x81)*191 + (低8bit － 0x40)) * 32
     * @param ch
     * @return
     */
    public short getGBKId(char ch) {
        try {
            byte[] buffer = Character.toString(ch).getBytes("GBK");
            if (buffer.length != 2) {
                return (short) (buffer[0] & 0x0FF);
            }
            int b0 = (int) (buffer[0] & 0x0FF) - 129; // 编码从0x81开始，因此减去0x81=129
            int b1 = (int) (buffer[1] & 0x0FF) - 64; // 编码从0x40开始，因此减去0x40=64
            return (short) (b0 * 191 + b1);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        return -1;
    }

    /**
     * GB2312：
     * CharPos := (高8bit - 0xA1)*94 + (低8bit - 0xA1)) :* 32
     * @param ch
     * @return
     */
    public short getGB2312Id(char ch) {
        try {
            byte[] buffer = Character.toString(ch).getBytes("GB2312");
            if (buffer.length != 2) {
                // Should be a two-byte character
                return -1;
            }
            int b0 = (int) (buffer[0] & 0x0FF) - 161; // 编码从A1开始，因此减去0xA1=161
            int b1 = (int) (buffer[1] & 0x0FF) - 161; // 第一个字符和最后一个字符没有汉字，因此每个区只收16*6-2=94个汉字
            return (short) (b0 * 94 + b1);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        return -1;
    }

    public void setWordItem_real(char[][][] wordItem_real) {
        this.wordItem_real = wordItem_real;
    }

    public static void main(String[] args) {
        System.out.println('a'>'b');
        System.out.println('a'>'ī');
        System.out.println("ba".compareTo("bīng"));
        System.out.println("ba".compareTo("baozha"));
        System.out.println("bao".compareTo("baozha"));
    }
}
