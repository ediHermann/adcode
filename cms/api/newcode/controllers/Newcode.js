module.exports = {
  // GET /hello
  index: async ctx => {
    var codeok=false;

    while (!codeok) {
      code = makeid(8);
      const result = await strapi.query('spot').find({uid: code});
      codeok=!(result && result.length);
      }
       ctx.send(code);

  },
};


function makeid(length) {
  var result           = '';
  var characters       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  var charactersLength = characters.length;
  for ( var i = 0; i < length; i++ ) {
    result += characters.charAt(Math.floor(Math.random() * charactersLength));
  }
  return result;
}

