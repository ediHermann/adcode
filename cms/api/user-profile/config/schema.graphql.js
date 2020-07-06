const { parseMultipartData, sanitizeEntity } = require('strapi-utils');

module.exports = {
  query: `userProfile: JSON!`,
  mutation:`updateProfile(data: JSON): JSON!`,
  resolver: {
    Query:{
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
              return result;
              //ctx.send({"success": true, "payload": result});

            } else {

              throw new Error(errDesc);
              //TODO: use  custom error object
              // ctx.send({"success": false, "payload": {}, "error": {"code": errNum, "message": errDesc}});
            }
          }
        }
    },

    Mutation:
    {
        updateProfile:
        {
          description: 'Update crt user profile',
          resolverOf: 'plugins::users-permissions.user.update',
          resolver: async (obj, options, ctx) => {
            //console.log(ctx.request.header);
            let id;
            let result;
            let errNum;
            let errDesc;
            console.log("inside");
            //GET USER FROM HEADER TOKEN
            if (ctx.context.request && ctx.context.request.header && ctx.context.request.header.authorization) {
              try {
                const decrypted = await strapi.plugins['users-permissions'].services.jwt.getToken(ctx.context);
                id = decrypted.id;

                if (id === undefined) {
                  errNum = "201";
                  errDesc = 'Invalid token: Token did not contain required fields';
                } else {
                  //Authentiation OK
                  //console.log(ctx.context);
                  console.log(id);

                  if (ctx.context.is('multipart')) {
                    console.log("multipart");
                    const {data, files} = parseMultipartData(ctx.context);
                    result = await strapi.plugins['users-permissions'].services.user.edit({id}, data, {file});
                    console.log(files);

                  } else {
                    console.log("no multipart");
                    //console.log(ctx.context.request.body.data);
                    result = await strapi.plugins['users-permissions'].services.user.edit({id}, ctx.context.request.body.data);
                   // console.log(result);
                  }


                }

              } catch (e) {
                //console.log(e);
                errNum = "202";
                errDesc = "Unexpected error";

              }
            }
            if (result) {
              console.log(result);
              return result;
            } else {

              // throw new Error(errDesc);
              //ctx.send({"success": false, "payload": {}, "error": {"code": errNum, "message": errDesc}});
            }
          }
        }
    },

  }


};

