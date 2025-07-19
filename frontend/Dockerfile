FROM node:22 AS build


# Preparando o frontend
WORKDIR /app

COPY . .
RUN npm install

# Definindo a variável de ambiente para o Frontend
# A variável REACT_APP_BACKEND_URL deve ser passada como argumento de construção
ARG REACT_APP_BACKEND_URL
ENV REACT_APP_BACKEND_URL=$REACT_APP_BACKEND_URL
RUN echo $REACT_APP_BACKEND_URL

RUN npm run build || { echo "Build failed, exiting."; exit 1; }

# Servindo com Nginx
FROM nginx:alpine

COPY default.conf /etc/nginx/conf.d/default.conf

COPY --from=build /app/build /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]