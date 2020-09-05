---
date: 2020-08-29T06:00:00Z
lastmod: 2020-08-29T06:00:00Z
author: "default"
title: "資安筆記"
subtitle: "單純記錄資安課程筆記，非專業分享，如須參考請自行斟酌"
category: General
---

### 內容：

1. IoT 等硬體設備的資安問題
2. 公司該如何有效管理資安問題
3. 資安的成本考量與取捨
4. 資安認證
5. server 需要注意防範的地方
6. Shift Left 降低成本

### IoT 等設備常見的問題：

出場時有通用的預設密碼，例如 Wifi 設備常常會有預設的管理帳號和密碼，並且同個廠商的設備會有一樣的設定，當網路管理者沒有更改設定，就會讓人有機可趁，是個常見的漏洞。

### 公司該如何有效管理資安問題：

公司人員都該有基本的資安觀念，如果只有少數人有資安觀念，會發生工程師花了一堆力氣做好資安防護，結果其他人直接把密碼寫在網路上，這樣不管資安防護做的在好都沒有用。
此外，公司也應該設立必須負責的資安官，必須要有人負責才會有效的建立好資安防護措施，不然當資安問題發生時，大家會互相推卸責任，平時也不會有人認真盯。

### 資安的成本考量與取捨：

資安防護時需要成本的，越嚴密的防護，成本越高，且資安防護是沒有上限的，不管防護做得多嚴密還是會有漏洞，所以要考慮好資料的重要程度，重要的資料就用成本較高的防護，反之亦然。

### 資安認證：

資安是沒有上限的，所以會有不知道該做到什麼程度的問題。這時就可以考慮相關的資安認證，例如：醫療就可以考慮認證 [HIPAA](https://aws.amazon.com/tw/compliance/hipaa-compliance/)。
事實上許多先進國家，為了保障使用者的資料，也會要求廠商必須有相關的認證才能販售服務。

### Server 實際該防範且注意的地方：

1. server 服務的漏洞，ex: [AWS S3 information leak](https://www.trendmicro.com/vinfo/us/security/news/virtualization-and-cloud/unsecured-aws-s3-bucket-found-leaking-data-of-over-30k-cannabis-dispensary-customers)、SSRF 取得 K8S 權限
2. 使用的 library 是否有漏洞或是惡意代碼。ex: NPM modules (getcookies) 方便使用但其實有埋惡意代碼取得使用者 cookie
3. Data Validation，不完善的 Data Validation 可以讓人有機會做 SQL injection... 等攻擊

### Shift Left:

Shift Left，是減少資安成本的方式，觀念是如果能儘早建立資安相關的措施與架構，就可以減少系統大量修改的可能。

1. 定期檢討程式碼及早發現漏洞
2. 建立自動化流程持續檢測程式碼
3. 越早開始成本越低