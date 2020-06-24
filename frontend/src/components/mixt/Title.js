import React from 'react'

const Title =  ({ children, className}) => (
    <div className={`text-xl lg:text-xl xl:text-2xl font-bold leading-none uppercase
     ${className}`}
    >
      {children}
    </div>
)

export default Title