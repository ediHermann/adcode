import React from 'react'
import PropTypes from 'prop-types'
import SVG from 'react-inlinesvg'


const svgArrow = `
    <svg xmlns="http://www.w3.org/2000/svg" enable-background="new 0 0 20 20" height="36" viewBox="0 0 24 24" width="36">
       <g>
        <rect fill="none" height="24" width="24"/>
        <path d="M12,4c4.41,0,8,3.59,8,8s-3.59,8-8,8s-8-3.59-8-8S7.59,4,12,4 M12,2C6.48,2,2,6.48,2,12c0,5.52,4.48,10,10,10 c5.52,0,10-4.48,10-10C22,6.48,17.52,2,12,2L12,2z M13,12l0-4h-2l0,4H8l4,4l4-4H13z"/>
       </g>
    </svg>
`

const LoginArrow = ({className}) => <SVG src={svgArrow} className={className}/>


LoginArrow.propTypes = {
    className: PropTypes.string
}
export default LoginArrow