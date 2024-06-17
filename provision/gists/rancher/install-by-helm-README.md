+ external得脚本还依赖于外部得配置，比如前面如果摆一个ingress，那么ingress controller还需要增加use-forwarded-headers配置为true
  - https://kubernetes.github.io/ingress-nginx/user-guide/nginx-configuration/configmap/#use-forwarded-headers
  - 如果是阿里云ACK，需要在kube-system中的nginx-configuration中增加这个配置值

