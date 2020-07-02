/**
 *
 * @param ctx
 * @param ctx.apiKey {string}
 * @param ctx.apiUrl {string}
 * @param ctx.from {string}
 * @returns {function(...[*]=)}
 */

const contactEndpoint = ctx => async (req, res) => {
    if (!req.headers['api-key'])
        return res.status(403).send('This service is not public available.')
    if (ctx.apiKey !== req.headers['api-key'])
        return res.status(401).send('Please refresh the page and try again. ' +
            'If this doesn\'t solve the issue, please contact the web-admin via email message.')
    const {name, email, message} = req.body

    if (!(email && name && message))
        return res.status(401).send('Bad request. Missing mandatory data')
    try {
        await ctx['emailEngine'].send({
            to: email,
            from: ctx.from,
            subject: `Contact message from ${name}`,
            text: message
        })
    } catch (err) {
        res.status(500).send('Message could not be sent')
    }
    return res.send('Message successfully sent')
}

export default contactEndpoint