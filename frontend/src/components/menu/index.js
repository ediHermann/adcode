import React from 'react'
import {NavLink} from "react-router-dom";
import MenuToggle from "../buttons/menu-toggle";


const Menu = () => {
    const [opened, setOpened] = React.useState(true)

    return <div className="absolute overflow-visible right-0 sm:mr-20 top-0 z-50">
        <div
            className="relative text-secondary bottom-rounded sticky"
            style={{
                transform: opened ? 'translateY(calc(5rem - 100%)' : 'translateY(0)',
                transition: 'transform .5s',
            }}>

            <header className="flex flex-col justify-between px-4 py-4 bg-secondary">
                <NavLink to='/home'
                         className='rounded-lg border-2 border-gray-600 hover:border-primary uppercase py-2 pl-4 pr-10 text-text mb-2'
                        >ACASA</NavLink>
                <NavLink to='/spot_list'
                         className='rounded-lg border-2 border-gray-600 hover:border-primary uppercase py-2 pl-4 pr-10 text-text mb-2'
                         >SPOTURILE MELE</NavLink>
                <NavLink to='/settings'
                         className='rounded-lg border-2 border-gray-600 hover:border-primary uppercase py-2 pl-4 pr-10 text-text mb-2'
                        >Setari</NavLink>
                <NavLink to='/profile'
                         className='rounded-lg border-2 border-gray-600 hover:border-primary uppercase py-2 pl-4 pr-10 text-text mb-2'
                        >Profil</NavLink>
                <NavLink to='/other1'
                         className='rounded-lg border-2 border-gray-600 hover:border-primary uppercase py-2 pl-4 pr-10 text-text mb-2'
                >Other</NavLink>
                <NavLink to='/logout'
                         className='rounded-lg border-2 border-gray-600 hover:border-primary uppercase py-2 pl-4 pr-10 text-text mb-2'
                >Log Out</NavLink>

            </header>

            <div
                className="relative bottom-0 w-full h-18 bottom-rounded-inner bg-primary"
                onClick={() => {
                    setOpened(!opened)
                }}>
                <div className='flex text-text h-14'
                style={{minWidth:'375px'}}>
                    <div className='flex bg-secondary justify-center text-center ml-6 mr-2 mt-1'
                    style={{borderRadius: '50%', width: '100px', height: '64px'}}>
                        RS
                    </div>
                    <div className='flex justify-center pr-2 bg-secondary w-full bottom-right-rounded mb-2 mr-2'>
                        <ul className='mr-10'>
                            <li className='font-semibold'>Red Studio</li>
                            <li className='text-xs pb-1'>AV Studio Plus</li>
                            <li className='font-semibold '>CONT PRODUCATOR</li>
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