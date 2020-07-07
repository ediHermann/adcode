import React from 'react'
import LoginForm from "../components/login";
import RightMenu from "../components/menu-right";


const Login = () =>
    <div className='absolute '
    style={{top: '50%' ,marginTop: ' -200px', left: '50%', marginLeft: '-170px' }}>
                <LoginForm/>
        <RightMenu/>
    </div>


export default Login