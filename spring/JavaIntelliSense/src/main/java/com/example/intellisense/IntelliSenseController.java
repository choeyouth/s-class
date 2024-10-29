package com.example.intellisense;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.stereotype.Controller;

import java.util.List;

@Controller
public class IntelliSenseController {

    private final JavaKeywordProvider keywordProvider = new JavaKeywordProvider();

    @RequestMapping("/autocomplete")
    @ResponseBody
    public List<String> autocomplete(@RequestParam("prefix") String prefix) {
        return (List<String>) keywordProvider.getJavaKeywords().stream()
                .filter(keyword -> keyword.startsWith(prefix));
    }
}
