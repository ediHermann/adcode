/**
 *
 * @param apiUrl {string}
 * @param apiKey {string}
 * @returns {function(...[*]=)}
 */
const sendMessage = (apiUrl, apiKey) =>
    /**
     *
     * @param payload {object}
     * @param payload.name {string}
     * @param payload.email {string}
     * @param payload.message {string}
     * @returns {Promise<*|string>}
     */
    async (payload) => {
        try {
            const res = await fetch(
                apiUrl,
                {
                    headers: {
                        'api-key': apiKey,
                        'content-type': 'application/json',
                        'Access-Control-Allow-Origin': '*'
                    },
                    method: 'post',
                    body: JSON.stringify({
                        name: payload.name,
                        email: payload.email,
                        message: payload.message
                    })
                }
            )
            if (res.status > 399) return res.message || res.statusText
        } catch (err) {
            return err.message
        }
    }

export default sendMessage