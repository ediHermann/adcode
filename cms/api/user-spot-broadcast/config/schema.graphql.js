const { parseMultipartData, sanitizeEntity } = require('strapi-utils');

module.exports = {
  query: `userSpotsBroadcast(where: JSON, limit: Int, offset: Int, sort:String): JSON!,userBroadcastTable(where: JSON, limit: Int, offset: Int, sort:String): JSON!`,
  mutation:`createUserSpotBroadcast(data: JSON): JSON!,updateUserSpotBroadcast(uid:String, data: JSON): JSON!,deleteUserSpotBroadcast(uid:String): JSON! `,
  resolver: {
    Query: {
      userSpotsBroadcast:
        {
          description: 'Return crt user spots',
          resolverOf: 'application::spot-broadcast.find',
          resolver: async (obj, options, ctx) => {
            let userid
            let result;
            let errNum;
            let errDesc;
            let idx;
            let success = false;
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
                  console.log(criteria)
                  const result = await strapi.services['spot-broadcast'].find(criteria);
                  success = true;
                }
                console.log(result[0]);

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
            return {"success": success, "payload": result, "error": {"code": errNum, "message": errDesc}};

          }
        },

      userBroadcastTable:
      {
          description: 'Return broadcast table',
          resolverOf: 'application::broadcast-table.broadcast-table.find',
          resolver: async (obj, options, ctx) => {
            let userid
            let result;
            let errNum;
            let errDesc;
            let idx;
            let success = false;
            //GET USER FROM HEADER TOKEN

            console.log('OK')
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
                    criteria._where = options.where;
                  }
                  else
                    criteria._where=' 1 ';
                  if(options.limit && options.offset)
                  {
                    criteria._limit = options.limit;
                    criteria._start = options.offset;
                  }
                  else
                  {
                    criteria._limit = 100;
                  }
                  if(options.sort)
                  {
                    criteria._sort = options.sort;
                  }
                  else
                    criteria._sort = 'title, `date`, `time`';


                  console.log(criteria);
                  //result = await strapi.services['broadcast-table'].find(criteria);
                 // console.log(result);




                  const qryres= await strapi.connections.default.raw('SELECT distinct  spots.uid,spots.client,spots.title, studio.username as studio,`date`,`time` ,`broadcast_duration`, `users-permissions_user`.username as`broadcaster` ' +
                    'FROM `spot_broadcasts` inner join spots on spot_broadcasts.spot=spots.id ' +
                    'inner join `users-permissions_user` on spot_broadcasts.broadcaster=`users-permissions_user`.id '  +
                    'inner join `users-permissions_user` studio on spots.user=studio.id '  +
                    'inner join broadcast_tables on spot_broadcasts.id=broadcast_tables.spot_broadcast '+
                    'left join spot_talents on spots.id=spot_talents.talent ' +
                    'left join `users-permissions_user` talents on spot_talents.talent=talents.id WHERE ? ORDER BY '+ criteria._sort+' limit '+ criteria._limit, criteria._where);
                  if(qryres)
                    result=qryres[0];

                  console.log(result);




                  success = true;
                }


              }
              catch (e) {
                console.log(e);
                errNum = "202";
                errDesc = e.message;
              }
            }
            else {
              errNum = "203";
              errDesc = 'Missing token: Token did not contain required fields';
            }
            return {"success": success, "payload": result, "error": {"code": errNum, "message": errDesc}};
          }
        }

    },

    Mutation: {
      createUserSpotBroadcast: {
        description: 'Create new  spots',
        resolverOf: 'application::spot.spot.find',
        resolver: async (obj, options, ctx) => {
          let success = false;
          let newRecord;
          let userid;
          let result;
          let payload;
          let idx;
          let idx1;
          let id;
          let spotId;
          let useriId;
          let talentName;
          let userObj;
          let dataTalents;

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

              //insert
              newRecord = await strapi.services['spot-broadcast'].create(ctx.context.request.body); //Or options.data
             success=true;

            } catch (error) {
              console.log(error);
              errNum= error.code;
              errDesc="An error occurred! " + error.message;
            }
          }
          return {"success": success, "payload": {}, "error": {"code": errNum, "message": errDesc}};

        }
      },

      updateUserSpotBroadcast: {
        description: 'Update user  spot',
        resolverOf: 'application::spot.spot.find',
        resolver: async (obj, options, ctx) => {
          const uid=options.data.spot;
          const id=options.data.id;
          let userid;
          let payload;
          let errNum;
          let errDesc;
          let idx;
          let idx1;
          let spotId;
          let useriId;
          let talentName;
          let userObj;
          let dataTalents;
          let success = false;
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
            //Authentication OK
            try {

              //CHECK if the spot  belongs to crt user
              const chkResult = await strapi.services.spot.find({uid: uid, user: userid, deleted: false});
              if (chkResult.length > 0) {
                console.log(options.data);
                payload = await strapi.services['spot-broadcast'].update({id}, options.data);
                success = true;

              }
              else {
                errNum = "301";
                errDesc = 'Invalid spot id';
              }

            } catch (error) {
              console.log(error);
              errNum= error.code;
              errDesc="An error occurred! " + error.message;
            }
          }
          return {"success": success, "payload": {}, "error": {"code": errNum, "message": errDesc}};
        }
      },

      deleteUserSpotBroadcast: {
        description: 'Delete user spot',
        resolverOf: 'application::spot.spot.find',
        resolver: async (obj, options, ctx) => {
          const uid=options.data.spot;
          const id=options.data.id;
          let newRecord;
          let userid;
          let result;
          let payload;
          let errNum;
          let errDesc;
          let success = false;


          //GET USER FROM HEADER TOKEN
          if (ctx.context.request && ctx.context.request.header && ctx.context.request.header.authorization)
          {
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
            //Authentication OK
            try {

              //CHECK if the item  belongs to crt user
              const chkResult = await strapi.services.spot.find({uid: uid, user: userid, deleted: false});
              console.log(chkResult);
              if (chkResult.length > 0) {
                const updateData = {"deleted": true};
                payload = await strapi.services['spot-broadcast'].update({id}, updateData);
                success = true;
              } else
                {
                errNum = "301";
                errDesc = 'Invalid spot id';
              }

            } catch (error) {
              console.log(error);
              errNum= error.code;
              errDesc="An error occurred! " + error.message;


            }
          }
          return {"success": success, "payload": {}, "error": {"code": errNum, "message": errDesc}};
        }
      }

    }
  }
};

