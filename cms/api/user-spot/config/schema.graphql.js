module.exports = {
  query: `
    userSpots(where: JSON): JSON!
  `,
  resolver: {
    Query: {
      userSpots:
        {
          description: 'Return crt user spots',
          resolverOf: 'application::spot.spot.find',
          resolver: async (obj, options, ctx) => {
            let userid
            let result;
            let errNum;
            let errDesc;
            //GET USER FROM HEADER TOKEN

            console.log (ctx.context.request.header.authorization);
            if (ctx.context.request && ctx.context.request.header && ctx.context.request.header.authorization) {
              try {

                const decrypted = await strapi.plugins['users-permissions'].services.jwt.getToken(ctx.context);
                userid = decrypted.id;

                if (userid === undefined) {
                  errNum = "201";
                  errDesc = 'Invalid token: Token did not contain required fields';
                  } else {
                  /***********************************************************************/
                  //Everything is OK
                  /***********************************************************************/
                  let criteria;
                  console.log(criteria)
                  if(options.where) {
                    criteria=options.where;
                    criteria.user=userid;
                    criteria.deleted=true;
                    result = await strapi.services.spot.find(criteria);
                  }
                  else
                    result = await strapi.services.spot.find({user: userid, deleted: false});
                  //console.log(result);
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
              return await result;
              //ctx.send({"success": true, "payload": result});

            } else {

              throw new Error(errDesc);
              //TODO: use  customer error object
             // ctx.send({"success": false, "payload": {}, "error": {"code": errNum, "message": errDesc}});
            }
          }
        }
      },
    },
  };

