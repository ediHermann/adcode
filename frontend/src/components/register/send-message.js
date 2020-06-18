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
     * @param payload.address {string}
     * @param payload.cui {string}
     * @param payload.cnp {string}
     * @param payload.phone {string}
     * @param payload.password {string}
     * @param payload.confirmPassword {string}
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
                        cui: payload.cui,
                        cnp: payload.cnp,
                        address: payload.address,
                        phone: payload.phone,
                        email: payload.email,
                        password: payload.password,
                        confirmPassword: payload.confirmPassword,
                    })
                }
            )
            if (res.status > 399) return res.message || res.statusText
        } catch (err) {
            return err.message
        }
    }

export default sendMessage