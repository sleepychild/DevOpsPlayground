FROM node:lts-alpine

COPY . /app
WORKDIR /app
RUN npm install

EXPOSE 3000

ENTRYPOINT [ "node" ]
CMD [ "index.js" ]