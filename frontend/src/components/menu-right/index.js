import React from 'react'
import {NavLink} from "react-router-dom";
import MenuToggle from "../buttons/menu-toggle";
import HelpButton from "../svg/HelpButton";
import ContactForm from "../contact/contact-form";

const RightMenu = () => {
    const [opened, setOpened] = React.useState(true)


    return <div className="fixed overflow-visible right-0 top-0 z-50"
                style={{
                    width: '350px',
                    right: '0',
                    height: '100%'
                }}>
        <div
            className="relative text-white"
            style={{
                transform: opened ? 'translateX(calc(44rem - 100%)' : 'translateX(0)',
                transition: 'transform .5s',
                height: '100%',
                borderLeft: '1px solid gray'

            }}>
            <div className="relative px-4 py-4 h-full bg-secondary right-0 ">
                <MenuToggle
                    opened={!opened}
                    className="w-5 h-5 fill-current mb-4"
                />
                <div className='flex flex-col justify-between mx-4'>
                    <label className='mb-4'>Solicita inregistrarea unui cont:</label>
                    <NavLink to={'/cont_talent'}
                             className='item-link hover:border-primary'>Cont Talent</NavLink>
                    <NavLink to={'/cont_producator'}
                             className='item-link hover:border-primary'>Cont Producator</NavLink>
                    <NavLink to={'/cont_emitator'}
                             className='item-link hover:border-primary'>Cont Emitator</NavLink>
                    <NavLink to={'/cont_arbitru'}
                             className='item-link hover:border-primary'>Cont Arbitru</NavLink>
                </div>

                <div className='relative h-full'>
                    <div className='absolute px-2 mb-4'
                         style={{
                             bottom: '250px'
                         }}>
                        <div className='mb-2'>
                            <label>CONTACT</label>
                        </div>
                        <div className='text-black'>
                            <ContactForm />
                        </div>
                    </div>
                </div>
            </div>
            <div
                className=" fixed w-20 h-18 transform -rotate-90 aps -mt-32"
                onClick={() => {
                    setOpened(!opened)
                }}>
                <div className='flex absolute bg-primary px-1 pt-1 '
                     style={{
                         borderRadius: '28px 28px 0 0 ',
                         height: '61px',
                         width: '200px'

                     }}
                >

                    <div className='flex justify-center text-center'
                         style={{ width: '100px', borderRadius: '100%'}}>
                        <HelpButton className='fill-white transform rotate-90 mt-1'/>
                    </div>
                    <div className='flex justify-center text-center pt-4 rounded-t-right bg-secondary w-full'>
                        <label>SUPORT</label>
                    </div>
                </div>
            </div>

        </div>
    </div>
}

export default RightMenu