import React from 'react'


const CardImg=  ({ children, className}) => (
    <div className={'flex justify-end '}>
        <div className={`flex ${className}`}>
            {children}
        </div>
    </div>
);

export default CardImg