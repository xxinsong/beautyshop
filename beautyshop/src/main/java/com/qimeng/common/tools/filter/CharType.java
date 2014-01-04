package com.qimeng.common.tools.filter;

/**
 * User: Simon
 * Date: 13-12-5
 */
public class CharType {

    /**
     * Punctuation Characters
     */
    public final static int DELIMITER = 0;

    /**
     * Letters
     */
    public final static int LETTER = 1;

    /**
     * Numeric Digits
     */
    public final static int DIGIT = 2;

    /**
     * Han Ideographs
     */
    public final static int HANZI = 3;

    /**
     * Characters that act as a space
     */
    public final static int SPACE_LIKE = 4;

    /**
     * Full-Width letters
     */
    public final static int FULLWIDTH_LETTER = 5;

    /**
     * Full-Width alphanumeric characters
     */
    public final static int FULLWIDTH_DIGIT = 6;

    /**
     * Other (not fitting any of the other categories)
     */
    public final static int OTHER = 7;

    public static int getCharType(char ch) {
        // 最多的是汉字
        if (ch >= 0x4E00 && ch <= 0x9FA5)
            return CharType.HANZI;
        if ((ch >= 0x0041 && ch <= 0x005A) || (ch >= 0x0061 && ch <= 0x007A))
            return CharType.LETTER;
        if (ch >= 0x0030 && ch <= 0x0039)
            return CharType.DIGIT;
        if (ch == ' ' || ch == '\t' || ch == '\r' || ch == '\n' || ch == '　')
            return CharType.SPACE_LIKE;
        // 最前面的其它的都是标点符号了
        if ((ch >= 0x0021 && ch <= 0x00BB) || (ch >= 0x2010 && ch <= 0x2642)
                || (ch >= 0x3001 && ch <= 0x301E))
            return CharType.DELIMITER;

        // 全角字符区域
        if ((ch >= 0xFF21 && ch <= 0xFF3A) || (ch >= 0xFF41 && ch <= 0xFF5A))
            return CharType.FULLWIDTH_LETTER;
        if (ch >= 0xFF10 && ch <= 0xFF19)
            return CharType.FULLWIDTH_DIGIT;
        if (ch >= 0xFE30 && ch <= 0xFF63)
            return CharType.DELIMITER;
        return CharType.OTHER;

    }

}
