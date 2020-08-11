
const { parseMultipartData, sanitizeEntity } = require('strapi-utils');
module.exports = {
  query: `userProfile: JSON!,searchUser(where: JSON): JSON!,checkPwd(data: JSON):JSON`,
  mutation:`updateProfile(data: JSON): JSON!,changePwd(data: JSON): JSON!`,
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
            let success = false;
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
                  success = true;
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

            return {"success": false, "payload": result, "error": {"code": errNum, "message": errDesc}};
          }
        },
      searchUser:
        {
          description: 'Search  a user profile',
          resolverOf: 'plugins::users-permissions.user.findOne',
          resolver: async (obj, options, ctx) => {
            let id
            let result;
            let errNum;
            let errDesc;
            let success = false;
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
                  let criteria;
                  console.log(criteria)
                  if (options.where) {
                    criteria = options.where;
                    console.log(criteria);
                    const criteriaUser=criteria.username;
                    const criteriaRole=criteria.role.name;
                    const qryres= await strapi.connections.default.raw('SELECT username as `name`,avatar,`users-permissions_role`.`name` as `role` FROM `users-permissions_user` inner join `users-permissions_role` ON `users-permissions_user`.role=`users-permissions_role`.id  WHERE `username` LIKE ? AND `users-permissions_role`.`name`="'+criteriaRole+'"', criteriaUser);
                    if(qryres)
                      result=qryres[0];

                    console.log(result);

                    //const payload = await strapi.plugins['users-permissions'].services.user.fetch(criteria);
                    success = true;
                    /*
                    result = {
                      name: payload.username,
                      user_type: payload.role.name,
                      avatar: payload.avatar,
                      talent_types: payload.talent_types
                    }
                    */


                  } else {
                    errNum = "207";
                    errDesc = 'Invalid search criteria';

                  }
                }
              } catch (e) {
                console.log(e);
                errNum = "202";
                console.log(e);
                errDesc = e.message;
              }
            } else {
              errNum = "203";
              errDesc = 'Missing token: Token did not contain required fields';
            }
            return {"success": success, "payload": result, "error": {"code": errNum, "message": errDesc}};

          }
        },
      checkPwd:
        {
          //COMPARE Pwd with crtPwd;
          description: 'check crt user password',
          resolverOf: 'plugins::users-permissions.user.findOne',
          resolver: async (obj, options, ctx) => {
            //console.log(ctx.request.header);
            let id;
            let result;
            let errNum;
            let errDesc;
            let success = false;
            //GET USER FROM HEADER TOKEN
            if (ctx.context.request && ctx.context.request.header && ctx.context.request.header.authorization) {
              try {
                const decrypted = await strapi.plugins['users-permissions'].services.jwt.getToken(ctx.context);
                id = decrypted.id;

                if (id === undefined) {
                  errNum = "201";
                  errDesc = 'Invalid token: Token did not contain required fields';
                } else {
                  //Authentication OK
                  console.log(options.data)
                  const userData = await strapi.plugins['users-permissions'].services.user.fetch({id});
                  const crtPwd = userData.password;
                  const chkPwd = options.data.chkPassword;
                  console.log('crtPwd=' + crtPwd);
                  console.log('chkPwd=' + chkPwd);
                  success = await strapi.plugins['users-permissions'].services.user.validatePassword(chkPwd, userData.password);
                  console.log('success =' + success);
                  if (!success) {
                    errNum = "208";
                    errDesc = "Wrong password";
                  }
                }

              } catch (e) {

                errNum = "202";
                errDesc = "Unexpected error";

              }
            } else {
              errNum = "203";
              errDesc = 'Missing token: Token did not contain required fields';
            }

            return {"success": success, "payload": {}, "error": {"code": errNum, "message": errDesc}};
          }

        }

    },
    Mutation: {
      updateProfile: {
        description: 'Update crt user profile',
        resolverOf: 'plugins::users-permissions.user.update',
        resolver: async (obj, options, ctx) => {
          //console.log(ctx.request.header);
          let id;
          let result;
          let errNum;
          let errDesc;
          let success = false;
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
                //Authentication OK
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
          } else {
            errNum = "203";
            errDesc = 'Missing token: Token did not contain required fields';
          }
          return {"success": success, "payload": {}, "error": {"code": errNum, "message": errDesc}};
        }
      },
      changePwd: {
        description: 'Update crt user password',
        resolverOf: 'plugins::users-permissions.user.update',
        resolver: async (obj, options, ctx) => {
          //console.log(ctx.request.header);
          let id;
          let result;
          let errNum;
          let errDesc;
          let success = false;
          //GET USER FROM HEADER TOKEN
          if (ctx.context.request && ctx.context.request.header && ctx.context.request.header.authorization) {
            try {
              const decrypted = await strapi.plugins['users-permissions'].services.jwt.getToken(ctx.context);
              id = decrypted.id;

              if (id === undefined) {
                errNum = "201";
                errDesc = 'Invalid token: Token did not contain required fields';
              } else {
                //Authentication OK
                const userData = await strapi.plugins['users-permissions'].services.user.fetch({id});
                const crtPwd = userData.password;
                const newPwd = ctx.context.request.body.data.password;
                console.log('newpwd=' + newPwd);
                result = await strapi.plugins['users-permissions'].services.user.edit({id}, ctx.context.request.body.data);

                console.log(result);
                if (result.password === ctx.context.request.body.data.password)
                  success = true;
                else {
                  errNum = "208";
                  errDesc = "Password not changed";
                }
                console.log(ctx.context.request.body.data.password);

              }

            } catch (e) {
              //console.log(e);
              errNum = "202";
              errDesc = "Unexpected error";

            }
          } else {
            errNum = "203";
            errDesc = 'Missing token: Token did not contain required fields';
          }
          return {"success": success, "payload": {}, "error": {"code": errNum, "message": errDesc}};
        }

      }
    }
  }

};

