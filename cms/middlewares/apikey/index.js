module.exports = strapi => {
  return {
    initialize() {
      strapi.app.use(async (ctx, next) => {
        const apiKey = strapi.config['security'].apikey;

        const start = Date.now();
        console.log('middleware enter');


        if(ctx.request.method=='POST'&& ctx.header['x-custom-header']!=apiKey)
        {
            return ctx.response['notAcceptable']('Please refresh the page and try again. ' +
            'If this doesn\'t solve the issue, please contact the web-admin via email message.')
        }


        await next();

        const delta = Math.ceil(Date.now() - start);
        console.log('middleware exit: '+ delta+ 'ms');
        ctx.set('X-Response-Time', delta + 'ms');
      });
    },
  };
};
