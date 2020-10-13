const { parseMultipartData, sanitizeEntity } = require('strapi-utils');

module.exports = {
  query: `userSpots(where: JSON, limit: Int, offset: Int, sort:String): JSON!, artistsSpots(where: JSON, limit: Int, offset: Int, sort:String): JSON!,searchSpot(where: JSON): JSON!`,
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


                  criteria.user = userid;
                  criteria.deleted = false;
                  console.log(criteria)
                  const result0 = await strapi.services.spot.find(criteria);
                  result=[];
                  if (result0.length>0) {
                    result=result0;
                    for (idx = 0; idx < result0.length; idx++) {

                      const spot_id = result0[idx].id;
                      const result1 = await strapi.services['spot-talent'].find({spot: spot_id});
                      result[idx].spotTalents = result1.map(spotTalent => ({
                        id: spotTalent.id,
                        talent: {id: spotTalent.talent.id, name: spotTalent.talent.username, avatar: spotTalent.talent.avatar},
                        role: spotTalent.talent_role,
                        obs: spotTalent.obs
                      }));

                      success = true;
                    }
                  }
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

      artistsSpots:
        {
          description: 'Return crt artists spots',
          resolverOf: 'application::spot.spot.find',
          resolver: async (obj, options, ctx) => {
            let userid
            let result;
            let result0
            let result1
            let errNum;
            let errDesc;
            let id;
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
                  id=userid;
                  criteria.talent = userid;
                  criteria.deleted = false;
                  console.log(criteria)
                  result0 = await strapi.services['spot-talent'].find(criteria);
                  //console.log(result0)
                  //return(true);
                  result=[];
                  if (result0.length>0) {
                    for (idx = 0; idx < result0.length; idx++) {
                      result[idx]= result0[idx].spot;

                      //Get all the talents
                      const spot_id = result0[idx].spot.id;
                      result1 = await strapi.services['spot-talent'].find({spot: spot_id});
                      result[idx].spotTalents = result1.map(spotTalent => ({
                        id: spotTalent.id,
                        talent: {id: spotTalent.talent.id, name: spotTalent.talent.username, avatar: spotTalent.talent.avatar},
                        role: spotTalent.talent_role,
                        obs: spotTalent.obs
                      }));

                      success = true;
                    }
                  }
                }

                console.log(result);

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

      searchSpot:
        {
          description: 'Search  a spot by title ',
          resolverOf: 'application::spot.spot.find',
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
                    const title=criteria.title;
                    console.log(criteria);
                    const qryres= await strapi.connections.default.raw('SELECT uid, title  as `name`  from spots WHERE `title` LIKE ? AND deleted=0 order by title', title);
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

    },

    Mutation: {
      createUserSpot: {
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

              //insert spot

              newRecord = await strapi.services.spot.create(options.data); //Or options.data
              console.log(newRecord.id);
              id = newRecord.id;

              //update the owner
              const updateData = {"user": userid};
              payload = await strapi.services.spot.update({id}, updateData);
              ///////////////////////////////////////////////////////////////
              //SPOT TALENTS

              const spotTalents = await strapi.services['spot-talent'].find({spot: id});
              console.log(spotTalents)
              dataTalents=options.data.spotTalents.map(spotTalent => ({
                id: spotTalent.id,
                talent: spotTalent.talent.name,
                talent_role: spotTalent.role,
                obs: spotTalent.obs
              }));

              console.log('dataTalents');
              console.log(dataTalents);
              for (idx=0;idx<spotTalents.length;idx++)
              {
                if (options.data.spotTalents.length>0)
                {
                  useriId=-1;
                  talentName=spotTalents[idx].talent.username;
                  id=spotTalents[idx].id;

                  //find the talent Id

                  idx1 = dataTalents.findIndex(element => element.id = id);
                  if(idx1>-1)
                  {

                    userObj = await strapi.plugins['users-permissions'].services.user.fetch({username: dataTalents[idx1].talent});
                    if(userObj)
                      useriId=userObj.id;

                    console.log('useriId='+useriId);
                    if(useriId>0) {
                      //Put the id on talent field
                      console.log('updating line...');
                      dataTalents[idx1].talent = useriId;
                      await strapi.services['spot-talent'].update({id}, dataTalents[idx1]);
                      console.log(dataTalents[idx1]);
                      dataTalents.splice(idx1, 1);

                    }

                  }
                  else
                  {
                    await strapi.services['spot-talent'].delete({id});
                    console.log('deleting spotTalentId='+ id)
                  }

                }
              }//end of for loop

              //add the new elements
              console.log('remaining...')
              console.log(dataTalents);
              if (dataTalents.length>0) {
                for (idx = 0; idx < dataTalents.length; idx++)
                {
                  console.log('inserting...')
                  talentName=dataTalents[idx].talent;

                  id=-1;
                  //find the talent Id
                  userObj = await strapi.plugins['users-permissions'].services.user.fetch({username:talentName});
                  if(userObj) {
                    console.log('new data...')
                    dataTalents[idx].talent=userObj.id;
                    dataTalents[idx].spot=spotId;
                    console.log(dataTalents[idx])
                    await strapi.services['spot-talent'].create(dataTalents[idx]);

                  }
                }
              }

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

      updateUserSpot: {
        description: 'Update user  spot',
        resolverOf: 'application::spot.spot.find',
        resolver: async (obj, options, ctx) => {
          const uid = options.uid;

          let userid;
          let payload;
          let errNum;
          let errDesc;
          let idx;
          let idx1;
          let id;
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

              //CHECK if the item  belongs to crt user
              const chkResult = await strapi.services.spot.find({uid: uid, user: userid, deleted: false});
              if (chkResult.length > 0) {
                id = chkResult[0].id;
                spotId=id;
                console.log(options.data);
                payload = await strapi.services.spot.update({id}, options.data);

                ///////////////////////////////////////////////////////////////
                //SPOT TALENTS

                const spotTalents = await strapi.services['spot-talent'].find({spot: id});
                console.log(spotTalents)

                // let dataTalents=options.data.spotTalents;


                dataTalents=options.data.spotTalents.map(spotTalent => ({
                  id: spotTalent.id,
                  talent: spotTalent.talent.name,
                  talent_role: spotTalent.role,
                  obs: spotTalent.obs
                }));

                console.log('dataTalents');
                console.log(dataTalents);
                for (idx=0;idx<spotTalents.length;idx++)
                {
                  if (options.data.spotTalents.length>0)
                  {
                    useriId=-1;
                    talentName=spotTalents[idx].talent.username;
                    id=spotTalents[idx].id;

                    //find the talent Id

                    idx1 = dataTalents.findIndex(element => element.id = id);
                    if(idx1>-1)
                    {

                      userObj = await strapi.plugins['users-permissions'].services.user.fetch({username: dataTalents[idx1].talent});
                      if(userObj)
                        useriId=userObj.id;

                      console.log('useriId='+useriId);
                      if(useriId>0) {
                        //Put the id on talent field
                        console.log('updating line...');
                        dataTalents[idx1].talent = useriId;
                        await strapi.services['spot-talent'].update({id}, dataTalents[idx1]);
                        console.log(dataTalents[idx1]);
                        dataTalents.splice(idx1, 1);

                      }

                    }
                    else
                    {
                        await strapi.services['spot-talent'].delete({id});
                        console.log('deleting spotTalentId='+ id)
                    }

                  }
                }//end of for loop

                //add the new elements

                console.log('remaining...')
                console.log(dataTalents);
                if (dataTalents.length>0) {
                  for (idx = 0; idx < dataTalents.length; idx++)
                  {
                    console.log('inserting...')
                    talentName=dataTalents[idx].talent;

                    id=-1;
                    //find the talent Id
                    userObj = await strapi.plugins['users-permissions'].services.user.fetch({username:talentName});
                    if(userObj) {
                      console.log('new data...')
                      dataTalents[idx].talent=userObj.id;
                      dataTalents[idx].spot=spotId;
                      console.log(dataTalents[idx])
                      await strapi.services['spot-talent'].create(dataTalents[idx]);

                    }
                  }
                }

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
                const id = chkResult[0].id;
                const updateData = {"deleted": true};
                payload = await strapi.services.spot.update({id}, updateData);
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

