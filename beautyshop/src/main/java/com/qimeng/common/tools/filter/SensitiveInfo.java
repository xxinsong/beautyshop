package com.qimeng.common.tools.filter;

import java.util.ArrayList;
import java.util.List;

/**
 * User: Simon
 * Date: 13-12-5
 */
public class SensitiveInfo {

    private String sentence;
    private List<SensitiveWordToken> tokenList = new ArrayList<SensitiveWordToken>();

    public SensitiveInfo(){
    }

    public SensitiveInfo(String sentence) {
        this.sentence = sentence;
    }

    public void addToken(SensitiveWordToken token) {
        tokenList.add(token);
    }

    public String[] getFoundWords(){
        int size = tokenList.size();
        String[] foundWords = new String[size];
        for(int i=0;i<size;i++){
            SensitiveWordToken token = tokenList.get(i);
            foundWords[i] = sentence.substring(token.getStart(),token.getEnd());
        }
        return foundWords;
    }
}
