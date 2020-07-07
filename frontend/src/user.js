import {createActions, handleActions} from 'redux-actions'

const initialState = {
    user: true
}

const USER_LOGGEDIN = 'USER_LOGGEDIN'
const USER_LOGGEDOUT = 'USER_LOGGEDOUT'

export const {
    userLoggedin,
    userLoggedout
} = createActions({},
    USER_LOGGEDIN,
    USER_LOGGEDOUT
)

export default handleActions({
    [USER_LOGGEDIN]: (state, action) => ({
        ...state,
        user: action.payload
    }),
    [USER_LOGGEDOUT]: state => ({
        ...state,
        user: null
    })
}, initialState)