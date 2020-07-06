import React from 'react'

const Title =  ({ children, className}) => (
    <div className={`text-xl lg:text-xl xl:text-2xl font-bold leading-none uppercase text-text
     ${className}`}
    >
      {children}
    </div>
)

export default Title