
export const HOME = 'H'
export const SPOTS = 'S'
export const UID = 'U'
export const SETTINGS = 'S'
export const PROFILE = 'P'
export const LOGOUT = 'L'

export const GENERAL = 'G'
export const OTHERS = 'O'

const routes = {
    [HOME]: {
        href:'/',
        display: 'Home',
        category: 'GENERAL'
    },
    [SPOTS]: {
        href: '/spoturile_mele',
        display: 'Spoturile Mele',
        category: 'GENERAL'
    },
    [UID]: {
        href: '/new_uid',
        display: 'New UID',
        category: 'GENERAL'
    },
    [SETTINGS]: {
        href: '/settings',
        display: 'Setari',
        category: 'OTHERS'
    },
    [PROFILE]:{
        href: '/profil',
        display: 'Profil',
        category: 'OTHERS'
    },
    [LOGOUT]: {
        href: '/logout',
        display: 'Log Out',
        category: 'OTHERS'
    }

}
export default routes
