const { parseMultipartData, sanitizeEntity } = require('strapi-utils');

module.exports = {

  find: async ctx => {
    console.log(ctx.request.header);
    const {uid} = ctx.params;
    let userid;
    let spot;
    let result;
    let errNum;
    let errDesc;

    //GET USER FROM HEADER TOKEN
    if (ctx.request && ctx.request.header && ctx.request.header.authorization) {
      try {
        const decrypted = await strapi.plugins['users-permissions'].services.jwt.getToken(ctx);
        userid = decrypted.id;

        if (userid === undefined) {
          errNum = "201";
          errDesc = 'Invalid token: Token did not contain required fields';
        } else {
          result = await strapi.services.spot-broadcast.find({spot:uid,deleted:false});
          console.log(result);

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
      console.log(result);
      ctx.send({"success": true, "payload": result});

    } else {
      ctx.send({"success": false, "payload": {}, "error": {"code": errNum, "message": errDesc}});
    }
  },
///////////////////////////////////////////////////////////////////////////////////////////////////////

  async create(ctx) {
    const {uid} = ctx.params;
    let newRecord;
    let userid;
    let result;
    let errNum;
    let errDesc;

    //GET USER FROM HEADER TOKEN
    if (ctx.request && ctx.request.header && ctx.request.header.authorization) {
      try {
        const decrypted = await strapi.plugins['users-permissions'].services.jwt.getToken(ctx);
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

        //CHECK if the spot belong to the user
        const chkResult = await strapi.services.spot.find({uid: uid,user:userid, deleted: false});
        if (chkResult.length == 0) {
          errNum = "301";
          errDesc = 'Invalid spot uid';
        } else {
          //insert record
          newRecord = await strapi.services.spot - broadcast.create(ctx.request.body);
          console.log(newRecord.id);
          const id = newRecord.id;

          //update the owner
          const updateData = {"user": userid};
          result = await strapi.services.spot - broadcast.update({id}, updateData);

        }
      }
      catch
        (error)
      {
        console.log(error);
        ctx.send({
          "success": false,
          "payload": {},
          "error": {"code": error.errno, "message": "An error occurred! " + error.code}
        });

      }
    }

    if (newRecord) {
      //console.log(result);
      ctx.send({"success": true,"payload": newRecord});
    } else {
      ctx.send({"success": false, "payload": {}, "error": {"code": errNum, "message": errDesc}});
    }
  },

  ///////////////////////////////////////////////////////////////////////////////////////////////////////

  update: async ctx => {
    const {id} = ctx.params;
    let userid;
    let result;
    let errNum;
    let errDesc;
    console.log(uid);
    //GET USER FROM HEADER TOKEN
    if (ctx.request && ctx.request.header && ctx.request.header.authorization) {
      try {
        const decrypted = await strapi.plugins['users-permissions'].services.jwt.getToken(ctx);
        userid = decrypted.id;

        if (userid === undefined) {
          errNum = "201";
          errDesc = 'Invalid token: Token did not contain required fields';
        } else {
          //Authentiation OK
          //CHECK if the spot  belongs to crt user
          const chkResult = await strapi.services.spot-broadcast.find({id: id, deleted:false});
          console.log(chkResult);
          if (chkResult.length>0 && chkResult.user==userid) {

            result = await strapi.services.spot-broadcast.update({id}, ctx.request.body);

          } else {
            errNum = "301";
            errDesc = 'Invalid spot uid';
          }
        }

      } catch (e) {
        console.log(e);
        errNum = "302";
        errDesc = "Unexpected error";

      }
    }

    if (result) {
      //console.log(result);
      ctx.send({"success": true});
    } else {
      ctx.send({"success": false, "payload": {}, "error": {"code": errNum, "message": errDesc}});
    }
  },

  ///////////////////////////////////////////////////////////////////////////////////////////////////////

  delete: async ctx => {
    const {id} = ctx.params;
    let userid;
    let result;
    let errNum;
    let errDesc;
    console.log(uid);
    //GET USER FROM HEADER TOKEN
    if (ctx.request && ctx.request.header && ctx.request.header.authorization) {
      try {
        const decrypted = await strapi.plugins['users-permissions'].services.jwt.getToken(ctx);
        userid = decrypted.id;

        if (userid === undefined) {
          errNum = "201";
          errDesc = 'Invalid token: Token did not contain required fields';
        } else {
          //Authentiation OK
          //CHECK if the spot  belongs to crt user
          const chkResult = await strapi.services.spot-broadcast.find({id: id, deleted:false});
          console.log(chkResult);
          if (chkResult.length>0 && chkResult.user==userid) {

            const updateData={"deleted":true};
            result = await strapi.services.spot-broadcast.update({id}, updateData);

          } else {
            errNum = "301";
            errDesc = 'Invalid spot uid';
          }
        }

      } catch (e) {
        console.log(e);
        errNum = "302";
        errDesc = "Unexpected error";

      }
    }

    if (result) {
      //console.log(result);
      ctx.send({"success": true});
    } else {
      ctx.send({"success": false, "payload": {}, "error": {"code": errNum, "message": errDesc}});
    }
  },


}
