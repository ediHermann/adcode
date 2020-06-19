import React from 'react'
import PropTypes from 'prop-types'
import SVG from 'react-inlinesvg'
import {LOGO_SVG} from '../../assets/config'

const Logo = ({className}) =>
    <SVG src={LOGO_SVG} className={className}/>

Logo.propTypes = {
    className: PropTypes.string
}

export default Logo