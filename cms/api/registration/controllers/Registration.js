'use strict';
const { parseMultipartData, sanitizenewRecord } = require('strapi-utils');

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

        const sgMail = require('@sendgrid/mail');
        const apiKey = strapi.config['sendgrid'].apikey;
        // sgMail.setApiKey('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');
        sgMail.setApiKey(apiKey);
        const msg = {
          to: 'edi.hermann@lemonbyte.ro',
          from: 'edi.hermann@lemonbyte.ro',
          subject: 'Adcode registration request',
          text:  'A new registration request has arrived. Name:'+ username+', email: '+email,
          html: '<strong>A new registration request has arrived</strong><br />Name:'+ username+'<br />email: '+email
        };
       //ES6
        sgMail
          .send(msg)
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
