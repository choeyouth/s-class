<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Java IntelliSense Editor</title>
    <script src="https://cdn.jsdelivr.net/npm/monaco-editor@0.33.0/min/vs/loader.js"></script>
    <script>
        require.config({ paths: { 'vs': 'https://cdn.jsdelivr.net/npm/monaco-editor@0.33.0/min/vs' } });
        require(['vs/editor/editor.main'], function () {
            const editor = monaco.editor.create(document.getElementById('editor'), {
                value: '',
                language: 'java',
                theme: 'vs-dark',
                automaticLayout: true
            });

            editor.onDidChangeModelContent(async () => {
                const position = editor.getPosition();
                const word = editor.getModel().getWordUntilPosition(position).word;

                if (word.length > 0) {
                    const response = await fetch(`/autocomplete?prefix=${word}`);
                    const suggestions = await response.json();

                    monaco.languages.registerCompletionItemProvider('java', {
                        provideCompletionItems: () => {
                            const completions = suggestions.map(s => ({
                                label: s,
                                kind: monaco.languages.CompletionItemKind.Keyword,
                                insertText: s
                            }));
                            return { suggestions: completions };
                        }
                    });
                }
            });
        });
    </script>
</head>
<body>
    <h1>Java IntelliSense Editor</h1>
    <div id="editor" style="width:100%; height:600px;"></div>
</body>
</html>
