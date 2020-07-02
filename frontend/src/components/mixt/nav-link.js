import React from 'react'



const NavLink = ({children}) => <button onClick={() => history.push({children})}/>


export default NavLink