import React from 'react'

const WindowClose = ({close}) =>
    <div className="hover:text-white"
         onClick={close}>
        <svg className="w-4 h-4 fill-current"
             xmlns="http://www.w3.org/2000/svg"
             viewBox="0 0 20 20">
            <path
                d="M12.12 10l6.71-6.71c.59-.59.59-1.54 0-2.12a1.49 1.49 0 00-2.12 0L10 7.88 3.29 1.17a1.49 1.49 0 00-2.12 0 1.49 1.49 0 000 2.12L7.88 10l-6.71 6.71a1.49 1.49 0 000 2.12c.29.29.68.44 1.06.44s.77-.15 1.06-.44L10 12.12l6.71 6.71c.29.29.68.44 1.06.44s.77-.15 1.06-.44c.59-.59.59-1.54 0-2.12L12.12 10z"/>
        </svg>
    </div>

export default WindowClose