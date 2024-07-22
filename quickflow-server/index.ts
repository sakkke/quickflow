import { Hono } from 'hono'
import { serveStatic } from 'hono/bun'
import { WebSocketServer } from 'ws' // WebSocketサーバーのインポート

const app = new Hono()

app.use('/api/v1/times', serveStatic({ path: './api/v1/times.json' }))
app.use('/api/v1/stations', serveStatic({ path: './api/v1/stations.json' }))
app.use('/api/v1/routes', serveStatic({ path: './api/v1/routes.json' }))
app.get('/', (c) => c.text('Hono!'))

// WebSocketサーバーの設定
const wss = new WebSocketServer({ port: 8080 })

wss.on('connection', (ws) => {
  ws.on('message', (message) => {
    console.log(`Received message => ${message}`)
    ws.send(`You said: ${message}`)
  })

  ws.send('Welcome to the WebSocket server!')

  // 5秒ごとにランダムな情報を送信
  setInterval(() => {
    const randomNumber = Math.floor(Math.random() * 5)
    ws.send(JSON.stringify({ event: 'information', data: randomNumber }))
  }, 5000)
})

export default app
