---
date: 2020-09-05T00:00:00Z
lastmod: 2020-09-05T00:00:00Z
author: "default"
title: "Microservice - 微服務架構研究筆記"
subtitle: "記錄研究微服務架構時的一些心得與筆記"
category: Backend
---

這篇文章單純記錄網路上找到的內容，沒有實際實作的經驗，所以參考時請自行斟酎。

> ...the microservice architectual style is an approach to developing a single application as a suite of small services, each running in its own process and comunicating with lighweight mechanisms, often an HTTP resource API. - Martin Fowler

什麼是微服務？

- 微服務有小型、獨立、鬆散耦合的特性
- 小型團隊就可以維護且開發
- 可以獨立部署、不用重新建置整個應用程式
- 必須自行處理資料存取，也就是各個服務有自己的 database，而這個 database 只有該服務可以使用
- 微服務之間透過 API、gRPC 或 Event 溝通

---

微服務的概念不難，其實就是把一整個複雜的 application 拆解成細小且各自獨立的服務。這句話說起來簡單但實際上卻是有很多事情要處理。

### 實作上會遇到的問題：

1. 文件該如何管理？沒有好的文件管理，微服務會難以管理也會使得開發寸步難行。
2. 各個服務之間如何溝通？
3. Data Schema 如何定義？
4. 如何更新維護？
5. 自動化

### 自動化

雖然自動化寫在最後一項，但自動化是我覺得整個架構當中最重要的東西。一間大公司的 microservice 可以多達 100 個以上，這個數量的服務是沒有任何人可以透過手動去維護與部署的，所以自動化在整個微服務架構中是必須且最重要的。

### 文件管理

微服務之間最常見的溝通方法是透過 REST api 做溝通，而透過 REST api 溝通的難點在於統整整個架構的 API 文件，所以 API 的文件必須有良好的管理。

至於 API 管理的內容，有一些地方可以注意：

1. 文件格式統一。例如：JSON、YAML 等等

2. 命名規則。例如：API 的 path 是不是都該小寫

3. 路徑命名。例如：

   ```
   GET  /user/:id -> 取得 user 資料
   POST /users    -> 建立新的 user 資料
   
   GET  /company/:id -> 取得 company 資料
   POST /companies   -> 建立新的 company 資料
   ```

4. 自動化的 linter，上述內容如果要透過人工確認的話太花時間與成本，一些簡單的 script 就可以節省很多人力消耗。

### 溝通

溝通是微服務架構的一大課題，良好的溝通才能確保整個應用程式正常運作，這邊就簡介三種溝通方式。

第一種就是上面提到的 REST API，REST API 實在太常見了，這邊就不在多做敘述。

除了 REST API 之外，透過 gRPC 也是很好的選擇，gRPC 有個優點是溝通的雙方必須訂定好 schema(proto)，兩者之間的文件需要一致才能建立通道做溝通，如此可以避免，其中一方已經更新，但另一方卻沒有做相對應的改動。
相關架構可以參考: [Google microservice demo](https://github.com/GoogleCloudPlatform/microservices-demo)

![architecture-diagram](https://i.imgur.com/LgXheii.png)

除了上面 REST、gRPC 以外，建立 Event Bus 是比較新的作法，Event Bus 有個與 REST API 截然不同的觀念，就是 asynchronous request 與 synchronous request 上的差別。 
REST API 被稱做 synchronous request 是因為 REST API 在發出 request 之後，需要立刻得到回應，沒有得到回應(time out)，就被認定是失敗，程式常常需要發出 request 之後，等到回應才能開始下一步工作。
而 Event Bus 被稱為 asynchronous request 的原因是，Event Bus 的重點是建立 Event，只要確保 Event 建立完，任務就達成了，不用立刻知道該 Event 有沒有接收到，或需要馬上得到回應。需要做的是 Subscribe 回應的 Event，等到對方處理好了再來接收對方給的 Event 做相對應的處理。而 Subscriber 也可能是其他的微服務。目前 [Google(pub/sub)](https://cloud.google.com/pubsub?hl=zh-tw) 與 [AWS(kinesis)](https://aws.amazon.com/tw/kinesis/) 都有提供相關的雲端服務可以直接做使用。
Event Bus 架構可以參考 infoQ 的影片:  [Design Microservice Architectures the Right Way](https://www.youtube.com/watch?v=j6ow-UemzBc)

![flow-platform](https://i.imgur.com/MCanowR.png)

### Data Schema 定義

Data Schema 的定義其實跟 API 文件類似，需要有人去定義格式與命名規則，也同樣的可以透過 linter 去確定內容是否符合團隊標準。

### 更新維護

更新維護是最需要自動化的地方。

一個程式的穩定可以透過 Testing 來輔助，自動化的 Testing 機制絕對是必要的。除了 unit test 的程式需要自動化執行，更重要的是自動化建立測試的環境，unit test 是需要環境一致，測試起來才會有一致的結果。

### Reference

- [Microsoft microservice 說明文件](https://docs.microsoft.com/en-us/azure/architecture/guide/architecture-styles/microservices)
- [Google microservice demo](https://github.com/GoogleCloudPlatform/microservices-demo)
- [Michael Bryzek at InfoQ](https://www.youtube.com/watch?v=j6ow-UemzBc)
 