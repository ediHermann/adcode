import React from 'react'
import {NavLink} from "react-router-dom";
import MenuToggle from "../buttons/menu-toggle";
import baseURL from "../common/config.js";

const userDataStr=localStorage.getItem('userData');
//const userDataStr=JSON.stringify({"id":1,"username":"Studio 1","email":"studio@gmail.com",role:{name:"Studio"}});
//console.log(userDataStr);
let userData;

if(userDataStr)
{
    console.log(userDataStr);
    userData=JSON.parse(userDataStr);
    console.log(userData.username);
}



const Menu = () => {
    const [opened, setOpened] = React.useState(true)

    return <div className="absolute  right-0 sm:mr-20 top-0 z-50"
                style={{
                    transform: opened ? 'translateY(calc(5rem - 100%)' : 'translateY(0)',
                    transition: 'transform .5s',
                }}>
        <div className="relative text-secondary overflow-hidden bottom-rounded sticky">

            <header className="flex flex-col justify-between px-4 py-4 bg-secondary">
                <NavLink to='/home'
                         className='rounded-lg border-2 border-gray-600 hover:border-primary uppercase py-2 pl-4 pr-10 text-text mb-2'
                >ACASA</NavLink>
                <NavLink to='/spot_list'
                         className='rounded-lg border-2 border-gray-600 hover:border-primary uppercase py-2 pl-4 pr-10 text-text mb-2'
                >SPOTURILE MELE</NavLink>
                <NavLink to='/my_spots'
                         className='rounded-lg border-2 border-gray-600 hover:border-primary uppercase py-2 pl-4 pr-10 text-text mb-2'
                >My Spots</NavLink>
                <NavLink to='/profile'
                         className='rounded-lg border-2 border-gray-600 hover:border-primary uppercase py-2 pl-4 pr-10 text-text mb-2'
                >Profil</NavLink>
                <NavLink to='/other1'
                         className='rounded-lg border-2 border-gray-600 hover:border-primary uppercase py-2 pl-4 pr-10 text-text mb-2'
                >Broadcast</NavLink>
                <NavLink to='/other2'
                         className='rounded-lg border-2 border-gray-600 hover:border-primary uppercase py-2 pl-4 pr-10 text-text mb-2'
                >Other2</NavLink>
                <NavLink to='/create_spot'
                         className='rounded-lg border-2 border-gray-600 hover:border-primary uppercase py-2 pl-4 pr-10 text-text mb-2'
                >Spot nou</NavLink>
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
                     style={{minWidth: '375px'}}>
                    <div className='flex bg-secondary justify-center text-center ml-6 mr-2 mt-1'
                         style={{borderRadius: '50%', width: '100px', height: '64px'}}>
                        <img src={'data:image/png;base64,'+userData.avatar} alt='Avatar'
                             style={{borderRadius: '50%', width: '100px', height: '64px'}}
                        />
                    </div>
                    <div className='flex justify-center pr-2 bg-secondary w-full bottom-right-rounded mb-2 mr-2'>
                        <ul className='mr-10'>
                            <li className='font-semibold pb-3' >{userData.username}</li>
                            <li className='font-semibold uppercase pb-3'>Cont {userData.role.name}</li>
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