module.exports = {

  findOne: async ctx => {
    console.log(ctx.request.header);
    let id;
    let result;
        let errNum;
        let errDesc;

        //GET USER FROM HEADER TOKEN
        if (ctx.request && ctx.request.header && ctx.request.header.authorization)
        {
          try
          {
            const decrypted = await strapi.plugins['users-permissions'].services.jwt.getToken(ctx);
            id = decrypted.id;

            if (id === undefined) {
              errNum="201";
              errDesc='Invalid token: Token did not contain required fields';
            }
            else
            {

              /**********************************************
               add: [AsyncFunction: add],
               edit: [AsyncFunction: edit],
               fetch: [Function: fetch],
               fetchAll: [Function: fetchAll],
               hashPassword: [Function: hashPassword],
               isHashed: [Function: isHashed],
               remove: [AsyncFunction: remove],
               removeAll: [AsyncFunction: removeAll],
               validatePassword: [Function: validatePassword],
               ******************************************************/

                result = await strapi.plugins['users-permissions'].services.user.fetch({id});
                //ctx.send({"success": false,  "payload": {}, "error": {"code": error.errno, "message": "An error occurred! "+error.code}});

            }
      }
      catch (e)
      {
        errNum="202";
        errDesc='Invalid token: Token did not contain required fields';
      }
    }
    else
    {
      errNum="203";
      errDesc='Missing token: Token did not contain required fields';
    }
    //console.log(strapi.plugins['users-permissions'].services.user);



    if(result)
    {
      console.log(result);
      ctx.send({"success": true,  "payload": result});

    }
    else
    {
      ctx.send({"success": false,  "payload": {}, "error": {"code": errNum, "message": errDesc}});
    }
  },

  update: async ctx => {
    console.log(ctx.request.header);
    let id;
    let result;
    let errNum;
    let errDesc;

    //GET USER FROM HEADER TOKEN
    if (ctx.request && ctx.request.header && ctx.request.header.authorization) {
      try {
        const decrypted = await strapi.plugins['users-permissions'].services.jwt.getToken(ctx);
        id = decrypted.id;

        if (id === undefined) {
          errNum = "201";
          errDesc = 'Invalid token: Token did not contain required fields';
        }
        else {
          //Authentiation OK

          if (ctx.is('multipart')){
            const {data, files} = parseMultipartData(ctx);
            result = await strapi.plugins['users-permissions'].services.user.edit({id},data, {files});
          }
          else {
            result = await strapi.plugins['users-permissions'].services.user.edit({id}, ctx.request.body);
          }

        }

      } catch (e) {
        errNum = "202";
        errDesc = 'Invalid token: Token did not contain required fields';
      }
    }

    if(result) {
      console.log(result);
      ctx.send({"success": true});
    }
    else
      {
        ctx.send({"success": false,  "payload": {}, "error": {"code": errNum, "message": errDesc}});
      }
  }
};
