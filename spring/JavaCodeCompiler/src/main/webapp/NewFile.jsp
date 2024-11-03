<%@ page contentType="text/html; charset=UTF-8" %>

<%
    // 새로운 템플릿 정의
    String templateSysout = "System.out.println(\\${1});\\${0}";
    String templateTryCatch = "try {\n    \\${1}\n} catch (\\${2:Exception} \\${3:e}) {\n    \\${4}\n}\\${0}";
    String templateTryFinally = "try {\n    \\${1}\n} finally {\n    \\${2}\n}\\${0}";
    String templateMain = "public static void main(String[] args) {\n    \\${0}\n}";
    String templateIf = "if (\\${1:condition}) {\n    \\${2}\n}\\${0}";
    String templateElse = "else {\n    \\${1}\n}\\${0}";
    String templateCatch = "catch (\\${1:Exception} \\${2:e}) {\n    \\${3}\n}\\${0}";
    String templateFinally = "finally {\n    \\${1}\n}\\${0}";
    String templateSwitch = "switch (\\${1:key}) {\n    case \\${2:value}:\n        \\${0}\n        break;\n    default:\n        break;\n}";
    String templateWhile = "while (\\${1:condition}) {\n    \\${2}\n}\\${0}";
    String templateDoWhile = "do {\n    \\${0}\n} while (\\${1:condition});";
    String templateFor = "for (int \\${1:index} = 0; \\${1:index} < \\${2:array}.length; \\${1:index}++) {\n    \\${0}\n}";
    String templateForeach = "for (\\${1:Type} \\${2:item} : \\${3:collection}) {\n    \\${0}\n}";
    String templateSyserr = "System.err.println(\\${1});\\${0}";
    String templateIfElse = "if (\\${1:condition}) {\n    \\${2}\n} else {\n    \\${2}\n}\\${0}";
    String templateIfElseIf = "if (\\${1:condition}) {\n    \\${2}\n} else if (\\${3:condition}) {\n    \\${4}\n} else {\n    \\${5}\n}\\${0}";
%>

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
    <h1>Java Code Editor with IntelliSense</h1>
    <div id="editor"></div>

    <script>
        require.config({ paths: { 'vs': 'https://cdnjs.cloudflare.com/ajax/libs/monaco-editor/0.34.1/min/vs' } });
        require(['vs/editor/editor.main'], function () {
            // JSP에서 각 템플릿을 JavaScript 변수로 전달
            const templateSysout = `<%= templateSysout.replace("\n", "\\n").replace("\"", "\\\"") %>`;
            const templateTryCatch = `<%= templateTryCatch.replace("\n", "\\n").replace("\"", "\\\"") %>`;
            const templateTryFinally = `<%= templateTryFinally.replace("\n", "\\n").replace("\"", "\\\"") %>`;
            const templateMain = `<%= templateMain.replace("\n", "\\n").replace("\"", "\\\"") %>`;
            const templateIf = `<%= templateIf.replace("\n", "\\n").replace("\"", "\\\"") %>`;
            const templateElse = `<%= templateElse.replace("\n", "\\n").replace("\"", "\\\"") %>`;
            const templateCatch = `<%= templateCatch.replace("\n", "\\n").replace("\"", "\\\"") %>`;
            const templateFinally = `<%= templateFinally.replace("\n", "\\n").replace("\"", "\\\"") %>`;
            const templateSwitch = `<%= templateSwitch.replace("\n", "\\n").replace("\"", "\\\"") %>`;
            const templateWhile = `<%= templateWhile.replace("\n", "\\n").replace("\"", "\\\"") %>`;
            const templateDoWhile = `<%= templateDoWhile.replace("\n", "\\n").replace("\"", "\\\"") %>`;
            const templateFor = `<%= templateFor.replace("\n", "\\n").replace("\"", "\\\"") %>`;
            const templateForeach = `<%= templateForeach.replace("\n", "\\n").replace("\"", "\\\"") %>`;
            const templateSyserr = `<%= templateSyserr.replace("\n", "\\n").replace("\"", "\\\"") %>`;
            const templateIfElse = `<%= templateIfElse.replace("\n", "\\n").replace("\"", "\\\"") %>`;
            const templateIfElseIf = `<%= templateIfElseIf.replace("\n", "\\n").replace("\"", "\\\"") %>`;

            // Monaco Editor 초기화
            monaco.editor.create(document.getElementById('editor'), {
                value: '',  // 빈 상태에서 시작
                language: 'java',
                theme: 'vs-dark'
            });

            // 자동완성 기능에 여러 템플릿 추가
            monaco.languages.registerCompletionItemProvider('java', {
                provideCompletionItems: function () {
                    const suggestions = [
                        { label: 'sysout', kind: monaco.languages.CompletionItemKind.Snippet, insertText: templateSysout, insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet, documentation: "System.out.println template" },
                        { label: 'trycatch', kind: monaco.languages.CompletionItemKind.Snippet, insertText: templateTryCatch, insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet, documentation: "Try-catch block template" },
                        { label: 'tryfinally', kind: monaco.languages.CompletionItemKind.Snippet, insertText: templateTryFinally, insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet, documentation: "Try-finally block template" },
                        { label: 'main', kind: monaco.languages.CompletionItemKind.Snippet, insertText: templateMain, insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet, documentation: "Main method template" },
                        { label: 'if', kind: monaco.languages.CompletionItemKind.Snippet, insertText: templateIf, insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet, documentation: "If statement template" },
                        { label: 'else', kind: monaco.languages.CompletionItemKind.Snippet, insertText: templateElse, insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet, documentation: "Else statement template" },
                        { label: 'catch', kind: monaco.languages.CompletionItemKind.Snippet, insertText: templateCatch, insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet, documentation: "Catch block template" },
                        { label: 'finally', kind: monaco.languages.CompletionItemKind.Snippet, insertText: templateFinally, insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet, documentation: "Finally block template" },
                        { label: 'switch', kind: monaco.languages.CompletionItemKind.Snippet, insertText: templateSwitch, insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet, documentation: "Switch statement template" },
                        { label: 'while', kind: monaco.languages.CompletionItemKind.Snippet, insertText: templateWhile, insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet, documentation: "While loop template" },
                        { label: 'dowhile', kind: monaco.languages.CompletionItemKind.Snippet, insertText: templateDoWhile, insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet, documentation: "Do-while loop template" },
                        { label: 'for', kind: monaco.languages.CompletionItemKind.Snippet, insertText: templateFor, insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet, documentation: "For loop template" },
                        { label: 'foreach', kind: monaco.languages.CompletionItemKind.Snippet, insertText: templateForeach, insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet, documentation: "Foreach loop template" },
                        { label: 'syserr', kind: monaco.languages.CompletionItemKind.Snippet, insertText: templateSyserr, insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet, documentation: "System.err.println template" },
                        { label: 'ifelse', kind: monaco.languages.CompletionItemKind.Snippet, insertText: templateIfElse, insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet, documentation: "If-else statement template" },
                        { label: 'ifelseif', kind: monaco.languages.CompletionItemKind.Snippet, insertText: templateIfElseIf, insertTextRules: monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet, documentation: "If-else-if statement template" }
                    ];
                    return { suggestions: suggestions };
                }
            });
        });
    </script>
</body>
</html>
