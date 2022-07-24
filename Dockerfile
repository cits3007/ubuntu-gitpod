FROM gitpod/workspace-full:2022-05-05-08-58-22@sha256:c8508f5c257f67a837701bd0f6ecbc32b0ad2f6c54a97ecf551b5cb60f3a616c

USER root

COPY provision.sh .

ARG TZ="Australia/Perth"

RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive \
     TZ="${TZ}" \
       apt-get install -y --no-install-recommends \
         apt-utils \
         curl \
         locales \
         tzdata \
         wget \
  && \
      echo "${TZ}" > /etc/timezone \
  && \
      ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime \
  && \
    DEBIAN_FRONTEND="noninteractive"  \
    TZ="${TZ}" \
      dpkg-reconfigure --frontend=noninteractive tzdata \
  && \
    DEBIAN_FRONTEND="noninteractive"  \
      yes | unminimize \
  && DEBIAN_FRONTEND="noninteractive"  \
     TZ="${TZ}" \
        ./provision.sh \
  && apt-get clean \
  && rm -rf /var/cache/apt/* \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /tmp/* \
  && rm -rf /var/tmp/* \
  && rm provision.sh

# Install Tini
# RUN wget --quiet https://github.com/krallin/tini/releases/download/v0.10.0/tini && \
#     echo "1361527f39190a7338a0b434bd8c88ff7233ce7b9a4876f3315c22fce7eca1b0 *tini" | sha256sum -c - && \
#     mv tini /usr/local/bin/tini && \
#     chmod +x /usr/local/bin/tini

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen

USER gitpod

ENV LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8



