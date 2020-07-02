import React from 'react'
import Menu from "../menu";

const Layout = props =>
    <>
        <div className="app-header">
            <Menu/>
        </div>
        <div className='app-page'>
            {props.children}
        </div>
        <footer className="app-footer">
            {/*<FooterContent/>*/}
        </footer>


    </>

export default Layout