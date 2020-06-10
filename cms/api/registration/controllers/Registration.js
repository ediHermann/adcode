'use strict';
const { parseMultipartData, sanitizenewRecord } = require('strapi-utils');
//var util = require('util');
const errmess=require('@vladblindu/errmess');
//POST
module.exports = {
  async create(ctx) {
    let newRecord;
    if (ctx.is('multipart')) {
      const { data, files } = parseMultipartData(ctx);
      newRecord = await strapi.services.user.create(data, {files });
    } else {

      try {

        //insert user
        newRecord = await strapi.plugins['users-permissions'].services.user.add(ctx.request.body);
        console.log(newRecord.id);
        const id=newRecord.id;
        const email=newRecord.email;
        const username=newRecord.username;

        //update to blocked
        const updateData={"blocked":true};
        await strapi.plugins['users-permissions'].services.user.edit({id}, updateData);


        // email to site admin

        //Config locate in config/application.json and config/custom.json
        const sgMail = require('@sendgrid/mail');

        //Get sendGrid apiKey
        const apiKey = strapi.config['sendgrid'].apikey;    //config/application.json

        //Get msg templates
        const msgObj=strapi.config['adminMsgReg'];       //config/custom.json
        const lang="ro";
        const vars = {username:username, useremail:email};

        const adminSubj  = errmess(msgObj)(lang)("subject", vars);
        const adminText  = errmess(msgObj)(lang)("txt", vars);
        const adminHtml  = errmess(msgObj)(lang)("html", vars);
        console.log(adminHtml);

        sgMail.setApiKey(apiKey);
        const emailmsg = {
          to:   'edi.hermann@lemonbyte.ro',
          from: 'edi.hermann@lemonbyte.ro',
          subject: adminSubj,
          text: adminText,
          html: adminHtml
        };
       //ES6
        sgMail
          .send(emailmsg)
          .then(() => {}, error => {
            console.error(error);

            if (error.response) {
              console.error(error.response.body)
            }
          });


        // email to user

        ctx.send({"success": true});

      }
      catch (error) {
        //console.log(error.errno);
        ctx.send({"success": false,  "payload": {}, "error": {"code": error.errno, "message": "An error occurred! "+error.code}});
        //ctx.badRequest(null, formatError(error));
      }

    }

  },
};
