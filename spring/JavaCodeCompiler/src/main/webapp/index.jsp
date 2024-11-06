<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Java Code Editor with IntelliSense</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/monaco-editor/0.34.1/min/vs/loader.js"></script>
    <style>
        #editor {
            width: 800px;
            height: 600px;
            border: 1px solid #ccc;
        }
    </style>
</head>
<body>
    <h1>Java Code Editor</h1>
    <div id="editor"></div>
    <button onclick="submitCode()">컴파일 및 실행</button>

    <form id="codeForm" action="compileResult.jsp" method="post" style="display:none;">
        <textarea name="javaCode" id="javaCode"></textarea>
    </form>

	<div>  
      <select name="languages" id="lang">
	    <option value="javascript">Nanum Gothic Coding</option>
	    <option value="php">D2Coding</option>
	    <option value="java">Intel One Mono</option> 
	  </select>
</div>  

    <script>

    require.config({ paths: { 'vs': 'https://cdnjs.cloudflare.com/ajax/libs/monaco-editor/0.34.1/min/vs' } });
    require(['vs/editor/editor.main'], function () {
        // 사용자 정의 테마 정의
        monaco.editor.defineTheme("myTheme", {
            base: "vs",
            inherit: true,
            rules: [
                { token: 'comment', foreground: '008800', fontStyle: 'italic' },
                { token: 'keyword', foreground: '0000FF', fontStyle: 'bold' },
                { token: 'string', foreground: 'A31515' },
                { token: 'number', foreground: '09885A' },
            ],
            colors: {
                
        		"textBlockQuote.background": "#FFFFFF",
        		"focusBorder": "#FFFFFF",
        		"editor.hoverHighlightBackground": "#FF0000",
                "descriptionForeground": "#FF0000",
            }
        });

        // 사용자 정의 테마 적용
        monaco.editor.setTheme("myTheme");

        // Monaco Editor 초기화
        window.editor = monaco.editor.create(document.getElementById('editor'), {
            value: [
                'public class Test {',
                '    public static void main(String[] args) {',
                '        System.out.println("Hello, World!");',
                '    }',
                '}'
            ].join('\n'),
            language: 'java',
            theme: 'vs-dark',
        });
        
        // IntelliSense 자동완성 기능 추가
    monaco.languages.registerCompletionItemProvider('java', {
        provideCompletionItems: function (model, position) {
            const customSuggestions = [
            		{
            		    label: 'sysout',
            		    kind: monaco.languages.CompletionItemKind.Snippet,
            		    insertText: [
            		        'System.out.println(\\${1:word_selection});\\${0}'
            		    ].join('\n'),
            		    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
            		    documentation: "System.out.println template"
            		},

            		{
            		    label: 'trycatch',
            		    kind: monaco.languages.CompletionItemKind.Snippet,
            		    insertText: [
            		        'try {',
            		        '    \\${1}',
            		        '} catch (\\${2:Exception} \\${3:e}) {',
            		        '    \\${0}'
            		    ].join('\n'),
            		    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
            		    documentation: "Try-catch block template"
            		},

            		{
            		    label: 'tryfinally',
            		    kind: monaco.languages.CompletionItemKind.Snippet,
            		    insertText: [
            		        'try {',
            		        '    \\${1}',
            		        '} finally {',
            		        '    \\${0}'
            		    ].join('\n'),
            		    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
            		    documentation: "Try-finally block template"
            		},

            		{
            		    label: 'main',
            		    kind: monaco.languages.CompletionItemKind.Snippet,
            		    insertText: [
            		        'public static void main(String[] args) {',
            		        '    \\${0}',
            		        '}'
            		    ].join('\n'),
            		    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
            		    documentation: "Main method template"
            		},

            		{
            		    label: 'if',
            		    kind: monaco.languages.CompletionItemKind.Snippet,
            		    insertText: [
            		        'if (\\${1:condition}) {',
            		        '    \\${0}',
            		        '}'
            		    ].join('\n'),
            		    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
            		    documentation: "If statement template"
            		},

            		{
            		    label: 'else',
            		    kind: monaco.languages.CompletionItemKind.Snippet,
            		    insertText: [
            		        'else {',
            		        '    \\${0}',
            		        '}'
            		    ].join('\n'),
            		    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
            		    documentation: "Else statement template"
            		},

            		{
            		    label: 'catch',
            		    kind: monaco.languages.CompletionItemKind.Snippet,
            		    insertText: [
            		        'catch (\\${1:Exception} \\${2:e}) {',
            		        '    \\${0}'
            		    ].join('\n'),
            		    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
            		    documentation: "Catch block template"
            		},

					{
					    label: 'finally',
					    kind: monaco.languages.CompletionItemKind.Snippet,
					    insertText: [
					        'finally {',
					        '    \\${0}',
					        '}'
					    ].join('\n'),
					    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
					    documentation: "Finally block template"
					},

            		{
            		    label: 'switch',
            		    kind: monaco.languages.CompletionItemKind.Snippet,
            		    insertText: [
            		        'switch (\\${1:key}) {',
            		        '    case \\${2:value}:',
            		        '        \\${0}',
            		        '        break;',
            		        '    default:',
            		        '        break;',
            		        '}'
            		    ].join('\n'),
            		    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
            		    documentation: "Switch statement template"
            		},

            		{
            		    label: 'while',
            		    kind: monaco.languages.CompletionItemKind.Snippet,
            		    insertText: [
            		        'while (\\${1:condition}) {',
            		        '    \\${0}',
            		        '}'
            		    ].join('\n'),
            		    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
            		    documentation: "While loop template"
            		},

            		{
            		    label: 'dowhile',
            		    kind: monaco.languages.CompletionItemKind.Snippet,
            		    insertText: [
            		        'do {',
            		        '    \\${0}',
            		        '} while (\\${1:condition});'
            		    ].join('\n'),
            		    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
            		    documentation: "Do-while loop template"
            		},

            		{
            		    label: 'forloop',
            		    kind: monaco.languages.CompletionItemKind.Snippet,
            		    insertText: [
            		        'for (int \\${1:index} = 0; \\${1:index} < \\${2:array}.length; \\${1:index}++) {',
            		        '    \\${0}',
            		        '}'
            		    ].join('\n'),
            		    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
            		    documentation: "For loop template"
            		},

            		{
            		    label: 'foreachloop',
            		    kind: monaco.languages.CompletionItemKind.Snippet,
            		    insertText: [
            		        'for (\\${1:iterable_type} \\${2:element} : \\${3:iterable}) {',
            		        '    \\${0}',
            		        '}'
            		    ].join('\n'),
            		    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
            		    documentation: "Foreach loop template"
            		},

            		{
            		    label: 'syserr',
            		    kind: monaco.languages.CompletionItemKind.Snippet,
            		    insertText: [
            		        'System.err.println(\\${1:word_selection});\\${0}'
            		    ].join('\n'),
            		    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
            		    documentation: "System.err.println template"
            		},

            		{
            		    label: 'ifelse',
            		    kind: monaco.languages.CompletionItemKind.Snippet,
            		    insertText: [
            		        'if (\\${1:condition}) {',
            		        '    \\${2}',
            		        '} else {',
            		        '    \\${0}',
            		        '}'
            		    ].join('\n'),
            		    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
            		    documentation: "If-else statement template"
            		},

            		{
            		    label: 'ifelseif',
            		    kind: monaco.languages.CompletionItemKind.Snippet,
            		    insertText: [
            		        'if (\\${1:condition}) {',
            		        '    \\${2}',
            		        '} else if (\\${3:condition}) {',
            		        '    \\${4}',
            		        '} else {',
            		        '    \\${0}',
            		        '}\\${5}'
            		    ].join('\n'),
            		    insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
            		    documentation: "If-else-if statement template"
            		}

           		 ];
	            return { suggestions: customSuggestions };
	        }
        });

    }); // require 함수의 끝

	    function fetchSuggestions(prefix) {
    
    		console.log(prefix);
    
	        fetch('/autocomplete?prefix=' + encodeURIComponent(prefix))
	            .then(response => response.json())
	            .then(suggestions => {
	                console.log(suggestions);  // 받은 제안 결과를 확인
	            })
	            .catch(error => console.error("Error fetching suggestions:", error));
	    }

        // 코드 제출 함수
        function submitCode() {
            const code = window.editor.getValue();
            document.getElementById('javaCode').value = code;
            document.getElementById('codeForm').submit();
        }
    </script>
</body>
</html>
