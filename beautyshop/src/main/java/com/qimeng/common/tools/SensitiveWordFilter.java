package com.qimeng.common.tools;

import com.qimeng.common.tools.filter.CharType;
import com.qimeng.common.tools.filter.SensitiveInfo;
import com.qimeng.common.tools.filter.SensitiveWordToken;
import com.qimeng.common.tools.filter.WordDict;
import com.qimeng.bs.system.staticdata.bean.SensitiveWord;
import com.qimeng.bs.system.staticdata.dao.SensitiveWordMapper;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.*;

/**
 * User: Simon
 * Date: 13-12-5
 * 敏感词过滤器
 */
@Component
public class SensitiveWordFilter {
    private Logger logger = Logger.getLogger(SensitiveWordFilter.class);
    @Autowired
    private WordDict wordDict;
    @Autowired
    private SensitiveWordMapper sensitiveWordMapper;

    public SensitiveInfo filter(String sentence) {
        int[] charTypeArray = getCharTypes(sentence);//获取出每个字符的类型
        SensitiveInfo result = new SensitiveInfo(sentence);
        SensitiveWordToken token;
        int i = 0, j;
        int length = sentence.length();
        int foundIndex;
        char[] charArray;
        StringBuilder wordBuf = new StringBuilder();
        while (i < length) {
            // 只处理汉字和字母
            if (CharType.HANZI == charTypeArray[i]
                    || CharType.LETTER == charTypeArray[i]) {
                j = i + 1;
                wordBuf.delete(0, wordBuf.length());//新的一轮匹配,清除掉原来的
                wordBuf.append(sentence.charAt(i));
                charArray = new char[]{sentence.charAt(i)};
                foundIndex = wordDict.getPrefixMatch(charArray);//前缀匹配违禁词

                //foundIndex表示记录了前缀匹配的位置
                while (j <= length && foundIndex != -1) {

                    // 表示找到了
                    if (wordDict.isEqual(charArray,foundIndex) && charArray.length > 0) {
                        token = new SensitiveWordToken(new String(charArray), i, j);
                        result.addToken(token);//记录下来
                        i = j - 1; // j在匹配成功时已经自加了，这里是验证确实是违禁词，所以需要将j前一个位置给i
                    }
                    // 忽略空格、数字、符号、全角数字
                    while (j < length
                            && (charTypeArray[j] == CharType.SPACE_LIKE
                                ||charTypeArray[j] == CharType.DELIMITER
                                ||charTypeArray[j] == CharType.DIGIT
                                ||charTypeArray[j] == CharType.FULLWIDTH_DIGIT))
                        j++;
                    if (j < length
                            && (charTypeArray[j] == CharType.HANZI || CharType.LETTER == charTypeArray[j])) {
                        //将下个字符和前面的组合起来, 继续前缀匹配
                        wordBuf.append(sentence.charAt(j));
                        charArray = new char[wordBuf.length()];
                        wordBuf.getChars(0, charArray.length, charArray, 0);
                        foundIndex = wordDict.getPrefixMatch(charArray,
                                foundIndex);//前缀匹配违禁词
                        j++;
                    } else {
                        break;
                    }

                }
            }
            i++;
        }
        return result;

    }

    private int[] getCharTypes(String sentence) {
        char[] charArray = sentence.toCharArray();
        int length = charArray.length;
        int[] charTypes = new int[length];
        for(int i=0;i<length;i++){
            charTypes[i] = CharType.getCharType(charArray[i]);
        }
        return charTypes;
    }

    public void initWordDict() {
//        List<String> wordList = new ArrayList<String>();
        List<SensitiveWord> wordList = sensitiveWordMapper.selectAll();
        char[][][] wordItem = new char[65536][][];

        Map<Character,Set<String>> group = new HashMap<Character,Set<String>>();
        for(SensitiveWord sensitiveWord:wordList){
            String word = sensitiveWord.getWord();
            char firstChar = word.toCharArray()[0];
            Set<String> groupSet = group.get(firstChar);
            if(groupSet == null){
                groupSet = new TreeSet<String>();
                group.put(firstChar,groupSet);
            }
            groupSet.add(word);
        }

        List<String> badwords = new ArrayList<String>();
        for (Map.Entry<Character, Set<String>> entry : group.entrySet()) {
            Character key = entry.getKey();
            short index = wordDict.getGBKId(key);
            Set<String> set = entry.getValue();
            Object[] wordArray = set.toArray();
            int size = wordArray.length;
            char[][] chars = new char[size][];
            for (int i = 0; i < size; i++) {
                String word = (String) wordArray[i];
                chars[i] = word.toCharArray();
            }
            if (index == -1) {
                badwords.add(key.toString());
                continue;
            }
            wordItem[index] = chars;
        }

        StringBuilder sb = new StringBuilder();
        for(String badword:badwords){
            sb.append(badword).append("|");
        }
        if(sb.length()>0){
            logger.warn("*********************不支持的敏感词**********************");
            logger.warn(sb.toString());
            logger.warn("*******************************************************");
        }
        wordDict.setWordItem_real(wordItem);
    }

}
