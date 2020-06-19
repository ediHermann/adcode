import React from 'react'
import cn from "classnames";
import {ErrorMessage, Field, Form, Formik} from "formik";
import validationSchema from "../register/validation";
import GlobalError from "../register/global-error";
import PropTypes from "prop-types";


const LoginForm = ({sendMessages}) => {

    const initialValues = {
        username: '',
        password: ''
    }


    const inputStyle = cond => cn(
        "w-full rounded p-2", {
            "border-2 border-error": cond,
            'border-2 border-secondary mb-8': !cond
        });

    const [globalError, setGlobalError] = React.useState('');

    const onSubmit = async (values, {setSubmitting, resetForm}) => {

        const payload = {...values};
        setSubmitting(true);

        try {
            const outcome = await sendMessages(payload);
            if (outcome) setGlobalError(outcome);
            else {
                resetForm();
                alert('Message sent successfully.')
            }
        } catch (err) {
            setGlobalError(err.message)
        }
        setSubmitting(false)
    };

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
                    <label htmlFor='email'>Username or Email</label>
                    <Field
                        id='email'
                        type="text"
                        name="email"
                        placeholder="Email"
                        className={inputStyle(errors.email && touched.email && "error")}/>
                    {errors.email && touched.email && (
                        <div className="text-sm text-red-600 mt-1 font-8 mb-2">{errors.email}</div>
                    )}

                    <label htmlFor='password'>Password</label>
                    <Field
                        id='password'
                        type="password"
                        name="password"
                        placeholder="Parola"
                        className={inputStyle(errors.password && touched.password && "error")}/>
                    {errors.password && touched.password && (
                        <div className="text-sm text-red-600 mt-1 font-8 mb-4">{errors.password}</div>
                    )}
                    <div className='text-center'>
                        <button
                            type='submit'
                            disabled={isSubmitting}
                            className='px-20 py-2 rounded-lg bg-secondary text-white hover:cursor-pointer'>
                            Login
                        </button>
                    </div>
                    <div>

                    </div>

                </Form>


        }
    </Formik>
};

LoginForm.propTypes = {
    email: PropTypes.string,
    password: PropTypes.string
}


export default LoginForm