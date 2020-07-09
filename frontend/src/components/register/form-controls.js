import React from 'react'
import PropTypes from 'prop-types'
import SubmitButton from './submit-button'
import Recaptcha from 'react-google-recaptcha'

const FormControls = ({isSubmitting}) =>
    <div className=" w-full md:flex md:justify-between md:items-center">
        <div className="w-full transform origin-left scale-75 md:scale-100 mx-auto md:m-0 md:scale-100 z-0">

        </div>
        <SubmitButton disabled={isSubmitting}/>
    </div>

FormControls.propTypes = {
    isSubmitting: PropTypes.bool.isRequired,

}

export default FormControls