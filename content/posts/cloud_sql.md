---
date: 2020-08-25T07:00:00Z
lastmod: 2020-08-25T07:00:00Z
author: "default"
title: "GCP - Cloud SQL 的連線方式（cloud sql proxy）"
subtitle: "簡介使用 Google cloud_sql_proxy 的連線方式"
---

Database 儲存了應用程式所有的資料，某種程度來說 Database 的安全性比應用程式本身還來的重要，雖然很多人都會把 Database 的連線方式寫在程式碼裡面，這種情況就另當別論。基於上述的理由，市面上的雲端服務提供者，例如：Google Cloud、AWS 等等的就會把 Database 連線設計的比較麻煩。

這邊就來介紹一下，Google Cloud 如何進行 SQL Databas 連線。

### 連線方法

1. 開放 IP 連線 (建議只在 development 或 prototype 使用)
2. 利用 Google 提供的 Cloud SQL Proxy 來進行連線

### 開放所有 IP 連線 (建議只在 development 或 prototype 使用)

[官方文件](https://cloud.google.com/sql/docs/postgres/configure-ip?hl=zh-tw)

這個應該可以不用特別做介紹，把自己公司或是 Server 持有的 IP 位置加入白名單就可以透過伺服器的 IP 位置進行連線。但有 Work From Home 需求的公司或喜歡到處跑在咖啡廳的 Free lancer 可能就有點不是那麼適合，除非原本就有建立 VPN。所以，這邊就介紹一下另一種，也是官方比較推薦的連線方式。

### 利用 Google 提供的 Cloud SQL Proxy 來進行連線

[官方文件](https://cloud.google.com/sql/docs/postgres/connect-admin-proxy?hl=zh-tw)

1. 下載 Cloud SQL Proxy (macOS)，windows 或 linux 請參考官方網站

   ```bash
   curl -o cloud_sql_proxy https://dl.google.com/cloudsql/cloud_sql_proxy.darwin.amd64
   chmod +x cloud_sql_proxy
   ```

2. 使用 gcloud 來進行認證

3. 當 gcloud 認證成功後，Cloud SQL Proxy 就會將你本機電腦(localhost)的 port 綁定連線到 SQL database

   ```bash
   cloud_sql_proxy -instances=<instance_name>=tcp:5432
   # 當看到 Ready for new connections 的字樣出現就成功了
   ```

4. 最後只要透過本機端的 port 就可以連接上遠端的 Database 了

### K8S server 連線

建立 Service Account 並透過 Side Car(額外的 container) 的方式來建立 proxy 連線到 Cloud SQL

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: app_name
  labels:
    name: app_name
spec:
  replicas: 1
  minReadySeconds: 30
  selector:
    matchLabels:
      name: app_name
  strategy:
    rollingUpdate:
      maxSurge: 3
      maxUnavailable: 1
    type: RollingUpdate
  template:
    metadata:
      labels:
        name: app_name
    spec:
      imagePullSecrets:
        - name: regcred
      restartPolicy: Always
      containers:
      - image: <主要程式 image>
        ...
        # 透過另外的 container 來建立 proxy 連線 ⬇︎
      - name: cloud-sql-proxy
        image: gcr.io/cloudsql-docker/gce-proxy:1.17
        command:
          - "/cloud_sql_proxy"
          - "-instances=<instance name>=tcp:5432"
          - "-credential_file=/secrets/service_account.json"
        volumeMounts:
        - name: sa
          mountPath: /secrets/
          readOnly: true
      volumes:
      - name: sa
        secret:
          secretName: internal-server-sa-secret
```
