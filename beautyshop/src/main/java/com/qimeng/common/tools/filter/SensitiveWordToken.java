package com.qimeng.common.tools.filter;

/**
 * User: Simon
 * Date: 13-12-5
 */
public class SensitiveWordToken {
    private String word;
    private int start;
    private int end;

    public SensitiveWordToken(){}

    public SensitiveWordToken(String word, int start, int end) {
        this.word = word;
        this.start = start;
        this.end = end;
    }

    public String getWord() {
        return word;
    }

    public int getStart() {
        return start;
    }

    public int getEnd() {
        return end;
    }
}
