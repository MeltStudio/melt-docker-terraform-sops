FROM hashicorp/terraform:0.12.20

LABEL maintainer="luis@meltstudio.co"

RUN set -ex \    
    && apk add --no-cache --virtual .build-deps curl wget unzip \
    && mkdir -p /root/.terraform.d/plugins \
    && wget https://github.com/mozilla/sops/releases/download/v3.5.0/sops-v3.5.0.linux -O /usr/sbin/sops \
    && chmod +x /usr/sbin/sops \
    && wget https://github.com/carlpett/terraform-provider-sops/releases/download/v0.4.1/terraform-provider-sops_v0.4.1_linux_amd64.zip -O /tmp/terraform-provider-sops_v0.4.1_linux_amd64.zip \
    && unzip /tmp/terraform-provider-sops_v0.4.1_linux_amd64.zip -d /root/.terraform.d/plugins/ \
    && apk del .build-deps 
