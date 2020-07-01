import React from 'react'
import PropTypes from 'prop-types'
import {ErrorMessage, Field, Form, Formik} from 'formik'
import cn from 'classnames'
import GlobalError from './global-error'
import validationSchema from './validation'
import ArrowButton from "../svg/ArrowButton";


const ContactForm = ({sendMessage}) => {

    const initialValues = {
        name: '',
        email: '',
        message: ''
    }

    const inputStyle = cond => cn(
        "w-full rounded-lg pl-2", {
            "border-2 border-error": cond,
            'border-2 border-secondary mb-3': !cond
        })

    const [globalError, setGlobalError] = React.useState('')

    const onSubmit = async (values, {setSubmitting, resetForm}) => {
        const payload = {...values}
        setSubmitting(true)
        try {
            const outcome = await sendMessage(payload)
            console.log('outcome ', outcome)
            if (outcome) setGlobalError(outcome)
            else {
                resetForm()
                alert('Message sent successfully.')
            }
        } catch (err) {
            setGlobalError(err.message)
        }
        setSubmitting(false)
    }

    return <Formik initialValues={initialValues}
                   validationSchema={validationSchema}
                   onSubmit={onSubmit}>
        {
            ({
                 errors,
                 touched,
                 handleSubmit,
                 isSubmitting
             }) =>
                <Form onSubmit={handleSubmit}>
                    <GlobalError message={globalError}/>
                    <div className='flex'>
                        <div className='block'>
                            <label className='text-text text-sm'>Nume</label>
                            <Field
                                type="text"
                                name="name"
                                placeholder="Name"
                                className={inputStyle(errors.name && touched.name)}/>
                            <ErrorMessage
                                name="name"
                                component="div"
                                className="mb-2 text-sm text-red-600 text-error italic"/>
                        </div>
                        <div className='block'>
                            <label className='text-text text-sm'>Email</label>
                            <Field
                                type="email"
                                name="email"
                                placeholder="Email"
                                className={inputStyle(errors.email && touched.email)}/>
                            <ErrorMessage
                                name="email"
                                component="div"
                                className="mb-2 text-sm text-red-600 text-error italic"/>
                        </div>
                    </div>
                    <label className='text-text text-sm'>Message</label>
                    <Field as="textarea"
                           className={inputStyle(errors.message && touched.message)}
                           name="message"
                           placeholder="Scrie un mesaj"
                           rows="4"/>
                    <ErrorMessage
                        name="message"
                        component="div"
                        className="mb-4 text-sm text-red-600 text-error italic"/>

                    <div className='flex justify-end pt-2'>
                        <ArrowButton
                            className='flex transform -rotate-90 fill-white right-0 cursor-pointer'
                            onClick={() => isSubmitting}
                        />
                    </div>
                </Form>
        }
    </Formik>
}

ContactForm.propTypes = {
    sendMessage: PropTypes.func
}

export default ContactForm