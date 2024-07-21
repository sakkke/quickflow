import { Hono } from 'hono'
import { serveStatic } from 'hono/bun'
const app = new Hono()

app.use('/api/v1/stations', serveStatic({ path: './api/v1/stations.json' }))
app.use('/api/v1/routes', serveStatic({ path: './api/v1/routes.json' }))
app.get('/', (c) => c.text('Hono!'))

export default app
