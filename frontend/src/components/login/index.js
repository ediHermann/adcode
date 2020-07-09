import React from 'react'
import cn from "classnames";
import {Field, Form, Formik} from "formik";
import validationSchema from "../register/validation";
import GlobalError from "../register/global-error";
import PropTypes from "prop-types";
import Title from "../mixt/Title";
import {Link} from "react-router-dom";
import ArrowButton from "../svg/ArrowButton";


const LoginForm = () => {

    const initialValues = {
        email: '',
        password: ''
    }


    const inputStyle = cond => cn(
        "w-full rounded mr-2 pl-2", {
            "border-2 border-error": cond,
            'border-2 border-secondary mb-5': !cond
        });

    //const [globalError, setGlobalError] = React.useState('');

    // const onSubmit = async (values, {setSubmitting, resetForm}) => {
    //
    //     const payload = {...values};
    //     setSubmitting(true);
    //
    //     try {
    //         const outcome = await sendMessages(payload);
    //         if (outcome) setGlobalError(outcome);
    //         else {
    //             resetForm();
    //             alert('Message sent successfully.')
    //         }
    //     } catch (err) {
    //         setGlobalError(err.message)
    //     }
    //     setSubmitting(false)
    // };

    return <Formik initialValues={initialValues}
          //validationSchema={validationSchema}
                   onSubmit={(values, {setSubmitting}) => {
                       setTimeout(() => {
                           alert(JSON.stringify(values, null, 2));
                           setSubmitting(false);
                       }, 400);
                   }}
    >
        {
            ({
                 errors,
                 touched,
                 handleSubmit,
                 isSubmitting,
                 handleChange,
                 handleBlur,
                 values
             }) =>
                <Form onSubmit={handleSubmit}
                      className='bg-primary border-2 rounded-window window-size '>

                    <div className='flex text-center justify-center w-full my-4 sm:my-4 lg:my-8 xl:my-8'>
                        <Title>AUTENTIFICARE</Title>
                    </div>

                    <div className='bg-secondary m-2 bottom-rounded-window'>
                        <div className='mx-16 pt-10'>
                            {/*<GlobalError message={globalError}/>*/}
                            <label
                                htmlFor='email'
                                className='text-white text-xs pt-4'>Username or Email</label>
                            <input
                                id='email'
                                type="text"
                                name="email"
                                placeholder="Email"
                                onChange={handleChange}
                                onBlur={handleBlur}
                                value={values.email}
                                className={inputStyle(errors.email && touched.email && "error")}/>
                            {errors.email && touched.email && (
                                <div className="text-xs text-red-600 mt-1 font-6">{errors.email}</div>
                            )}

                            <label htmlFor='password'
                                   className='text-white text-xs'>Password</label>
                            <input
                                id='password'
                                type="password"
                                name="password"
                                placeholder="Parola"
                                onChange={handleChange}
                                onBlur={handleBlur}
                                value={values.password}
                                className={inputStyle(errors.password && touched.password && "error")}/>
                            {errors.password && touched.password && (
                                <div className="text-xs text-red-600 mt-1 font-6">{errors.password}</div>
                            )}

                            <div className='flex justify-end pt-2'>
                                <button>
                                    <ArrowButton
                                        type='submit'
                                        className='flex transform -rotate-90 fill-white right-0 cursor-pointer'
                                        disabled={isSubmitting}
                                    />
                                </button>
                            </div>
                        </div>


                        <div className='flex inline-flex text-white text-xs mt-6 mb-4 mx-2'>
                            <div className='mr-10 ml-4 '>
                                <input type='checkbox' id='check'/>
                                <label htmlFor='check' className='cursor-pointer'>Retine datele de acces</label>
                            </div>
                            <div className='flex cursor-pointer'>
                                <Link to={'#recuperare'}>Recuperare parola</Link>
                            </div>
                        </div>

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