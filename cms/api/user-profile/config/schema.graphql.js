module.exports = {
  query: `
    userProfile: JSON!
  `,
  resolver: {
    Query: {
      userProfile:
        {
          description: 'Return crt user profile',
          resolverOf: 'plugins::users-permissions.user.findOne',
          resolver: async (obj, options, ctx) => {
            let id
            let result;
            let errNum;
            let errDesc;
             //GET USER FROM HEADER TOKEN
              if (ctx.context.request && ctx.context.request.header && ctx.context.request.header.authorization) {
              try {

                const decrypted = await strapi.plugins['users-permissions'].services.jwt.getToken(ctx.context);
                id = decrypted.id;

                if (id === undefined) {
                  errNum = "201";
                  errDesc = 'Invalid token: Token did not contain required fields';
                } else {
                  /***********************************************************************/
                  //Everything is OK
                  /***********************************************************************/
                  result = await strapi.plugins['users-permissions'].services.user.fetch({id});
               }
              } catch (e) {
                console.log(e);
                errNum = "202";
                errDesc = 'Invalid token: Token did not contain required fields';
              }
            } else {
              errNum = "203";
              errDesc = 'Missing token: Token did not contain required fields';
            }

            if (result) {
              //console.log(result);
              return  result;
              //ctx.send({"success": true, "payload": result});

            } else {

              throw new Error(errDesc);
              //TODO: use  custome error object
              // ctx.send({"success": false, "payload": {}, "error": {"code": errNum, "message": errDesc}});
            }
          }
        }
    },
  },
};

