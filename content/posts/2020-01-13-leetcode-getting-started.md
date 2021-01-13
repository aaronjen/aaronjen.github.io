---
date: 2021-01-12T14:00:00Z
lastmod: 2021-01-12T14:00:00Z
author: "default"
title: "Leetcode 起手式 Leetcode Getting Started"
subtitle: "介紹 Leetcode 該如何開始刷題與 Visual Studio Code 上好用的工具"
---

## Leetcode 介紹

Leetcode 是許多人練習演算法的地方，至於為什麼要練習演算法呢？當然是因為想找到好工作。大公司例如：Facebook、Google，都十分喜歡考演算法的題目。對他們來說你會什麼前端工具、後端框架不是很重要，這些東西進去再學就好，但演算法卻是軟體工作不管做什麼都需要的基礎。

Leetcode 截止 2021/01 有1700+ 道題目，這個數量非常的多。一般人剛開始刷題目，一道題目可能就要寫個一小時，甚至一個下午，要全部刷完 1700 道題目根本不太實際，也很沒有效率，所以就需要挑選一些重要的題目出來刷。

至於可以怎麼挑呢？

https://leetcode.com/list/xoqag3yj/

有人在 Blind 這個網站整理出一組 75 題的題目列表，據說是 Google 或是 Facebook 的工程師整理出來的，涵蓋許多不同的演算法。這組題目可以當作刷題的基礎，只要認真刷完，應該會對刷題比較有感覺，至少比較不會有一看到題目完全沒想法的情況。

接下來，就可以刷 Leetcode 整理出來的 Top Liked 或是 Top Interview 題目，或是找其他人推薦的題目，基本上盡量刷 medium 的題目，因為 easy 常常太過簡單，而 hard 又太過困難，一題可能要刷個一天，實力不足時太沒有效率。

## 好用的工具

最近幾年 microsoft 出的文字編輯器 [visual studio code(VS code)](https://code.visualstudio.com/) 非常熱門，有很大的社群，其中就人寫出好用的 Leetcode extension。

https://marketplace.visualstudio.com/items?itemName=LeetCode.vscode-leetcode

這個工具可以讓你在 VS code 上面寫 Leetcode 的題目，讓你享受 IDE 的 autocomplete 又可以幫你上傳到 Leetcode server 判斷程式是否正確。除此之外，source code 因為存在本地端，所以要怎麼整理、要做 Git 管控等等，都十分的方便。

安裝的方式，就參考 VS code 的官網，基本上跟一般的 extension 一樣透過 extension manager 就可以安裝好。

比較特別的是，因為這個 extension 要幫你上傳 source code 到 Leetcode 的 judge system，來判斷程式的正確，所以必須要登入自己的 Leetcode 帳號。有些人可能會有資安的疑慮，但這個 extension 是 open source 的 extension，使用人數也很多，如果真的有問題的話，應該會有不少人反應問題。

## 用 Go 刷題時的配置

因為自己剛開始學 Go，所以就用 Go 來刷題，順便熟悉 Go 的語法。不得不說，刷題在參考別人寫的 code 時，常常可以發覺一些好用、易懂的寫法，可以藉此來加強語法的熟悉度。

在用 Go 刷題時，最重要的是資料夾結構，因為 Go 是用資料夾來分 package 的，所以在同一層資料夾的檔案，必定屬於相同 package。這時就會出現不同的題目用到相同的 function 名稱導致衝突。雖然不影響上傳結果，但會影響 IDE 的 autocomplete 運作，寫題目寫起來就會比較不順。所以還是每道題目都分開不同的資料夾比較方便管理，也比較美觀。

但要自己將每一道題目都分資料夾，真的也是很麻煩，還好 Leetcode 的 extension 可以做一些設定來自動完成這件事情。

https://github.com/LeetCode-OpenSource/vscode-leetcode/wiki/Customize-the-Relative-Folder-and-the-File-Name-of-the-Problem-File

```json
"leetcode.filePath": {
    "golang": {
        "folder": "",
        "filename": "${id}.${kebab-case-name}/main.${ext}"
    }
},
```

只要將 filename 的名稱組好，在 fetch 新題目時，VS code 就會自動將檔案分資料夾存好，這樣就不會互相影響各自的 function 名稱了。

![folder-structure](https://i.imgur.com/jhyeWu8.png)

Reference:

PTT 心得： https://www.ptt.cc/bbs/Soft_Job/M.1605589986.A.CBA.html?fbclid=IwAR3beSBfigjWcfJmyAttPjGHP6j7w8vLjSLPt0U5xATlaRAMmXentxADdho

Vscode-leetcode： https://github.com/LeetCode-OpenSource/vscode-leetcode