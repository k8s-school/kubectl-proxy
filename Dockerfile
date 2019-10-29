FROM alpine
RUN apk update && apk add wget curl
# Install kubectl
ARG KUBECTL_VERSION=1.15.3
RUN wget -O /usr/local/bin/kubectl \
    https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl && \
    chmod +x /usr/local/bin/kubectl
ADD kubectl-proxy.sh /kubectl-proxy.sh
ENTRYPOINT /kubectl-proxy.sh
