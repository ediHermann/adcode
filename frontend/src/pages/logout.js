import React from 'react'

const LogOut = () => {
    localStorage.setItem('isAuthenticated', '0');
    localStorage.setItem('userToken', '');
    localStorage.setItem('userData', '');
    window.location.href = '/';
return(<div>LogOut</div>

)}
export default LogOut