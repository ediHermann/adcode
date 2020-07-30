import React from 'react'
import PropTypes from 'prop-types'
import {ErrorMessage, Field, Form, Formik, FieldArray} from 'formik'
import cn from 'classnames'
import GlobalError from './global-error'
import validationSchema from './validation'
import RadioGroup from "./../buttons/radioGroup";
import fetchDog from "./../common/init.js";


const Talent_types = [
    {id: "1", name: "Voce"},
    {id: "2", name: "Fata"},

];

const Broadcast_types = [
    {id: "1", name: "Radio"},
    {id: "2", name: "TV"},
    {id: "3", name: "Internet"},
    {id: "4", name: "Cinema"},

];


const RegisterForm = () => {


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
        talent_types: [],
        broadcast_types: [],

    };

    const inputStyle = cond => cn(
        "w-full rounded p-2 ", {
            "border-2 border-error": cond,
            'border-2 border-secondary mb-2': !cond
        });


    const FORM_TYPES = ['Persoană fizică', 'Persoană juridică'];
    const [formType, setFormType] = React.useState(0);
    const [globalError, setGlobalError] = React.useState('');
    const onSubmit = async (values, {setSubmitting, resetForm}) => {
        console.log(values);
        //return;
        setSubmitting(true);
        try {
            console.log('Fetching...');
            const outcome = await fetchDog.execute('registration', values);
            console.log(outcome);
            if (!outcome.success) setGlobalError(outcome.error.message);
            else {
                resetForm();
                alert('Message sent successfully.')
            }
        } catch (err) {
            console.log(err);
            setGlobalError(err.message);
        }
        setSubmitting(false)
        return false;

    };


    return <Formik
        initialValues={initialValues}
        //validationSchema={validationSchema}
        onSubmit={onSubmit}
    >

        {
            ({
                 values,
                 errors,
                 touched,
                 handleSubmit,
                 isSubmitting
             }) =>
                <Form onSubmit={handleSubmit}>
                    <GlobalError message={globalError}/>
                    <RadioGroup labels={FORM_TYPES} selected={formType} setSelected={setFormType}/>
                    {formType === 0
                        ? <>
                            <label className='text-text text-sm'>Nume</label>
                            <Field
                                type="text"
                                name="username"
                                placeholder="Numele"
                                className={inputStyle(errors.name && touched.name)}/>
                            <ErrorMessage
                                name="username"
                                component="div"
                                className="text-sm text-error italic"/>

                            {/*<label className='text-text text-sm'>CNP</label>*/}
                            {/*<Field*/}
                            {/*    type="text"*/}
                            {/*    name="cnp"*/}
                            {/*    placeholder="CNP"*/}
                            {/*    className={inputStyle(errors.cnp && touched.cnp)}/>*/}
                            {/*<ErrorMessage*/}
                            {/*    name="cnp"*/}
                            {/*    component="div"*/}
                            {/*    className="text-sm text-error italic"/>*/}
                        </>
                        : <>
                            <label className='text-text text-sm'>Numele Companiei</label>
                            <Field
                                type="text"
                                name="companyName"
                                placeholder="Numele companiei"
                                className={inputStyle(errors.companyName && touched.companyName)}/>
                            <ErrorMessage
                                name="companyName"
                                component="div"
                                className="text-sm text-error italic"/>

                            {/*<label className='text-text text-sm'>CUI</label>*/}
                            {/*<Field*/}
                            {/*    type="text"*/}
                            {/*    name="cui"*/}
                            {/*    placeholder="CUI"*/}
                            {/*    className={inputStyle(errors.cui && touched.cui)}/>*/}
                            {/*<ErrorMessage*/}
                            {/*    name="cui"*/}
                            {/*    component="div"*/}
                            {/*    className="text-sm text-error italic"/>*/}

                            <label className='text-text text-sm'>Persoana de Contact</label>
                            <Field
                                type="text"
                                name="contact_name"
                                placeholder="Persoana de contact"
                                className={inputStyle(errors.contact && touched.contact)}/>
                            <ErrorMessage
                                name="contact"
                                component="div"
                                className=" text-sm text-error italic"/>
                        </>
                    }
                    <label className='text-text text-sm'>Adresa</label>
                    <Field
                        type="text"
                        name="address"
                        placeholder="Adresa"
                        className={inputStyle(errors.address && touched.address)}/>
                    <ErrorMessage
                        name="address"
                        component="div"
                        className=" text-sm text-error italic"/>
                    <label className='text-text text-sm'>Telefon</label>
                    <Field
                        type="text"
                        name="phone"
                        placeholder="Telefon"
                        className={inputStyle(errors.phone && touched.phone)}/>
                    <ErrorMessage
                        name="phone"
                        component="div"
                        className="text-sm text-error italic"/>
                    <label className='text-text text-sm'>Email</label>
                    <Field
                        type="text"
                        name="email"
                        placeholder="Email"
                        className={inputStyle(errors.email && touched.email)}/>

                    <ErrorMessage
                        name="email"
                        component="div"
                        className="text-sm text-error italic"/>


                    <label className='text-text text-sm'>Parola</label>
                    <Field
                        type="password"
                        name="password"
                        placeholder="Parola"
                        className={inputStyle(errors.password && touched.password)}/>
                    <ErrorMessage
                        name="password"
                        component="div"
                        className="text-sm text-error italic"/>
                    <label className='text-text text-sm'>Confirmare Parola</label>
                    <Field
                        type="password"
                        name="confirmPassword"
                        placeholder="Confirmare parola"
                        className={inputStyle(errors.confirmPassword && touched.confirmPassword)}/>
                    <ErrorMessage
                        name="confirmPassword"
                        component="div"
                        className="text-sm text-error italic"/>


                    <label className='text-text text-sm'>Tipul talentului</label><br/>
                    <FieldArray
                        name="talent_types"
                        render={arrayHelpers => (
                            <div>
                                {Talent_types.map(category => (
                                    <div key={category.id}>
                                        <label className='text-text text-sm'>
                                            <input
                                                name="categoryIds"
                                                type="checkbox"
                                                value={category.id}
                                                checked={values.talent_types.find(o => o.id === category.id)}
                                                onChange={e => {
                                                    if (e.target.checked) arrayHelpers.push({id: category.id});
                                                    else {
                                                        let obj = values.talent_types.find(o => o.id === category.id);
                                                        let idx = values.talent_types.indexOf(obj);
                                                        arrayHelpers.remove(idx);
                                                    }
                                                }}
                                            />{" "}
                                            {category.name}
                                        </label>
                                    </div>
                                ))}
                            </div>
                        )}
                    />


                    <label className='text-text text-sm'>Canale difuzare</label><br/>
                    <FieldArray
                        name="broadcast_types"
                        render={arrayHelpers => (
                            <div>
                                {Broadcast_types.map(category => (
                                    <div key={category.id}>
                                        <label className='text-text text-sm'>
                                            <input
                                                name="categoryID"
                                                type="checkbox"
                                                value={category.id}
                                                checked={values.broadcast_types.find(o => o.id === category.id)}
                                                onChange={e => {
                                                    if (e.target.checked) arrayHelpers.push({id: category.id});
                                                    else {
                                                        let obj = values.broadcast_types.find(o => o.id === category.id);
                                                        let idx = values.broadcast_types.indexOf(obj);
                                                        arrayHelpers.remove(idx);
                                                    }
                                                }}
                                            />
                                            {" "}
                                            {category.name}
                                        </label>
                                    </div>
                                ))}
                            </div>
                        )}
                    />


                    <div>
                        <button className='absolute bg-primary px-16 py-4 mt-20 rounded-md text-text'
                                style={{left: '50%', marginLeft: '-90px'}}
                                type='submit' disabled={isSubmitting}>Submit
                        </button>
                    </div>

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
    talent_types: PropTypes.array,
    broadcast_types: PropTypes.array,

};

export default RegisterForm