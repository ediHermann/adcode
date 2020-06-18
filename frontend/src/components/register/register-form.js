import React from 'react'
import PropTypes from 'prop-types'
import {ErrorMessage, Field, Form, Formik} from 'formik'
import cn from 'classnames'
import GlobalError from './global-error'
import validationSchema from './validation'
import RadioGroup from "../buttons/radioGroup";



const RegisterForm = ({sendMessage}) => {


    const initialValues = {
        name: '',
        companyName: '',
        contact: '',
        cui: '',
        address: '',
        phone: '',
        email: '',
        password: '',
        confirmPassword: '',
    };

    const inputStyle = cond => cn(
        "w-full rounded p-2", {
            "border-2 border-error": cond,
            'border-2 border-secondary mb-8': !cond
        });

    function ActionClick() {
        // POST request using fetch with error handling
        const requestOptions = {
            method: 'POST',
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify({
                username: "Studio 3",
                password: "blabladvvv",
                email: "studio3@gmail.com",
                cui: "RO190273637492807",
                address: "Unirii 2",
                phone: "0741300014"
            })
        };
        fetch('http://localhost:1337/users', requestOptions)
            .then(async response => {
                const data = await response.json();

                // check for error response
                if (!response.ok) {
                    // get error message from body or default to response status
                    const error = (data && data.message) || response.status;
                    alert(error[0].messages[0].message);
                    return Promise.reject(error);

                }

                // this.setState({ postId: data.id })
            })
            .catch(error => {
                // this.setState({ errorMessage: error.toString() });
                console.error('There was an error!', error);
            });
    }

    const FORM_TYPES = ['Persoana juridica', 'Persoana fizica'];

    const [formType, setFormType] = React.useState(0);
    const [globalError, setGlobalError] = React.useState('');

    const onSubmit = async (values, {setSubmitting, resetForm}) => {
        const payload = {...values};
        setSubmitting(true);
        try {
            const outcome = await sendMessage(payload);
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

             }) =>
                <Form onSubmit={handleSubmit}>
                    <GlobalError message={globalError}/>
                    <RadioGroup labels={FORM_TYPES} selected={formType} setSelected={setFormType}/>
                    {formType === 0
                        ? <>
                            <Field
                                type="text"
                                name="cnp"
                                placeholder="CNP"
                                className={inputStyle(errors.cnp && touched.cnp)}/>
                            <ErrorMessage
                                name="cnp"
                                component="div"
                                className="mb-6 text-sm text-error italic"/>
                            <Field
                                type="text"
                                name="name"
                                placeholder="Numele"
                                className={inputStyle(errors.name && touched.name)}/>
                            <ErrorMessage
                                name="name"
                                component="div"
                                className="mb-6 text-sm text-error italic"/>
                        </>
                        : <>
                            <Field
                                type="text"
                                name="cui"
                                placeholder="CUI"
                                className={inputStyle(errors.cui && touched.cui)}/>
                            <ErrorMessage
                                name="cui"
                                component="div"
                                className="mb-6 text-sm text-error italic"/>
                            <Field
                                type="text"
                                name="companyName"
                                placeholder="Numele companiei"
                                className={inputStyle(errors.companyName && touched.companyName)}/>
                            <ErrorMessage
                                name="companyName"
                                component="div"
                                className="mb-6 text-sm text-error italic"/>
                            <Field
                                type="text"
                                name="contact"
                                placeholder="Persoana de contact"
                                className={inputStyle(errors.contact && touched.contact)}/>
                            <ErrorMessage
                                name="contact"
                                component="div"
                                className="mb-6 text-sm text-error italic"/>
                        </>
                    }
                    <Field
                        type="address"
                        name="address"
                        placeholder="Adresa"
                        className={inputStyle(errors.address && touched.address)}/>
                    <ErrorMessage
                        name="address"
                        component="div"
                        className="mb-6 text-sm text-error italic"/>

                    <Field
                        type="phone"
                        name="phone"
                        placeholder="Telefon"
                        className={inputStyle(errors.phone && touched.phone)}/>
                    <ErrorMessage
                        name="phone"
                        component="div"
                        className="mb-6 text-sm text-error italic"/>

                    <Field
                        type="email"
                        name="email"
                        placeholder="Email"
                        className={inputStyle(errors.email && touched.email)}/>
                    <ErrorMessage
                        name="email"
                        component="div"
                        className="mb-6 text-sm text-error italic"/>

                    <Field
                        type="password"
                        name="password"
                        placeholder="Parola"
                        className={inputStyle(errors.password && touched.password)}/>
                    <ErrorMessage
                        name="password"
                        component="div"
                        className="mb-6 text-sm text-error italic"/>

                    <Field
                        type="password"
                        name="confirmPassword"
                        placeholder="Confirmare parola"
                        className={inputStyle(errors.confirmPassword && touched.confirmPassword)}/>
                    <ErrorMessage
                        name="confirmPassword"
                        component="div"
                        className="mb-6 text-sm text-error italic"/>

                    <button type='button' onClick={ActionClick}>Submit</button>

                </Form>

        }
    </Formik>
};

RegisterForm.propTypes = {
    name: PropTypes.string,
    cnp: PropTypes.string,
    cui: PropTypes.string,
    contact: PropTypes.string,
    companyName: PropTypes.string,
    address: PropTypes.string,
    phone: PropTypes.string,
    email: PropTypes.string,
    password: PropTypes.string,
    confirmPassword: PropTypes.string,


};

export default RegisterForm