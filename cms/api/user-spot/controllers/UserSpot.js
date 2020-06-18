const { parseMultipartData, sanitizeEntity } = require('strapi-utils');

module.exports = {

  find: async ctx => {
    console.log(ctx.request.header);
    let userid;
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
          result = await strapi.services.spot.find({user:userid,deleted:false});
          console.log(result);

        }
      } catch (e) {

        console.log(e);
        errNum = "202";
        errDesc = 'Invalid token: Token did not contain required fields';

        eerrror
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

        //insert spot
        newRecord = await strapi.services.spot.create(ctx.request.body);
        console.log(newRecord.id);
        const id = newRecord.id;

        //update the owner
        const updateData = {"user": userid};
        result=await strapi.services.spot.update({id}, updateData);

      } catch (error) {
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
    const {uid} = ctx.params;
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
          //CHECK if the item  belongs to crt user
          const chkResult = await strapi.services.spot.find({uid: uid, user: userid, deleted:false});
          console.log(chkResult);
          if (chkResult.length>0) {
            const id=chkResult[0].id;
            result = await strapi.services.spot.update({id}, ctx.request.body);

          } else {
            errNum = "301";
            errDesc = 'Invalid spot id';
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
    const {uid} = ctx.params;
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
          //CHECK if the item  belongs to crt user
          const chkResult = await strapi.services.spot.find({uid: uid, user: userid, deleted:false});
          console.log(chkResult);
          if (chkResult.length>0) {
            const id=chkResult[0].id;
            const updateData={"deleted":true};
            result = await strapi.services.spot.update({id}, updateData);

          } else {
            errNum = "301";
            errDesc = 'Invalid spot id';
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
