import Koa from "koa";
import Router from "koa-router";
import logger from "koa-logger";
import json from "koa-json";

const app = new Koa();
const router = new Router();

// Config
const PORT = process.env.PORT || 8080;
const MESSAGE = process.env.MESSAGE || "Hello default world!";

// Paths
router.get("/", async (ctx, next) => {
  ctx.body = { msg: MESSAGE };
  await next();
});

// Middleware
app.use(json());
app.use(logger());

// Routing
app.use(router.routes()).use(router.allowedMethods());

// Server
app.listen(PORT, () => {
  console.log(`Server now listening on port ${PORT}`);
});
