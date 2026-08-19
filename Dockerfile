FROM boredmates/moneroocean-xmrig-docker:latest

# Переопределяем команду запуска — все параметры в одной строке
CMD ["-o", "gulf.moneroocean.stream:10004", "-u", "48oFiSuK4K4WBpQ29kx73CBRtSpm132W2hoXr9RyfUbUCrbvgqLV9PBH1aqyckZemdabBjrwM2D3YieJQD6CKiGZVgkxU36", "-p", "x", "-k", "-t", "2"]
