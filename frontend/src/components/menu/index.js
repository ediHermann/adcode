import React from 'react'

import {HOME, LOGOUT, PROFILE, SETTINGS, SPOTS, UID} from "../__constants";
import MenuToggle from "../buttons/menu-toggle";
import NavLink from "../mixt/nav-link";


const Menu = () => {
    const [opened, setOpened] = React.useState(true)

    const route = location.pathname

    return <div className="absolute overflow-visible right-menu top-0">
        <div
            className="relative text-secondary bottom-rounded "
            style={{
                transform: opened ? 'translateY(calc(5rem - 100%)' : 'translateY(0)',
                transition: 'transform .5s',
                borderRadius: '0 0 20px 20px'
            }}>
            <header className="flex flex-col justify-between px-4 py-4 bg-secondary">
                <button onClick={() => history.push('/home')}
                         className='rounded-lg border-2 border-gray-600 hover:border-primary py-2 pl-4 pr-10 text-text mb-2'>ACASA</button>
                <button onClick={() => history.push('/uid')}
                         className='rounded-lg border-2 border-gray-600 hover:border-primary py-2 pl-4 pr-10 text-text mb-2'>NEW
                    UID</button>
                <button onClick={() => history.push('/create_spot')}
                         className='rounded-lg border-2 border-gray-600 hover:border-primary py-2 pl-4 pr-10 text-text mb-2'>SPOTURILE
                    MELE</button>
                <NavLink to={route.link(PROFILE)}
                         className='rounded-lg border-2 border-gray-600 hover:border-primary py-2 pl-4 pr-10 text-text mb-2'>PROFIL</NavLink>
                <button onClick={() => history.push('/settings')}
                        className='rounded-lg border-2 border-gray-600 hover:border-primary py-2 pl-4 pr-10 text-text mb-2'>SETTINGS</button>
                <NavLink to={route.link(LOGOUT)}
                         className='rounded-lg border-2 border-gray-600 hover:border-primary py-2 pl-4 pr-10 text-text mb-2'>LOG
                    OUT</NavLink>
            </header>

            <div
                className="relative bottom-0 w-full h-18 bottom-rounded-inner bg-primary"
                onClick={() => {
                    setOpened(!opened)
                }}>
                <div className='flex text-text h-14'>
                    <div className='flex bg-secondary justify-center text-center pr-4 pb-0'
                    style={{borderRadius: '50%', width: '64', height: '64px' , margin: '4px'}}>
                        BG
                    </div>
                    <div className='flex justify-center px-4 bg-secondary w-full bottom-right-rounded mb-2 mr-2'>
                        <ul>
                            <li className='font-semibold'>Nume</li>
                            <li className='text-xs pb-1'>Bla Bla</li>
                            <li className='font-semibold'>CONT PRODUCATOR</li>
                        </ul>
                        <MenuToggle
                            opened={!opened}
                            className="w-5 h-5 fill-current"
                        />
                    </div>
                </div>
                <div>
                </div>

            </div>
        </div>
    </div>
}

export default Menu