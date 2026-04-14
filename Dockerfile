FROM node:20-alpine

WORKDIR /app

RUN apk add --no-cache libc6-compat

# fix network + registry
RUN yarn config set registry https://registry.npmjs.org/
RUN yarn config set network-timeout 600000

COPY package.json yarn.lock ./

RUN yarn install --frozen-lockfile

COPY . .

RUN yarn build

EXPOSE 3000

CMD ["yarn", "start"]
