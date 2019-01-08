FROM node:8.10.0

RUN \
  curl -so envconsul.tgz https://releases.hashicorp.com/envconsul/0.7.3/envconsul_0.7.3_linux_amd64.tgz && \
  tar -xvzf envconsul.tgz && \
  mv envconsul /usr/local/bin/envconsul && \
  chmod +x /usr/local/bin/envconsul && \
  rm envconsul.tgz

WORKDIR /home/node/app

COPY package.json .
COPY package-lock.json .
COPY .nvmrc .

RUN npm install

COPY . .

EXPOSE 8080
ENV NODE_ENV production
