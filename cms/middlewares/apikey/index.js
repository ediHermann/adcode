module.exports = strapi => {
  return {
    initialize() {
      strapi.app.use(async (ctx, next) => {
        const apiKey = strapi.config['security'].apikey;
        console.log('middleware enter');
        console.log(ctx.request);

        if(ctx.request.method=='POST'&& ctx.header['x-custom-header']!=apiKey && false)
        {
            return ctx.response['notAcceptable']('Please refresh the page and try again. ' +
            'If this doesn\'t solve the issue, please contact the web-admin via email message.')
        }


        await next();

        console.log('middleware exit');

      });
    },
  };
};
