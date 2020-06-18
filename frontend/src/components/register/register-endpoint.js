/**
 *
 * @param ctx
 * @param ctx.apiKey {string}
 * @param ctx.apiUrl {string}
 * @param ctx.from {string}
 * @returns {function(...[*]=)}
 */

const registerEndpoint = ctx => async (req, res) => {
    if (!req.headers['api-key'])
        return res.status(403).send('This service is not public available.');
    if (ctx.apiKey !== req.headers['api-key'])
        return res.status(401).send('Please refresh the page and try again. ' +
            'If this doesn\'t solve the issue, please contact the web-admin via email message.');
    const {name, email, cui, cnp, address, phone, password, confirmPassword} = req.body;

    if (!(email && name && cui && cnp && address && phone && password && confirmPassword))
        return res.status(401).send('Bad request. Missing mandatory data')
    try {
        await ctx['emailEngine'].send({
            to: email,
            from: ctx.from,
            subject: `Contact message from ${name}`,
            text: address, cui, cnp, phone
        })
    } catch (err) {
        res.status(500).send('Message could not be sent')
    }
    return res.send('Message successfully sent')
}

export default registerEndpoint