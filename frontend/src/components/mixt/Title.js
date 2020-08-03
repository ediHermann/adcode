import React from 'react'

const Title =  ({ children, className}) => (
    <div className={`text-2xl lg:text-3xl xl:text-4xl font-bold leading-none uppercase
     ${className}`}>
      {children}
    </div>
)

export default Title