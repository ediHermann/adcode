import React from 'react'

const Container =  ({ children, className}) => (
  <h1 className={`container px-16 mx-auto text-center 
     ${className}`}
  >
    {children}
  </h1>
)

export default Container