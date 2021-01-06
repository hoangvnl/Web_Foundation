const express = require("express");
require("express-async-errors");

const app = express();
app.use(
  express.urlencoded({
    extended: true,
  })
);

app.use("/public", express.static("public"));

require('./middlewares/view.mdw')(app);
require('./middlewares/session.mdw')(app);
require('./middlewares/locals.mdw')(app);
require('./middlewares/routes.mdw')(app);
require('./middlewares/error.mdw')(app);
require('./middlewares/admin.mdw')(app);

const port = 3000;
app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`);
});
