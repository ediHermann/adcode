import React from 'react'
import {NavLink} from "react-router-dom";
import {HOME, LOGOUT, PROFILE, SETTINGS, SPOTS, UID} from "../../__constants";
import MenuToggle from "../buttons/menu-toggle";




const Menu = () => {
    const [opened, setOpened] = React.useState(true)

    const route = location.pathname

    return <div className="absolute overflow-visible right-menu top-0">
        <div
            className="relative text-secondary bottom-rounded "
            style={{
                transform: opened ? 'translateY(calc(4.9rem - 100%)' : 'translateY(0)',
                transition: 'transform .5s',
            }}>

            <header className="flex flex-col justify-between px-4 py-4 bg-secondary">
                <NavLink to={route.link(HOME)}
                         className='rounded-lg border-2 border-gray-600 hover:border-primary py-2 pl-4 pr-10 text-text mb-2'>ACASA</NavLink>
                <NavLink to={route.link(UID)}
                         className='rounded-lg border-2 border-gray-600 hover:border-primary py-2 pl-4 pr-10 text-text mb-2'>NEW
                    UID</NavLink>
                <NavLink to={route.link(SPOTS)}
                         className='rounded-lg border-2 border-gray-600 hover:border-primary py-2 pl-4 pr-10 text-text mb-2'>SPOTURILE
                    MELE</NavLink>
                <NavLink to={route.link(PROFILE)}
                         className='rounded-lg border-2 border-gray-600 hover:border-primary py-2 pl-4 pr-10 text-text mb-2'>PROFIL</NavLink>
                <NavLink to={route.link(SETTINGS)}
                         className='rounded-lg border-2 border-gray-600 hover:border-primary py-2 pl-4 pr-10 text-text mb-2'>SETTINGS</NavLink>
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
                    <div className='flex bg-secondary justify-center text-center ml-6 mr-2 mt-1'
                    style={{borderRadius: '50%', width: '100px', height: '64px'}}>
                        BG
                    </div>
                    <div className='flex justify-center pr-2 bg-secondary w-full bottom-right-rounded mb-2 mr-2'>
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