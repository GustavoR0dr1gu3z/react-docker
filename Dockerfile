FROM node:alpine
WORKDIR "/aplicacion"
COPY . ./package*.json ./
RUN yarn 
COPY . ./
RUN yarn build

FROM nginx
EXPOSE 80
COPY --from=0 /aplicacion/build /usr/share/nginx/html
#CMD ["yarn","start"]

