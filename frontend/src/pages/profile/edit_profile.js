import React from "react";
import httpAgent from "../../components/common/init";
import PropTypes from 'prop-types'
import {ErrorMessage, Field, Form, Formik,FieldArray} from 'formik'
import GlobalError from "../../components/register/global-error";
import cn from "classnames";




const EditProfile = () => {
    const inputStyle = cond => cn(
        "w-full rounded p-2 ", {
            "border-2 border-error": cond,
            'border-gray-800 border rounded  border-secondary mb-1': !cond
        });

    const onSubmit = async (values, {setSubmitting}) => {

        //return;
        setSubmitting(true);
        try {

            let strValues=JSON.stringify(values);
            const unquoted = strValues.replace(/"([^"]+)":/g, '$1:');
            const payload1 = `query=mutation{updateProfile(data:${unquoted})}`;
            //const payload1 = `query=mutation{updateProfile(data:{username:\"Studio 1\",email:\"new@gmail.ro\"})}`;
            console.log(payload1);
            const outcome = await  httpAgent(payload1);
            if (outcome.status==200) {
                alert('Datele au fost salvate')
                console.log(outcome);
            }
            else {
                alert('Eroare- Datele nu au fost salvate')
                console.log(outcome);
            }
        } catch (err) {
            console.log(err);
            setGlobalError(err.message);
        }
        setSubmitting(false)
        return false;

    };

    const [data, setData] = React.useState({});
    const [globalError, setGlobalError] = React.useState('');

    const retrieveData = async () => {
        const payload = "query={userProfile}";
        const response = await httpAgent(payload);
        if (response.status === 200) {
            const json = await response.json();
            //console.log(json);
            let _data;
            if(json.data.userProfile)
                _data = json.data.userProfile.payload;
            // console.log(_data);
            const formData={username:_data.username, email:_data.email,phone:_data.phone,address:_data.address,contact_name:_data.contact_name};
            setData(formData);
            // console.log(formData);
        } else {
            //Display the error
            console.log(response);
        }

    }
    React.useEffect(() => {
        retrieveData();
    }, [])

    return (
        <div className='max-w-screen-sm h-full self-center m-auto'>
             <Formik
                enableReinitialize={true}
                initialValues={data}
                onSubmit={onSubmit}
            >
                {
                    ({
                         errors,
                         touched,
                         handleSubmit,
                         isSubmitting,
                         setFieldValue
                     }) =>
                        <Form onSubmit={handleSubmit}>
                            <GlobalError message={globalError}/>
                            <label className="font-semibold"> {data.username}</label>

                            <Field
                                type="text"
                                name="contact_name"
                                placeholder="Persoana de contact"
                                className={inputStyle(errors.contact_name && touched.contact_name)}/>
                            <ErrorMessage
                                name="contact_name"
                                component="div"
                                className="text-sm text-error italic"/>

                            <Field
                                type="text"
                                name="email"
                                placeholder="Email"
                                className={inputStyle(errors.email && touched.email)}/>
                            <ErrorMessage
                                name="email"
                                component="div"
                                className="text-sm text-error italic"/>
                            <Field
                                type="text"
                                name="phone"
                                placeholder="Telefon"
                                className={inputStyle(errors.phone && touched.phone)}/>
                            <ErrorMessage
                                name="phone"
                                component="div"
                                className="text-sm text-error italic"/>

                            <Field
                                type="text"
                                as="textarea"
                                name="address"
                                placeholder="Adresa"
                                className={inputStyle(errors.address && touched.address)}/>
                            <ErrorMessage
                                name="address"
                                component="div"
                                className="text-sm text-error italic"/>

                            <div>
                                <button className='absolute bg-primary px-16 py-4 mt-20 rounded-md text-text'
                                        style={{left: '50%', marginLeft: '-90px'}}
                                        type='submit' disabled={isSubmitting}>Salveaza
                                </button>
                            </div>
                        </Form>

                }
            </Formik>
        </div>
    )
}

EditProfile.propTypes = {
    username: PropTypes.string,

};
export default EditProfile