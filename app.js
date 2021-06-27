import express from 'express'
import rootRouter from './routes/root.routes'
import userRouter from './routes/user.routes'

const app = express()
const port = 3000

app.use(express.json())
app.use('/', rootRouter)
app.use('/', userRouter)

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})