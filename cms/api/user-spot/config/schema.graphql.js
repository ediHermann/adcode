const { parseMultipartData, sanitizeEntity } = require('strapi-utils');

module.exports = {
  query: `userSpots(where: JSON, limit: Int, offset: Int, sort:String): JSON!`,
  mutation:`createUserSpot(data: JSON): JSON!,updateUserSpot(uid:String, data: JSON): JSON!,deleteUserSpot(uid:String): JSON! `,
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

            console.log(ctx.context.request.header.authorization);
            if (ctx.context.request && ctx.context.request.header && ctx.context.request.header.authorization) {
              try {

                const decrypted = await strapi.plugins['users-permissions'].services.jwt.getToken(ctx.context);
                userid = decrypted.id;

                if (userid === undefined) {
                  errNum = "201";
                  errDesc = '201 Invalid token: Token did not contain required fields';
                } else {
                  /***********************************************************************/
                  //Everything is OK
                  /***********************************************************************/
                  let criteria={};

                  if (options.where) {
                    criteria = options.where;
                  }
                  if(options.limit && options.offset)
                  {
                    criteria._limit = options.limit;
                    criteria._start = options.offset;
                  }
                  if(options.sort)
                  {
                    criteria._sort = options.sort;
                  }


                  criteria.user = userid;
                  criteria.deleted = false;
                  console.log(criteria)
                   result = await strapi.services.spot.find(criteria);
                  }
                  //console.log(result);
                }
                catch (e) {
                console.log(e);
                errNum = "202";
                errDesc = '202 Invalid token: Token did not contain required fields';
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

    Mutation: {
        createUserSpot: {
            description: 'Create new  spots',
            resolverOf: 'application::spot.spot.find',
            resolver: async (obj, options, ctx) => {
              let newRecord;
              let userid;
              let result;
              let payload;
              let errNum;
              let errDesc;

              //GET USER FROM HEADER TOKEN
              if (ctx.context.request && ctx.context.request.header && ctx.context.request.header.authorization) {
                try {
                  const decrypted = await strapi.plugins['users-permissions'].services.jwt.getToken(ctx.context);
                  userid = decrypted.id;
                } catch (e) {
                  errNum = "201";
                  errDesc = 'Invalid token: Token did not contain required fields';

                }
              }
              if (userid === undefined) {
                errNum = "201";
                errDesc = 'Invalid token: Token did not contain required fields';
              } else {
                //Authentiation OK
                try {

                  //insert spot
                  newRecord = await strapi.services.spot.create(ctx.context.request.body); //Or options.data
                  console.log(newRecord.id);
                  const id = newRecord.id;

                  //update the owner
                  const updateData = {"user": userid};
                  payload = await strapi.services.spot.update({id}, updateData);

                  result = {
                    "success": true,
                    "payload": payload
                  };

                } catch (error) {
                  console.log(error);
                  result = {
                    "success": false,
                    "payload": {},
                    "error": {"code": error.errno, "message": "An error occurred! " + error.code}
                  };


                }
              }
              if (newRecord) {
                //console.log(result);
                return result;

              } else {

                result = {
                  "success": false,
                  "payload": {},
                  "error": {"code": error.errno, "message": "An error occurred! " + error.code}
                };
                return result;
              }

            }
      },

      updateUserSpot: {
          description: 'Update user  spot',
          resolverOf: 'application::spot.spot.find',
          resolver: async (obj, options, ctx) => {
            const uid = options.uid;
            let newRecord;
            let userid;
            let result;
            let payload;
            let errNum;
            let errDesc;
            let Success = false;
           //GET USER FROM HEADER TOKEN
            if (ctx.context.request && ctx.context.request.header && ctx.context.request.header.authorization) {
              try {


                  const decrypted = await strapi.plugins['users-permissions'].services.jwt.getToken(ctx.context);
                  userid = decrypted.id;
              } catch (e) {
                console.log(e)
                errNum = "201";
                errDesc = 'Invalid token: Token did not contain required fields';

              }
            }
            if (userid === undefined) {
              errNum = "201";
              errDesc = 'User undefined';
            } else {
              //Authentiation OK
              try {


                //CHECK if the item  belongs to crt user
                const chkResult = await strapi.services.spot.find({uid: uid, user: userid, deleted: false});
                 if (chkResult.length > 0) {
                  const id = chkResult[0].id;
                  payload = await strapi.services.spot.update({id}, options.data);
                  Success = true;
                  result = {
                    "success": Success,
                    "payload": payload
                  };

                } else {
                  errNum = "301";
                  errDesc = 'Invalid spot id';
                }



              } catch (error) {
                console.log(error);
                result = {
                  "success": false,
                  "payload": {},
                  "error": {"code": error.errno, "message": "An error occurred! " + error.code}
                };


              }
            }
            if (Success) {
              //console.log(result);
              return result;

            } else {

              result = {
                "success": false,
                "payload": {},
                "error": {"code": errNum, "message": errDesc}
              };
              return result;
            }
          }
       },

      deleteUserSpot: {
          description: 'Delete user spot',
          resolverOf: 'application::spot.spot.find',
          resolver: async (obj, options, ctx) => {
            const uid = options.uid;
            let newRecord;
            let userid;
            let result;
            let payload;
            let errNum;
            let errDesc;
            let Success = false;


            //GET USER FROM HEADER TOKEN
            if (ctx.context.request && ctx.context.request.header && ctx.context.request.header.authorization) {
              try {
                const decrypted = await strapi.plugins['users-permissions'].services.jwt.getToken(ctx.context);
                userid = decrypted.id;
              } catch (e) {
                errNum = "201";
                errDesc = 'Invalid token: Token did not contain required fields';

              }
            }
            if (userid === undefined) {
              errNum = "201";
              errDesc = 'Invalid token: Token did not contain required fields';
            } else {
              //Authentiation OK
              try {

                //CHECK if the item  belongs to crt user
                const chkResult = await strapi.services.spot.find({uid: uid, user: userid, deleted: false});
                console.log(chkResult);
                if (chkResult.length > 0) {
                  const id = chkResult[0].id;
                  const updateData = {"deleted": true};
                  payload = await strapi.services.spot.update({id}, updateData);
                  Success = true;
                  result = {
                    "success": true,
                    "payload": payload
                  };

                } else {
                  errNum = "301";
                  errDesc = 'Invalid spot id';
                }

              } catch (error) {
                console.log(error);
                result = {
                  "success": false,
                  "payload": {},
                  "error": {"code": error.errno, "message": "An error occurred! " + error.code}
                };


              }
            }
            if (Success) {
              //console.log(result);
              return result;

            } else {

              result = {
                "success": false,
                "payload": {},
                "error": {"code": errNum, "message": errDesc}
              };
              return result;
            }
          }
        }

      }
    }
};

