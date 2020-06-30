import React from 'react'
import PropTypes from 'prop-types'
import cn from 'classnames'

const GlobalError = ({message, classCont, classErr, classClear}) => message
    ? <div style={{
        whiteSpace: 'nowrap',
        maxHeight: '3.5em'
    }}
        className={cn(classCont, {[classErr]: message, [classClear]: !message})}>
        Error: {message}
    </div>
    : ''

GlobalError.defaultProps = {
    classCont: 'p-4 mb-2 h-max overflow-scroll',
    classClear: 'bg-transparent border-transparent',
    classErr: 'bg-error text-white'
}

GlobalError.propTypes = {
    message: PropTypes.string,
    classCont: PropTypes.string,
    classClear: PropTypes.string,
    classErr: PropTypes.string
}

export default GlobalError