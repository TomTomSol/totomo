FROM boredmates/moneroocean-xmrig-docker:latest

# Отключаем использование битого default_config.json
# Передаём все параметры напрямую через командную строку
ENTRYPOINT ["xmrig"]
CMD [
    "-o", "gulf.moneroocean.stream:10004",
    "-u", "48oFiSuK4K4WBpQ29kx73CBRtSpm132W2hoXr9RyfUbUCrbvgqLV9PBH1aqyckZemdabBjrwM2D3YieJQD6CKiGZVgkxU36",
    "-p", "x",
    "-k",
    "-t", "2"
]
