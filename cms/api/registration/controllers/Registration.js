'use strict';
const { parseMultipartData, sanitizeEntity } = require('strapi-utils');

//POST
module.exports = {
  async create(ctx) {
    let entity;
    if (ctx.is('multipart')) {
      const { data, files } = parseMultipartData(ctx);
      entity = await strapi.services.user.create(data, {files });
    } else {

      try {


        //insert user
        entity = await strapi.plugins['users-permissions'].services.user.add(ctx.request.body);
        console.log(entity.id);
        const id=entity.id;

        //update to blocked
        const updateData={"blocked":true};
        await strapi.plugins['users-permissions'].services.user.edit({id}, updateData);

        //TODO:
        // email to Strapi admin
        // using Twilio SendGrid's v3 Node.js Library


        const sgMail = require('@sendgrid/mail');
        sgMail.setApiKey('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');

        const msg = {
          to: 'edi.hermann@lemonbyte.ro',
          from: 'edi.hermann@lemonbyte.ro',
          subject: 'Sending with Twilio SendGrid is Fun',
          text: 'and easy to do anywhere, even with Node.js',
          html: '<strong>and easy to do anywhere, even with Node.js</strong>',
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
