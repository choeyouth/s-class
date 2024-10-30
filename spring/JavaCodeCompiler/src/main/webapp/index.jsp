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

    <script>
        require.config({ paths: { 'vs': 'https://cdnjs.cloudflare.com/ajax/libs/monaco-editor/0.34.1/min/vs' } });
        require(['vs/editor/editor.main'], function () {
            // 사용자 정의 테마 정의
            monaco.editor.defineTheme("myTheme", {
                base: "vs",  // 기본 테마 사용 ("vs-dark", "vs-light" 등)
                inherit: true,  // 기본 테마를 상속받음
                rules: [
                    { token: 'comment', foreground: '008800', fontStyle: 'italic' },
                    { token: 'keyword', foreground: '0000FF', fontStyle: 'bold' },
                    { token: 'string', foreground: 'A31515' },
                    { token: 'number', foreground: '09885A' },
                ],
                colors: {
                    "editor.foreground": "#000000",
                    "editor.background": "#EDF9FA",
                    "editorCursor.foreground": "#8B0000",
                    "editor.lineHighlightBackground": "#0000FF20",
                    "editorLineNumber.foreground": "#008800",
                    "editor.selectionBackground": "#88000030",
                    "editor.inactiveSelectionBackground": "#88000015",
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
                theme: 'myTheme',  // 초기화 시 사용자 테마 적용
            });

            // IntelliSense 자동완성 기능 추가
            monaco.languages.registerCompletionItemProvider('java', {
                provideCompletionItems: async function (model, position) {
                    const word = model.getWordUntilPosition(position);
                    const prefix = word.word;

                    // 서버에 자동완성 요청
                    const response = await fetch(`/JavaCodeCompiler/autocomplete?prefix=${prefix}`);
                    const suggestions = await response.json();

                    return {
                        suggestions: suggestions.map(suggestion => ({
                            label: suggestion,
                            kind: monaco.languages.CompletionItemKind.Function,
                            insertText: suggestion
                        }))
                    };
                }
            });
        });

        // 코드 제출 함수
        function submitCode() {
            const code = window.editor.getValue();
            document.getElementById('javaCode').value = code;
            document.getElementById('codeForm').submit();
        }
    </script>
</body>
</html>
