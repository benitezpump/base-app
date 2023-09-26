FROM node:16.13.2-stretch-slim
WORKDIR /app

ARG NODE_ENV
ENV NODE_ENV=${NODE_ENV}

COPY package.json package-lock.json ./
RUN npm install --production
COPY . .

RUN ["npm", "run", "build"]

EXPOSE $PORT
EXPOSE 8000
CMD [ "npm", "start" ]