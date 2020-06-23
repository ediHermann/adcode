import React from 'react'
import PropTypes from 'prop-types'

const MenuToggle  = ({opened, className}) =>
    <svg className={className} viewBox="0 0 23 23">
        {opened
            ? <path d="M18.278 16.864a1 1 0 0 1-1.414 1.414l-4.829-4.828-4.828 4.828a1 1 0 0 1-1.414-1.414l4.828-4.829-4.828-4.828a1 1 0 0 1 1.414-1.414l4.829 4.828 4.828-4.828a1 1 0 1 1 1.414 1.414l-4.828 4.829 4.828 4.828z"/>
            : <path d="M4 5h16a1 1 0 0 1 0 2H4a1 1 0 1 1 0-2zm0 6h16a1 1 0 0 1 0 2H4a1 1 0 0 1 0-2zm0 6h16a1 1 0 0 1 0 2H4a1 1 0 0 1 0-2z"/>
        }
    </svg>

MenuToggle.defaultProps = {
    opened: false
}

MenuToggle.propTypes = {
    opened: PropTypes.bool,
    className: PropTypes.string
}

export default MenuToggle