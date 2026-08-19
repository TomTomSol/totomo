# Берём бинарник xmrig из готового образа
FROM boredmates/moneroocean-xmrig-docker:latest AS xmrig

# Легковесный образ с Node.js
FROM node:20-alpine

# Копируем бинарник xmrig и библиотеки
COPY --from=xmrig /bin/xmrig /usr/local/bin/xmrig
COPY --from=xmrig /bin/default_config.json /bin/default_config.json

# Устанавливаем зависимости для xmrig (hwloc, libuv)
RUN apk add --no-cache libuv-dev hwloc-dev

WORKDIR /app

# Создаём минимальный HTTP-сервер
COPY server.js .

# Запускаем сервер (он сам запустит майнер)
CMD ["node", "server.js"]
