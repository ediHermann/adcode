import React, {Component} from "react";
import httpAgent from "../components/common/init";
import PropTypes from 'prop-types'
import {ErrorMessage, Field, Form, Formik,FieldArray} from 'formik'
import GlobalError from "../components/register/global-error";
import RegisterForm from "../components/register/register-form";
import cn from "classnames";

let data = [];
const payload = "query={userProfile}";
const Profile = () =>{


    const inputStyle = cond => cn(
        "w-full rounded p-2 ", {
            "border-2 border-error": cond,
            'border-2 border-secondary mb-2': !cond
        });


    const onSubmit = async (values, {setSubmitting, resetForm}) => {
        console.log(values);
        //return;
        setSubmitting(true);
        try {
            console.log('Fetching...');
            const outcome = await  httpAgent('update{rofile', values);
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

    let initialValues = {
        username: '',
    };
    const [data, setData] = React.useState({});
    const [globalError, setGlobalError] = React.useState('');

    const retrieveData = async () => {
        const response = await httpAgent(payload);
        if (response.status === 200) {
            const json = await response.json();
            console.log(json);
            let _data;
            if(json.data.userProfile)
                _data = json.data.userProfile.payload;
            console.log(_data);
            setData(_data)
        } else {
            //Display the error
            console.log(response);
        }

    }
    React.useEffect(() => {
        retrieveData()
    }, [])

return (<div className='absolute w-full h-full'>
        <div className='flex justify-center uppercase mt-40 text-2xl md:text-5xl font-bold '>Profilul meu</div>
        <Formik initialValues={initialValues}
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
                <div>
                    <button className='absolute bg-primary px-16 py-4 mt-20 rounded-md text-text'
                            style={{left: '50%', marginLeft: '-90px'}}
                            type='submit' disabled={isSubmitting}>Submit
                    </button>
                </div>
            </Form>

    }
        </Formik>
      </div>);
};

Profile.propTypes = {
    username: PropTypes.string,

};
export default Profile