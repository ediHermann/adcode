import React from 'react'
import cn from "classnames";
import {Field, Form, Formik} from "formik";
import validationSchema from "../register/validation";
import PropTypes from "prop-types";
import Title from "../mixt/Title";
import {Link} from "react-router-dom";
import ArrowButton from "../svg/ArrowButton";
import httpAgent from "./../common/init";



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


    const onSubmit = async (values) => {
        const payload={identifier:values.email,password:values.password};
        console.log(payload);
        const resp =  await httpAgent('login',payload);
        console.log(resp);
        if (resp.status === 400)
            alert('Login fail');
        else {
            // const outcome=await resp.json();
            const outcome=await resp;
            const token=outcome.jwt;
            const userData=outcome.user;
            console.log(token);
            localStorage.setItem('userToken',token);
            localStorage.setItem('isAuthenticated','1');
            localStorage.setItem('userData',JSON.stringify(userData));
            alert('login successful');
            window.location.href = '/';

        }
        return false

    };

    return <Formik initialValues={initialValues}
          //validationSchema={validationSchema}

                   onSubmit= {onSubmit}

        >
        {
            ({
                 errors,
                 touched,
                 handleSubmit,
                 isSubmitting,
                 values
             }) =>
                <Form onSubmit={handleSubmit}
                      className='bg-primary border-2 rounded-window window-size '>

                    <div className='flex text-center justify-center w-full my-4 sm:my-4 lg:my-8 xl:my-8'>
                        <Title>AUTENTIFICARE</Title>
                    </div>

                    <div className='bg-secondary m-2 bottom-rounded-window'>
                        <div className='mx-16 pt-10'>
                            <label
                                htmlFor='email'
                                className='text-white text-xs pt-4'>Username or Email</label>
                            <Field
                                id='email'
                                type="text"
                                name="email"
                                placeholder="Username"
                                value={values.email}
                                className={inputStyle(errors.email && touched.email && "error")}/>
                            {errors.email && touched.email && (
                                <div className="text-xs text-red-600 mt-1 font-6">{errors.email}</div>
                            )}

                            <label htmlFor='password'
                                   className='text-white text-xs'>Password</label>
                            <Field
                                id='password'
                                type="password"
                                name="password"
                                placeholder="Parola"
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