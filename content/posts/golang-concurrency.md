---
date: 2020-08-22T11:00:00Z
lastmod: 2020-08-22T11:00:00Z
author: "default"
title: "Golang - Concurrency 與 Parallelism 的差別"
subtitle: "Concurrency 與 Parallelism 的差別，Golang 又要如何才能 Parallel?"
feature: "https://imgur.com/ZFaGV3m.jpg"
---

## CONCURRENCY, PARALLELISM 與 GOMAXPROCS

Golang 一個最吸引人的特色是天生支援 concurrency 的能力，但 concurrency 很容易跟 parallelism 搞混。就讓我們來搞清楚在程式的世界中，concurrency 和 parallelism 究竟代表什麼意義吧！

### 字面翻譯

Concurrency 並行

Parallelism 並發

從字面上看起來根本一模一樣，但其實兩者有著不同的概念。

### 範例說明

我們以餐廳場景來當範例。

- **最沒有效率的處理方式是：**

接到客人的訂單後，開始準備第一道料理，等到第一道料理完成後，開始準備第二道料理，最後上菜。

- **而有了 Concurreny 的情況是：**

接到客人的訂單，一下做第一道料理，一下做第二道料理，直到兩道料理完成，最後上菜。
咋聽之下，感覺速度沒有比較快，但這樣的好處是，你可能第一道料理是薯條，你把薯條丟下油鍋後其實手上就沒什麼事了，可以有空去做其他事，不用等到薯條炸完才開始煎肉。

- **而到了 Paralellism 的狀況就是：**

接到客人的訂單後，有兩位廚師分別做好各自的料理，最後上菜。
跟上面的 Concurrency 的差別是，有兩個人各自完成各自的工作。

- **但最重要的其實是，Concurrency 與 Parallelism 其實並不衝突，當有了 Concurrency 又有 Parallelism 才是效率最高的，此時情況就會像：**

接到客人的訂單後，有兩位廚師，兩人分別開始做料理，但第一位廚師很快就做完手上的工作，開始幫第二位廚師切菜，之後再去把自己的料理收尾，最後上菜。
應該不難想像，這可能才是實際的工作場景。

而就我的理解，Golang 的情況比較像 Concurrency 加上 Parallelism，只是不知道為什麼很多人都只強調 Concurrency。

### GOMAXPROCS

最後 GOMAXPROCS 是 Golang 會使用到的環境變數，也許就是這個環境變數讓 Golang 官方只強調 Golang 是 Concurrency 而沒有提到 Parallelism。

這個環境變數的功用是，他限制了 Golang 最多可以用到幾個作業系統的 thread，例如：

```bash
GOMAXPROCS=1 go run .
```

這樣 Go 的程式就只能開一個 OS thread 來跑。換句話說，這支 Go 的程式只能用到一個 CPU 的效能。
而這個環境變數在 Go 1.5 版以前預設都是 1，所以沒有特別設定的話 Go 就只有 Concurrency 的功能並沒有 Parallelism。但在 Go 1.5 版以後，Go 會自動檢查系統有幾顆 CPU， 沒有特別設 GOMAXPROCS 的話，他的數值會自動帶入 CPU 的顆數。

### 結論

其實會讓我這麼在意 Concurrecy 與 Parallelism 的原因是：我最開始寫的 server 是 node.js。

Node.js 的架構比 Golang 還要更加的 Concurrency，基本上大部分 node.js Standard Library 裡面的 function 都是以 Concurrency 為前提做設計，但 node.js 有個讓我處理超久的問題，就是 node.js 是單線程的架構，也就是不管你的機器是 2 核心、8 核心還是 128 核心，能用到的 CPU 就是 1 顆。如果要用到多核心就只能額外多開幾個 node.js 程式建立 Cluster。而在伺服器上因為效能出問題時，我的第一個反應就是，把伺服器效能拉大，但換來的就只有帳單的數字加大而已，伺服器還是一直忙不過來。

也就是因為以上的經驗，從此讓我對 Parallelism 相關的問題特別小心，所以我就花了許多時間來確認 Go 確實是可以一個程式吃到多個 CPU 效能的。

### Reference: 

- [https://medium.com/mr-efacani-teatime/concurrency%E8%88%87parallelism%E7%9A%84%E4%B8%8D%E5%90%8C%E4%B9%8B%E8%99%95-1b212a020e30](https://medium.com/mr-efacani-teatime/concurrency與parallelism的不同之處-1b212a020e30)



