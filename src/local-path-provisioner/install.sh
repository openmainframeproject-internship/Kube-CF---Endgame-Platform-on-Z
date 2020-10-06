LOCAL_PATH_STORAGE_YAML="./deploy/local-path-storage.yaml"

kubectl apply --filename "${LOCAL_PATH_STORAGE_YAML}"
kubectl patch storageclass standard \
  --patch '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"false", "storageclass.beta.kubernetes.io/is-default-class":"false"}}}'
kubectl patch storageclass local-path \
  --patch '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true", "storageclass.beta.kubernetes.io/is-default-class":"true"}}}'


