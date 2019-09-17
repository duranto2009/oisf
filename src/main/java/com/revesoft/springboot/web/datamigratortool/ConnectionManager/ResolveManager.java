package com.revesoft.springboot.web.datamigratortool.ConnectionManager;

import com.revesoft.springboot.web.datamigratortool.DatabaseFrom.DatabaseFromAnalyzer;
import com.revesoft.springboot.web.datamigratortool.DatabaseTo.DatabaseToAnalyzer;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.ArrayList;
import java.util.HashMap;

/**
 * Created by reve on 4/19/2018.
 */
public class ResolveManager {
    final private Logger logger = LogManager.getLogger(ResolveManager.class);
    private int longestCommonSubSequence( char[] X, char[] Y, int m, int n )
    {
        if (m == 0 || n == 0)
            return 0;
        if (X[m-1] == Y[n-1])
            return 1 + longestCommonSubSequence(X, Y, m-1, n-1);
        else
            return Math.max(longestCommonSubSequence(X, Y, m, n-1), longestCommonSubSequence(X, Y, m-1, n));
    }

    private   String longestSubstring(String str1, String str2) {

        StringBuilder sb = new StringBuilder();
        if (str1 == null || str1.isEmpty() || str2 == null || str2.isEmpty())
            return "";

// ignore case
        str1 = str1.toLowerCase();
        str2 = str2.toLowerCase();

// java initializes them already with 0
        int[][] num = new int[str1.length()][str2.length()];
        int maxlen = 0;
        int lastSubsBegin = 0;

        for (int i = 0; i < str1.length(); i++) {
            for (int j = 0; j < str2.length(); j++) {
                if (str1.charAt(i) == str2.charAt(j)) {
                    if ((i == 0) || (j == 0))
                        num[i][j] = 1;
                    else
                        num[i][j] = 1 + num[i - 1][j - 1];

                    if (num[i][j] > maxlen) {
                        maxlen = num[i][j];
                        // generate substring from str1 => i
                        int thisSubsBegin = i - num[i][j] + 1;
                        if (lastSubsBegin == thisSubsBegin) {
                            //if the current LCS is the same as the last time this block ran
                            sb.append(str1.charAt(i));
                        } else {
                            //this block resets the string builder if a different LCS is found
                            lastSubsBegin = thisSubsBegin;
                            sb = new StringBuilder();
                            sb.append(str1.substring(lastSubsBegin, i + 1));
                        }
                    }
                }
            }}

        return sb.toString();
    }

    private int minDifference(String sourceColumn, String destinationColumn){
        //System.out.print("("+sourceColumn+","+destinationColumn+")");
        String logestCommonSubstring =  longestSubstring(sourceColumn,destinationColumn);
       // System.out.print("="+logestCommonSubstring+","+logestCommonSubstring.length()+"");
        //System.out.println(":"+Math.abs(sourceColumn.length()-logestCommonSubstring.length()));
        return Math.abs(sourceColumn.length()-logestCommonSubstring.length());
    }

    public HashMap<String,String> duplicateValueTesting(HashMap<String,String> sameSameColumnMapping){
        try {
            ArrayList<String> faultKeyList = new ArrayList<>();
            ArrayList<String> valueResolvedList = new ArrayList<>();
            for (String key : sameSameColumnMapping.keySet()) {
                ArrayList<String> duplicateValuedKeyList = new ArrayList<>();
                String value = sameSameColumnMapping.get(key);
                if (valueResolvedList.contains(value)) continue;
//            System.out.print(value+"----->");
                duplicateValuedKeyList.add(key);
                for (String key2 : sameSameColumnMapping.keySet()) {
                    if (!key.equals(key2)) {
                        String value2 = sameSameColumnMapping.get(key2);
                        if (value.equals(value2)) {
                            duplicateValuedKeyList.add(key2);
                        }
                    }
                }
//            System.out.println(duplicateValuedKeyList.toString());

                if (duplicateValuedKeyList.size() > 1) {
                    int mindiff = 10000;
                    String championKey = "";
                    for (int i = 0; i < duplicateValuedKeyList.size(); i++) {
                        String candidateKey = duplicateValuedKeyList.get(i);
                        int diff = Math.abs(value.length() - candidateKey.length());
                        if (mindiff > diff) {
                            mindiff = diff;
                            if (!championKey.equals("") && !faultKeyList.contains(championKey))
                                faultKeyList.add(championKey);
                            championKey = candidateKey;
                        } else {
                            if (!faultKeyList.contains(candidateKey)) faultKeyList.add(candidateKey);
                        }
                    }
//                System.out.println(faultKeyList.toString());
                }
                valueResolvedList.add(value);
            }

            for (int i = 0; i < faultKeyList.size(); i++) {
                sameSameColumnMapping.remove(faultKeyList.get(i));
            }

        }catch (Exception e){
            logger.error("error",e);
        }
        return sameSameColumnMapping;
    }

    public HashMap<String,String> columnResolve(String sourceTableName,String destinationTableName){
        HashMap<String, String> mapping = new HashMap<>();
        try {

            ArrayList<String> sourceTableColumnList = new DatabaseFromAnalyzer().getColumnList(sourceTableName);
//        System.out.println(sourceTableColumnList);
            ArrayList<String> destinationTableColumnList = new DatabaseToAnalyzer().getColumnList(destinationTableName);
//        System.out.println(destinationTableColumnList);
            for (int i = 0; i < sourceTableColumnList.size(); i++) {
                int min = 100000;
                String column1 = sourceTableColumnList.get(i);
                String mappedColumn = "";
                for (int j = 0; j < destinationTableColumnList.size(); j++) {
                    String column2 = destinationTableColumnList.get(j);
                    int value = minDifference(column1, column2);
                    if (min > value) {
                        min = value;
                        mappedColumn = column2;
                    } else if (min == value) {
                        int val1 = Math.abs(column1.length() - mappedColumn.length());
                        int val2 = Math.abs(column1.length() - column2.length());
                        mappedColumn = (val1 > val2) ? column2 : mappedColumn;
                    }
                }

                mapping.put(column1, mappedColumn);
            }
//        for(String string:mapping.keySet()){
//            System.out.println(string +" "+mapping.get(string));
//        }

            mapping = duplicateValueTesting(mapping);

        }catch (Exception e){
            logger.error("error",e);
            e.printStackTrace();
        }
        return mapping;


    }
}
