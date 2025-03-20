FROM node:18-alpine

WORKDIR /app

RUN apk update && apk add --no-cache openssl

COPY package*.json ./
COPY prisma ./prisma/

RUN npm install
RUN npx prisma generate


COPY . .

RUN npm run build

EXPOSE 3000

CMD ["npm", "start"]