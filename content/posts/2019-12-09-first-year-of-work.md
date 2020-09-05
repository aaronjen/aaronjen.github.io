---
title: "全端工程師工作的第一年"
slug: first year of work
date: 2019-12-09T17:32:46+08:00
category: Life
tags:
- Frontend
- Backend
- React
- node
- javascript
keywords:
- Job
- React
- node
- javascript
subtitle: 作為全端工程師也過了一年，想記錄一下從學生時期到工作的心路歷程。
---

## 大學時期

我大學念的是土木工程系，是個傳統的工程學系。基本上，土木的出路大概就是考技師去營造廠、顧問公司或是當公務人員，而在我讀書時，已經確定自己未來不會想走這些路，於是在大三、大四必修課比較少的時候，跑去資工系修了不少課，奠定了未來走向全端工程師的基礎。

## 程式基礎

跑到資工系修課，學到最多的或許不是上課內容，而是實作能力與尋找解決問題方法的能力。在資訊工程這個領域裡面，很多知識不是課本上或學校會教的。

科技發展速度太快了，尤其是在最貼近科技的軟體業當中，就像在這幾年當紅的機器學習，想當初還覺得 CNN 可以做 Object Detection 分辨出不同物體好驚奇，到現在已經可以做 AI 換臉換到人都辨識不出來的程度。每年都有新的技術需要學習，才跟的上時代，所以學校課程只能教最基礎的演算法、資料結構等等，只有這些基礎知識才夠廣泛，不管在哪個資訊領域都需要用到。

至於解決問題的實作能力，只能靠自己學習、自己去尋找資源、自己去看開發文件。所以資工系才會有很多實作的課程，培養自學的能力。

我就是在這個時期開始接觸並且自學**前端**開發。

## 前端

最初找到的教學資源是 [w3school]，[w3school] 好用的地方在於，他解釋一個 syntax 的用法後馬上有範例與測試環境可以讓你嘗試，不斷的練習讓你直接將程式寫法直接刻在腦袋裡。

在 [w3school] 看完 html、css、js 的基礎之後，就開始自己嘗試做一點小 project，刻一些簡單的畫面。

在實作過程中，找到了可以加快開發速度的工具 -- [emmet]，用了之後才認知到開發工具的重要，好用的編輯器與插件讓開發起來快了不只 10 倍。

![emmet gif from https://code.visualstudio.com/docs/editor/emmet](https://code.visualstudio.com/assets/docs/editor/emmet/emmet.gif)

隨著對前端開發的熟悉，開始嘗試去接一點 Case 與 Project 來做，也因此有了對 server 的需求。

## 後端

在接觸後端的時間點，剛好是 javascript 正快速成長的時期，也因為的關係對 javascript 較為熟悉，所以自然而然的學了當下最熱門的 [node.js] 與 [MongoDB]、找到了大家推薦的 [node.js] web framework -- [expressjs]。開始做一些簡單的 Project，並學習 Rest API 的開發方法。

會了簡單的 Server rest API 開發後，碰上了 Single Page App(spa) 的熱潮。有了學習前端 Framework 的念頭

## 前端 Framework

著名的 SPA Framework 有 [Angular]、[React] 與後來的 [Vue]。而一開始選擇接觸的 Framework 是 [Angular]，但第一版的 [Angular] 有著效能上的問題，還有不知道為什麼 [React] 在台灣就是比較紅，考慮到之後找工作的需求，所以過沒多久就棄坑轉向 [React]。

其實在出社會找工作前，找了一個寫 [Vue] 與後端的實習，但我在那個實習當中主要是處理後端 API，並不是主要開發 [Vue]，只有稍微幫忙修復一點前端 Bug 與調整樣式，對 [Vue] 的整個操作，並不是說非常熟悉，所以後續就不再贅述 [Vue] 了，避免講了錯誤的內容。

不管是 [Angular]、[React] 或 [Vue]，網路上的學習資源都很多，官方網站的教學文件也很完整，Stackoverflow 等社群平台，也有很高的熱度，基本上遇到問題，都可以很輕易的找到解答，所以三者都是可以嘗試與投資學習的工具。

說到學習 [React]，我的學習方法大概就是不斷的找網路上的資源，例如：[awesome-react](https://github.com/enaqx/awesome-react)、YouTube 影片等等。稍微提一下我覺得幾個做 [React] 開發上比較重要的 Package:

1. [Create-react-app](https://create-react-app.dev/)
2. [redux](https://redux.js.org/), [react-redux](https://react-redux.js.org/introduction/quick-start)
3. [react-router](https://reacttraining.com/react-router/)
4. [styled-components](https://www.styled-components.com/)

這幾個工具在公司裡面的 React Project 都有用到，非常推薦花時間去研究與使用。

除了以上，比較共通性的 Package，也蠻推薦使用一些 component library:

1. [material-ui](https://material-ui.com/)
2. [ant-design](https://ant.design/docs/react/introduce)
3. [formik](https://jaredpalmer.com/formik/docs/overview)

使用了 component library 可以大幅減少自己刻 component 與開發的時間。

之後在工作上，基本上就是使用上述的 Package 與 Library 做開發。而開始工作之後，發現雖然個人實作的能力很重要，但很多功能不是自己一個人可以短時間完成的，需要與同事合作開發，才可以完成目標。這時候 coding style 與 code quality 就顯得格外重要，不僅是要看懂別人的 code，也要想辦法讓自己的 code 可以好讀、好懂。

## Code Quality

首先先介紹幾個關於 coding style 的文件:

1. [clean-code-javascript](https://github.com/ryanmcdermott/clean-code-javascript)
2. [js standard](https://standardjs.com/rules.html)
3. [airbnb stlye guide](https://github.com/airbnb/javascript)

建議可以按照順序看下來，他們的文件分別從短到長，先從簡短的開始吸收比較有動力與成就感。我自已看完之後，是覺得有很多收穫，讓我在寫 code 的時候可以比較有自信，不用一直煩惱到底怎麼寫比較乾淨，怎麼寫別人才看得懂，不僅加快了開發速度，同事間溝通也快速許多。

但總是有疏忽與不小心寫錯 code 或者是發懶覺得「也不過就是少了幾個空白沒什麼關係吧」的時候，你需要的是 [eslint] 幫忙自動修改你的 code 去符合 Project 設定的 coding style。

在工作一年後，深深的體驗到 coding style 這種東西絕對不是可有可無，沒有儘早制定良好的 coding style 制度，就只會不斷累積技術債，讓後來的維運變得困難。

## 結語

這大概就是我從開始學習程式到現在工作一年所經歷的一些心得，希望看到的人可以得到幫助。主要寫這篇的目的還是紀錄一下過去學習到的東西，也算是對在過去這些日子的自己有一個交代。



[w3school]: https://www.w3schools.com/
[emmet]: https://emmet.io/
[node.js]: https://nodejs.org/en/
[MongoDB]: https://www.mongodb.com/
[expressjs]: https://expressjs.com/zh-tw/
[Angular]: https://angular.io/
[React]: https://zh-hant.reactjs.org/
[Vue]: https://vuejs.org/
[eslint]: https://eslint.org/