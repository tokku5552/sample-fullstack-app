import type { Express, Request, Response } from 'express';
import express from 'express';

const app: Express = express();
const port = 3000;

app.get('/', (req: Request, res: Response) => {
  console.log(`Request received at ${req}`);
  res.send('Hello World!');
});

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
