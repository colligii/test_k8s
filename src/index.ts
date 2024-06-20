import express from "express";
import type { Request, Response } from "express";

const app = express();
const PORT = process.env.PORT || 3000;
const id = Math.floor(Math.random() * 10000000000);

app.get('/ping', (req: Request, res: Response) => res.send('ping pong id:'+id));

app.listen(PORT, () => console.log(`Server started at port ${PORT}`));