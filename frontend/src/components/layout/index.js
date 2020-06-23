import React from 'react'

const Layout = props =>
    <>
        <div className="app-header">
            {/*<HeaderContent/>*/}
        </div>
        <div className='app-page'>
            {props.children}
        </div>
        <footer className="app-footer">
            {/*<FooterContent/>*/}
        </footer>


    </>

export default Layout