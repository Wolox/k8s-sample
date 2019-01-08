const { getSummary, getContentType } = require('@promster/express');

exports.init = app => {
  // app.get('/endpoint/get/path', [], controller.methodGET);
  // app.put('/endpoint/put/path', [], controller.methodPUT);
  // app.post('/endpoint/post/path', [], controller.methodPOST);
  app.use('/metrics', (req, res) => {
    req.statusCode = 200;

    res.setHeader('Content-Type', getContentType());
    res.end(getSummary());
  });
  app.get('/health', [], (req, res, next) => res.status(200).end());
  app.get('/203', [], (req, res, next) => res.status(203).end());
  app.get('/internalError', [], (req, res, next) => res.status(500).end());
  app.get('/notFound', [], (req, res, next) => res.status(404).end());
};
