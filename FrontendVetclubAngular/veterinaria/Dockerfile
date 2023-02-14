#docker funcional
FROM node:16

WORKDIR /usr/src/frontend

COPY . .

RUN npm install --legacy-peer-deps

#Define las variables de ambiente
ENV VETCLUB_URL=http://206.189.51.37:30100

EXPOSE 4200

CMD ["npm", "start"]

#Mas pruebas de docker

#STAGE 1: Build app
#FROM node:16-alpine as build

#RUN mkdir -p /usr/local/app

#WORKDIR /usr/local/app

#COPY package.json /usr/local/app
# Add the source code to app
#COPY . /usr/local/app
# Install all the dependencies
#RUN npm install --legacy-peer-deps

#RUN npm run build --prod --legacy-peer-deps

#STAGE 2: Serve app with nginx
#FROM nginx:1.21.4-alpine
#Define las variables de ambiente
ENV VETCLUB_URL=http://206.189.51.37:30100

#COPY  --from=build /usr/local/app/dist/FrontendVetclubAngular /usr/share/nginx/html

# Expose port 80
#EXPOSE 80

# When the container starts, replace the env.js with values from environment variables
CMD ["/bin/sh",  "-c",  "envsubst < /usr/share/nginx/html/assets/env.sample.js > /usr/share/nginx/html/assets/env.js && exec nginx -g 'daemon off;'"]
#CMD ["nginx", "-g", "daemon off;"]