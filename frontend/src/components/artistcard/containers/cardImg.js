import React from 'react'


const CardImg=  ({ children, className, name}) => (
    <div className={'flex justify-end '} id={name}>
        <div className={`flex ${className}`}>


            {children}



        </div>
    </div>
);

export default CardImg