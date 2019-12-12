---
title: "Hugo & Gatsby"
date: 2019-12-05T23:41:55+08:00
categories:
- Frontend
- Blog
tags:
- hugo
- gatsby
- react
keywords:
- hugo
- gatsby
- blog
description: 分享一下當初如何選擇 static site generator 做部落格框架，又是如何從 Gatsby 跳槽到 Hugo。
coverImage: /imgs/gatsby-hugo.jpg
---

在研究 static site generator 的過程中，其實找到了三個主流的 Framework：Gatsby、Hugo、Hexo。三者都有做稍微的嘗試，但其中 Hexo 只有把範例 build 起來，並沒有像 Gatsby與 Hugo 去套用主題、去嘗試修改網頁樣式。所以就沒有要將 Hexo 列入討論比較，不過還是值得一提，Hexo 是由一位台灣的大神所寫，如果不想看一堆英文文件，Hexo 的中文文件是最完整的，稍微翻了一下 Hexo 的主題，也都十分簡潔好看，所以有中文需求的朋友可以考慮 Hexo。

回歸正題，Gatsby 與 Hugo 的比較，Gatsby 跟 Hexo 一樣是全部使用 javascript，所以可以預期的是他 build 你的文章的時間絕對不短，再加上 Gatsby 的 renderer 是透過 React 來 render，這讓他的 building time 可以說是突破天際。

## Gatsby 使用心得

最一開始我是用 Gatsby 來建立部落格的，因為我本身工作就是用 React 寫前端，所以很自然的就找到了 Gatsby，因為 React 使用者眾多的關係，讓 Gatsby 一直都有很高的熱度，Github 上的星星數量還超過了**40K**，可以參考與選擇的主題在[官網](https://www.gatsbyjs.org/showcase/)上就超過 700 個。

所以我就花了一段時間挑選了自己喜歡的主題，開始客制自己的網站，也寫了幾篇文章(2019/12以前的文章都是在 Gatsby 時期寫的)，放到 [Github pages](https://pages.github.com/) 上。在上述的過程中，我就體驗到了 Gatsby building 時間的可怕，開發階段 run 起來大概需要 30 秒左右的時間，建立 production build 就需要超過 2 分鐘。

會考慮 Gatsby 或 Hugo 的人，應該跟我都一樣是個工程師，有想要自己客制網站的想法，不然大可以跑去 Medium 甚至 facebook 發發貼文就好。所以，你會在一邊寫 Blog 的時候，一邊看著你的網站，一邊想著如何改進網站 style。

我就會一邊寫著 markdown，改一下 Blog 的 css，甚至改寫一下頁面操作。雖然有 hot reload 的幫忙，讓大部分修改都可以很快的反應到 browser，但就是有些調整 hot reload 會沒有反應，這時候就要重新 build 整個網站。這時候就會不斷的體驗到上述的 building 時間。

儘管等待 building time 讓人覺得有點困擾，但開發時的 30 秒也就喝個一杯水可以打發，還算可以忍受，而 deploy，也就是久久才一次，所以就照樣先在 local 端開發了一陣子，寫了幾篇文章，沒想過要換個 static site generator。

直到最近有些 Project 因為 Github Pages 路徑衝突，需要不斷上傳新的 production build 做測試，才讓我下定覺得，應該要換 Hugo 試試看。

## Hugo 使用心得

剛開始用 Hugo 時，真的被他的 building time 嚇到，不管是跑開發用的 server，還是 production build 都在一秒以內，時間短到讓我以為我下錯指令，還多檢查了幾次 Terminal。

這樣的速度完全體現了 Golang 的運算能力。

讓我換到 Hugo 的原因不只有 build 的時間短而已，從使用 Gastby 以來，我不斷思考著，工作上就一直在使用 React 了，自己的空閒時間還要寫 React 稍微感到有些膩，可以換個工具學個新技術感覺新鮮許多。此外，我也認為部落格，只有少少的幾個版面配置而已，使用 React 會有種大材小用的感覺。

## 結語

說了這麼多，在寫這篇文章的時候，我也才剛從 Gatsby 跳去 Hugo，所以可能還在蜜月期，還沒發現 Hugo 的缺點，所以也不知道會不會哪天又很不爽 Hugo 就跑到其他 static site generator(應該是不會啦，一直跳來跳去也很花時間)。

最後想要說的是，每一個工具都有他的優缺點，我在意的優缺點跟其他人在意的優缺點也不一樣，所以我目前選擇 Hugo，不代表 Hugo 就是最好的選擇，寫這篇文章的目的，第一個是紀錄當初選擇的過程，第二大概就是希望可以提供我的觀點給跟我一樣有選擇障礙的其他人。畢竟，當初我自己也查了很多比較文章，還自己都嘗試過才選出來的，希望其他人可以少走一點彎路。


