import React from "react";
import httpAgent from "../../components/common/init";
import { Form, Formik} from 'formik'
import GlobalError from "../../components/register/global-error";
import ProfileAvatar from "./avatar";

const EditAvatar = () => {

    const onSubmit = async (values, {setSubmitting}) => {
        setSubmitting(true);
        try {
             console.log(values.avatar);

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
                alert('Eroare \n '+ outcome.statusText)
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
                let _data;
                if(json.data.userProfile)
                    _data = json.data.userProfile.payload;
                const formData={avatar:_data.avatar};
                setData(formData);
            } else {
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
                            type='submit' disabled={isSubmitting}>Salveaza
                    </button>
                </div>
            </Form>

    }
        </Formik>
      </div>
)
};
export default EditAvatar