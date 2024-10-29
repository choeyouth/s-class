package com.example.intellisense;

import org.eclipse.jdt.core.dom.AST;
import org.eclipse.jdt.core.dom.ASTParser;
import java.util.Arrays;
import java.util.List;

public class JavaKeywordProvider {

    public List<String> getJavaKeywords() {
        // Java 키워드 목록을 하드코딩 (대체 가능)
        return Arrays.asList(
                "abstract", "assert", "boolean", "break", "byte", "case", "catch",
                "char", "class", "const", "continue", "default", "do", "double",
                "else", "enum", "extends", "final", "finally", "float", "for",
                "if", "implements", "import", "instanceof", "int", "interface",
                "long", "native", "new", "null", "package", "private", "protected",
                "public", "return", "short", "static", "strictfp", "super", "switch",
                "synchronized", "this", "throw", "throws", "transient", "try", "void",
                "volatile", "while"
        );
    }

    // ASTParser를 사용해 Java 코드를 분석하는 예제
    public void parseJavaCode(String code) {
        ASTParser parser = ASTParser.newParser(AST.JLS11); // Java 11 구문 파서 사용
        parser.setSource(code.toCharArray());
        parser.setKind(ASTParser.K_COMPILATION_UNIT);

        parser.createAST(null); // AST 생성
    }
}
