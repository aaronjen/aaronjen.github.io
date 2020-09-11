---
date: 2020-09-11T09:00:00Z
lastmod: 2020-09-11T09:00:00Z
title: "在 GCP/GKE 的 Ingress 設定 sticky session"
subtitle: "簡單介紹一下 Google Ingress 設定 sticky session 的方法"
---
## Ingress Sticky Session

### 先備知識

- kubernetes 架構知識
- kubectl 操作
- 稍微了解 kubernetes Deployment, Service, Ingress 如何用 yaml 做設定
- 有連結帳單與信用卡的 GCP 帳號

### Note

這篇討論的是 GCE/GKE 的 Ingress，因為目前只有使用過 Google 的服務，所以不知道其他平台是否有一樣的行為。

### kubernetes 最基本元件

- Pod
- Service
- Deployment
- Ingress

### Ingress 架構

![ingress](https://i.imgur.com/Cg2gJEL.jpg)

簡單的來說 Ingress 就是個 router，Ingress 的作用在於建立一個 routing table 將流量導引到設定好的 Service 或 Pod。

例如假設我們擁有 example.com 的 host 我們就可以：

```
service-a.example.com -> service-a -> service-a pods
service-b.example.com -> service-b -> service-b pods
```

建立這樣的 routing，我們只需要一個 Ingress、一個對外的 ip 就可以達成。當我們有一堆 Services 時也不用開一堆 ip。

除了 domain name 的 routing，path 也可以做 routing：

```
service.example.com/api/a -> A service -> A pods
service.example.com/api/b -> B service -> B pods
```

GKE Ingress 還有許多 features， 詳細的內容可以參考 [Google 官方文件](https://cloud.google.com/kubernetes-engine/docs/how-to/ingress-features?hl=zh-tw)

### sticky session 簡介

sticky session 就是當你連上一台 server 時，後續的 request 都會連到同一台 server。server 方面是透過 session affinity 這個名詞做設定。

sticky session 的用途是讓 server 與 frontend 有辦法建立穩定且持續的連線，如果沒有設定 sticky session，frontend 與 server 進行 websocket 連線時，會因為 server 的 load balancer 不斷切換 server，導致 server 不認識 frontend 的 socket id，進而不斷產生重新連線使溝通無法運作。

### 在 GCE/GKE Ingress 使用 sticky session 的條件

1. Cluster 必須是 [VPC-native cluster](https://cloud.google.com/kubernetes-engine/docs/how-to/alias-ips#benefits)
2. Ingress 與 Service 之間必須建立 [NEG(network endpoint group)](https://cloud.google.com/kubernetes-engine/docs/how-to/standalone-neg)

### 實作範例

要測試 ingress sticky session 我們需要先準備一個簡單的 server 來做測試。這邊我就用 GKE 官方提供的小程式來寫測試，這隻小程式會將你連接到的 Pod 的名稱會傳給你，讓你辨別是否有連接到同一台 Pod。

以下就是範例 Code:

Deployment:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    run: neg-demo-app # Label for the Deployment
  name: neg-demo-app # Name of Deployment
spec:
	replicas: 2
  selector:
    matchLabels:
      run: neg-demo-app
  template: # Pod template
    metadata:
      labels:
        run: neg-demo-app # Labels Pods from this Deployment
    spec: # Pod specification; each Pod created by this Deployment has this specification
      containers:
      - image: k8s.gcr.io/serve_hostname:v1.4 # Application to run in Deployment's Pods
        name: hostname # Container name
        ports:
        - containerPort: 9376
          protocol: TCP
```

Backend Config:

```yaml
apiVersion: cloud.google.com/v1beta1
kind: BackendConfig
metadata:
  name: my-backendconfig
spec:
  sessionAffinity:
    affinityType: "GENERATED_COOKIE" # Options: NONE, CLIENT_IP, GENERATED_COOKIE
    affinityCookieTtlSec: 50
```


Service:

```yaml
apiVersion: v1
kind: Service
metadata:
  name: neg-demo-svc # Name of Service
  annotations:
    beta.cloud.google.com/backend-config: '{"default": "my-backendconfig"}'
    cloud.google.com/neg: '{"ingress": true}' # Creates a NEG after an Ingress is created
spec: # Service's specification
  type: ClusterIP
  selector:
    run: neg-demo-app # Selects Pods labelled run: neg-demo-app
  ports:
  - port: 80 # Service's port
    protocol: TCP
    targetPort: 9376
```

Ingress:

```yaml
apiVersion: networking.k8s.io/v1beta1
kind: Ingress
metadata:
  name: neg-demo-ing
  annotations:
    kubernetes.io/ingress.class: "gce"
spec:
  backend:
    serviceName: neg-demo-svc
    servicePort: 80
```

### 測試

取得 ingress IP

```bash
kubectl get ingress my-ingress --output yaml
```

Output

```yaml
status:
  loadBalancer:
    ingress:
    - ip: 203.0.113.1
```

可以透過 curl 或是開瀏覽器來看是不是有回應，如果沒有回應可能是 k8s 還沒有生效，可以等一段時間上個廁所，等了 10 分鐘以上還沒有生效的話，可能就要檢查一下是否有地方設定錯了。

基本上有看到 GCLB 的 cookie 就代表 sticky session 有作用。也可以重新刷新頁面幾次，看看 Pod 是不是都連到一樣的。

![Chrome Developer Tool](https://i.imgur.com/nZxNx02.png)

Reference:

[Google Ingress Reference](https://cloud.google.com/kubernetes-engine/docs/how-to/ingress-features)

[Google Ingress NEG](https://cloud.google.com/kubernetes-engine/docs/how-to/container-native-load-balancing)