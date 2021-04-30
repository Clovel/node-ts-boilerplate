FROM node:12.18.3-alpine

ENV MASTER_ENDPOINT="http://localhost:3000"

RUN apk --no-cache add \
		bash \
		ca-certificates

ENV NODE_ENV="production"

WORKDIR /psrc
COPY package*.json ./
COPY yarn.lock ./
RUN yarn --frozen-lockfile
COPY . .

RUN yarn tsc


ENTRYPOINT ["yarn", "server:prod"]
