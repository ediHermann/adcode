import React from "react";
import httpAgent from "../../components/common/init";
import PropTypes from 'prop-types'
import {ErrorMessage, Field, Form, Formik,FieldArray} from 'formik'
import GlobalError from "../../components/register/global-error";
import cn from "classnames";
import ProfileAvatar from "../../components/profile/avatar";

const EditAvatar = () => {
    const inputStyle = cond => cn(
        "w-full rounded p-2 ", {
            "border-2 border-error": cond,
            'border-gray-800 border rounded  border-secondary mb-1': !cond
        });

    const onSubmit = async (values, {setSubmitting}) => {

        //return;
        setSubmitting(true);
        try {
             console.log(values.avatar);
             //return;
             //console.log(ProfileAvatar);

            let strValues=JSON.stringify(values);
            const unquoted = strValues.replace(/"([^"]+)":/g, '$1:');
            const payload1 = `query=mutation{updateProfile(data:${unquoted})}`;
            console.log(payload1);
            const outcome = await  httpAgent(payload1);
            if (outcome.status==200) {
                alert('Avatarul a fost salvat')
                console.log(outcome);
            }
            else {
                alert('Eroare- Imaginea nu a fost salvata')
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
            const formData={avatar:_data.avatar};
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
        <div className='flex justify-center uppercase mt-40 text-2xl md:text-5xl font-bold '>Editare Avatar</div>
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
                <ProfileAvatar
                    pic={'data:image/png;base64,'+data.avatar}
                    name={'avatar'}
                    setFValue={setFieldValue}

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
      </div>
)
};
export default EditAvatar