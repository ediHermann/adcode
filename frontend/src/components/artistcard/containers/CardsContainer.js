import React from 'react'

const CardsContainer =  ({ children, className}) => (
    <h1 className={`flex flex-col px-3 sm:flex-row sm:-mx-3 mt-12  ${className}`}
    >
        {children}
    </h1>
)

export default CardsContainer