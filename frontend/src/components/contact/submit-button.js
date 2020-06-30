import React from 'react'
import PropTypes from 'prop-types'
import cn from 'classnames'

const SubmitButton = ({disabled, classCont, classDisabled}) =>
    <button
        type="submit"
        disabled={disabled}
        className={cn(classCont, {[classDisabled]: disabled})}>
        Submit
    </button>

SubmitButton.defaultProps = {
    classCont: 'w-full md:w-1/5 h-16 mt-8 px-6 my-2 md:px-10 md:my-0 text-white rounded bg-secondary hover:bg-secondary-light',
    classDisabled: 'opacity-50 cursor-not-allowed'
}

SubmitButton.propTypes = {
    disabled: PropTypes.bool,
    classCont: PropTypes.string,
    classDisabled: PropTypes.string,
}

export default SubmitButton