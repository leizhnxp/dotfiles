+ external得脚本还依赖于外部得配置，比如前面如果摆一个ingress，那么ingress controller还需要增加use-forwarded-headers配置为true
  - https://kubernetes.github.io/ingress-nginx/user-guide/nginx-configuration/configmap/#use-forwarded-headers
  - 如果是阿里云ACK，需要在kube-system中的nginx-configuration中增加这个配置值

+ 删除
  - 使用官方清理工具https://github.com/rancher/rancher-cleanup
  - cleanup工具本身也有一些痕迹
  ```
  k delete serviceaccounts -n kube-system cleanup-service-account
  k delete clusterrolebindings.rbac.authorization.k8s.io -n kube-system cleanup-admin
  kubectl delete -n kube-system job cleanup-job
  ```
