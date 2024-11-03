package com.javacompiler.servlet;

public class Test {
    
       public static void main(String[] args) {
		
    	  
    	
	}
}

//{
//    label: 'main',
//    kind: monaco.languages.CompletionItemKind.Snippet,
//    insertText: [
//        'public static void main(String[] args) {',
//        '    \\${1:/* 여기에 코드를 입력하세요 */}',
//        '}'
//    ].join('\n'),
//    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
//    documentation: "Main method template"
//},
//{
//    label: 'sysout',
//    kind: monaco.languages.CompletionItemKind.Snippet,
//    insertText: 'System.out.println(\\${1:""});',
//    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
//    documentation: "System.out.println() statement"
//},
//{
//    label: 'for',
//    kind: monaco.languages.CompletionItemKind.Snippet,
//    insertText: [
//        'for (int \\${1:i} = 0; \\${1:i} < \\${2:array}.length; \\${1:i}++) {',
//        '    \\${0:/* 반복 코드 */}',
//        '}'
//    ].join('\n'),
//    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
//    documentation: "For loop template"
//},
//{
//    label: 'try-catch',
//    kind: monaco.languages.CompletionItemKind.Snippet,
//    insertText: [
//        'try {',
//        '    \\${1:/* 코드 */}',
//        '} catch (\\${2:Exception} \\${3:e}) {',
//        '    \\${0:// 예외 처리 코드}',
//        '}'
//    ].join('\n'),
//    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
//    documentation: "Try-catch block template"
//},
//{
//    label: 'if',
//    kind: monaco.languages.CompletionItemKind.Snippet,
//    insertText: [
//        'if (\\${1:condition}) {',
//        '    \\${0:/* 조건 코드 */}',
//        '}'
//    ].join('\n'),
//    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
//    documentation: "If statement template"
//},
//{
//    label: 'else',
//    kind: monaco.languages.CompletionItemKind.Snippet,
//    insertText: [
//        'else {',
//        '    \\${0:/* 조건 코드 */}',
//        '}'
//    ].join('\n'),
//    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
//    documentation: "Else statement template"
//},
//{
//    label: 'for',
//    kind: monaco.languages.CompletionItemKind.Snippet,
//    insertText: [
//        'for (int \\${1:i} = 0; \\${1:i} < \\${2:array}.length; \\${1:i}++) {',
//        '    \\${0:/* 반복 코드 */}',
//        '}'
//    ].join('\n'),
//    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
//    documentation: "For loop template"
//},
//{
//    label: 'try-catch',
//    kind: monaco.languages.CompletionItemKind.Snippet,
//    insertText: [
//        'try {',
//        '    \\${1:/* 코드 */}',
//        '} catch (\\${2:Exception} \\${3:e}) {',
//        '    \\${0:// 예외 처리 코드}',
//        '}'
//    ].join('\n'),
//    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
//    documentation: "Try-catch block template"
//},
//{
//    label: 'try-finally',
//    kind: monaco.languages.CompletionItemKind.Snippet,
//    insertText: [
//        'try {',
//        '    \\${1:/* 코드 */}',
//        '} finally {',
//        '    \\${0:// 정리 코드}',
//        '}'
//    ].join('\n'),
//    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
//    documentation: "Try-finally block template"
//},
//{
//    label: 'class',
//    kind: monaco.languages.CompletionItemKind.Snippet,
//    insertText: [
//        'public class \\${1:ClassName} {',
//        '    \\${0:/* 클래스 내용 */}',
//        '}'
//    ].join('\n'),
//    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
//    documentation: "Class template"
//},
//{
//    label: 'method',
//    kind: monaco.languages.CompletionItemKind.Snippet,
//    insertText: [
//        'public \\${1:void} \\${2:methodName}() {',
//        '    \\${0:/* 메소드 내용 */}',
//        '}'
//    ].join('\n'),
//    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
//    documentation: "Method template"
//},
//{
//    label: 'constructor',
//    kind: monaco.languages.CompletionItemKind.Snippet,
//    insertText: [
//        'public \\${1:ClassName}() {',
//        '    \\${0:/* 생성자 내용 */}',
//        '}'
//    ].join('\n'),
//    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
//    documentation: "Constructor template"
//},
//{
//    label: 'enum',
//    kind: monaco.languages.CompletionItemKind.Snippet,
//    insertText: [
//        'public enum \\${1:EnumName} {',
//        '    \\${0:/* 열거형 내용 */}',
//        '}'
//    ].join('\n'),
//    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
//    documentation: "Enum template"
//},
//{
//    label: 'interface',
//    kind: monaco.languages.CompletionItemKind.Snippet,
//    insertText: [
//        'public interface \\${1:InterfaceName} {',
//        '    \\${0:/* 인터페이스 내용 */}',
//        '}'
//    ].join('\n'),
//    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
//    documentation: "Interface template"
//},
//
//{
//    label: 'getter',
//    kind: monaco.languages.CompletionItemKind.Snippet,
//    insertText: [
//        'public \\${1:Type} get\\${2:Property}() {',
//        '    return \\${3:property};',
//        '}'
//    ].join('\n'),
//    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
//    documentation: "Getter method template"
//},
//{
//    label: 'setter',
//    kind: monaco.languages.CompletionItemKind.Snippet,
//    insertText: [
//        'public void set\\${1:Property}(\\${2:Type} \\${3:property}) {',
//        '    this.\\${3:property} = \\${3:property};',
//        '}'
//    ].join('\n'),
//    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
//    documentation: "Setter method template"
//},
//{
//    label: 'switch',
//    kind: monaco.languages.CompletionItemKind.Snippet,
//    insertText: [
//        'switch (\\${1:variable}) {',
//        '    case \\${2:value}:',
//        '        \\${0:/* 코드 */}',
//        '        break;',
//        '    default:',
//        '        break;',
//        '}'
//    ].join('\n'),
//    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
//    documentation: "Switch statement template"
//},
//{
//    label: 'do-while',
//    kind: monaco.languages.CompletionItemKind.Snippet,
//    insertText: [
//        'do {',
//        '    \\${0:/* 반복 코드 */}',
//        '} while (\\${1:condition});'
//    ].join('\n'),
//    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
//    documentation: "Do-while loop template"
//},
//{
//    label: 'while',
//    kind: monaco.languages.CompletionItemKind.Snippet,
//    insertText: [
//        'while (\\${1:condition}) {',
//        '    \\${0:/* 반복 코드 */}',
//        '}'
//    ].join('\n'),
//    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
//    documentation: "While loop template"
//},
//{
//    label: 'public_method',
//    kind: monaco.languages.CompletionItemKind.Snippet,
//    insertText: [
//        'public \\${1:void} \\${2:methodName}() {',
//        '    \\${0:/* 메소드 내용 */}',
//        '}'
//    ].join('\n'),
//    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
//    documentation: "Public method template"
//},
//{
//    label: 'private_method',
//    kind: monaco.languages.CompletionItemKind.Snippet,
//    insertText: [
//        'private \\${1:void} \\${2:methodName}() {',
//        '    \\${0:/* 메소드 내용 */}',
//        '}'
//    ].join('\n'),
//    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
//    documentation: "Private method template"
//},
//{
//    label: 'protected_method',
//    kind: monaco.languages.CompletionItemKind.Snippet,
//    insertText: [
//        'protected \\${1:void} \\${2:methodName}() {',
//        '    \\${0:/* 메소드 내용 */}',
//        '}'
//    ].join('\n'),
//    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
//    documentation: "Protected method template"
//},
//{
//    label: 'else_if',
//    kind: monaco.languages.CompletionItemKind.Snippet,
//    insertText: [
//        'else if (\\${1:condition}) {',
//        '    \\${0:/* 조건 코드 */}',
//        '}'
//    ].join('\n'),
//    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
//    documentation: "Else-if statement template"
//},
//{
//    label: 'main',
//    kind: monaco.languages.CompletionItemKind.Snippet,
//    insertText: [
//        'public static void main(String[] args) {',
//        '    \\${0:/* 메인 코드 */}',
//        '}'
//    ].join('\n'),
//    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
//    documentation: "Main method template"
//},
//{
//    label: 'sysout',
//    kind: monaco.languages.CompletionItemKind.Snippet,
//    insertText: 'System.out.println(\\${1:""});',
//    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
//    documentation: "System.out.println() statement"
//},
//{
//    label: 'if_else',
//    kind: monaco.languages.CompletionItemKind.Snippet,
//    insertText: [
//        'if (\\${1:condition}) {',
//        '    \\${2:/* 코드 */}',
//        '} else {',
//        '    \\${0:/* 조건 코드 */}',
//        '}'
//    ].join('\n'),
//    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
//    documentation: "If-else statement template"
//},
//{
//    label: 'return',
//    kind: monaco.languages.CompletionItemKind.Snippet,
//    insertText: 'return \\${1:value};',
//    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
//    documentation: "Return statement"
//},
//{
//    label: 'new',
//    kind: monaco.languages.CompletionItemKind.Snippet,
//    insertText: 'new \\${1:Type}(\\${2:arguments});',
//    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
//    documentation: "New object instantiation"
//},
//{
//    label: 'static_variable',
//    kind: monaco.languages.CompletionItemKind.Snippet,
//    insertText: 'private static final \\${1:Type} \\${2:CONSTANT} = \\${3:value};',
//    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
//    documentation: "Static variable template"
//},
//{
//    label: 'array_declaration',
//    kind: monaco.languages.CompletionItemKind.Snippet,
//    insertText: '\\${1:Type}[] \\${2:array} = new \\${1:Type}[\\${3:size}];',
//    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
//    documentation: "Array declaration template"
//},
//{
//    label: 'map_entry',
//    kind: monaco.languages.CompletionItemKind.Snippet,
//    insertText: [
//        'for (Map.Entry<\\${1:KeyType}, \\${2:ValueType}> \\${3:entry} : \\${4:map}.entrySet()) {',
//        '    \\${0:/* 반복 코드 */}',
//        '}'
//    ].join('\n'),
//    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
//    documentation: "Map entry loop template"
//},
//{
//    label: 'logger',
//    kind: monaco.languages.CompletionItemKind.Snippet,
//    insertText: 'private static final Logger logger = LoggerFactory.getLogger(\\${1:ClassName}.class);',
//    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
//    documentation: "Logger declaration template"
//},
//{
//    label: 'synchronized',
//    kind: monaco.languages.CompletionItemKind.Snippet,
//    insertText: [
//        'synchronized (\\${1:lock}) {',
//        '    \\${0:/* 코드 */}',
//        '}'
//    ].join('\n'),
//    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
//    documentation: "Synchronized block template"
//},
//{
//    label: 'throw',
//    kind: monaco.languages.CompletionItemKind.Snippet,
//    insertText: 'throw new \\${1:Exception}(\\${2:"에러 메시지"});',
//    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
//    documentation: "Throw exception template"
//},
//{
//    label: 'while_enumeration',
//    kind: monaco.languages.CompletionItemKind.Snippet,
//    insertText: [
//        'while (\\${1:enumeration}.hasMoreElements()) {',
//        '    \\${2:Type} \\${3:element} = \\${1:enumeration}.nextElement();',
//        '    \\${0:/* 코드 */}',
//        '}'
//    ].join('\n'),
//    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
//    documentation: "While enumeration template"
//},
//{
//    label: 'public_static_method',
//    kind: monaco.languages.CompletionItemKind.Snippet,
//    insertText: [
//        'public static \\${1:void} \\${2:methodName}() {',
//        '    \\${0:/* 메소드 내용 */}',
//        '}'
//    ].join('\n'),
//    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
//    documentation: "Public static method template"
//},
//{
//    label: 'catch',
//    kind: monaco.languages.CompletionItemKind.Snippet,
//    insertText: [
//        'catch (\\${1:Exception} \\${2:e}) {',
//        '    \\${0:// 예외 처리 코드}',
//        '}'
//    ].join('\n'),
//    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
//    documentation: "Catch block template"
//},
//{
//    label: 'Runnable',
//    kind: monaco.languages.CompletionItemKind.Snippet,
//    insertText: [
//        'new Runnable() {',
//        '    @Override',
//        '    public void run() {',
//        '        \\${0:/* 코드 */}',
//        '    }',
//        '};'
//    ].join('\n'),
//    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
//    documentation: "Runnable template"
//},
//{
//    label: 'assertNotNull',
//    kind: monaco.languages.CompletionItemKind.Snippet,
//    insertText: 'Assert.assertNotNull("\\${1:message}", \\${2:object});',
//    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
//    documentation: "Assert not null template"
//},
//{
//    label: 'log_error',
//    kind: monaco.languages.CompletionItemKind.Snippet,
//    insertText: 'logger.error("\\${1:error message}", \\${2:exception});',
//    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
//    documentation: "Log error template"
//},
//{
//    label: 'public_interface',
//    kind: monaco.languages.CompletionItemKind.Snippet,
//    insertText: [
//        'public interface \\${1:InterfaceName} {',
//        '    \\${0:/* 인터페이스 내용 */}',
//        '}'
//    ].join('\n'),
//    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
//    documentation: "Public interface template"
//},
//{
//    label: 'case',
//    kind: monaco.languages.CompletionItemKind.Snippet,
//    insertText: 'case \\${1:value}:\n    ${0}\n    break;',
//    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
//    documentation: "Case statement"
//}

