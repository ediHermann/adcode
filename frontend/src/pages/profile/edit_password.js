import React from "react";
import httpAgent from "../../components/common/init";
import PropTypes from 'prop-types'
import {ErrorMessage, Field, Form, Formik,FieldArray} from 'formik'
import GlobalError from "../../components/register/global-error";
import cn from "classnames";



const EditPassword = () => {


    const userDataStr=localStorage.getItem('userData');
    let userData;

    if(userDataStr)
    {
        userData=JSON.parse(userDataStr);

    }


    const inputStyle = cond => cn(
        "w-full rounded p-2 ", {
            "border-2 border-error": cond,
            'border-gray-800 border rounded  border-secondary mb-1': !cond
        });

    const onSubmit = async (values, {setSubmitting}) => {
        setSubmitting(true);
        setGlobalError('');
        if (values.password != values.password_c) {
            setGlobalError("Parolele nu coincid");
            return;
        }
        /**************************************************************************/
        //STEP 1: Check old password
        /**************************************************************************/
        let pwdCheck=false;
        let val = {chkPassword: values.password_o};
        console.log(val);
        let strValues = JSON.stringify(val);
        let unquoted = strValues.replace(/"([^"]+)":/g, '$1:');
        let payload1 = `query={checkPwd(data:${unquoted})}`;


        console.log(payload1);
        let result = await httpAgent(payload1);
        console.log(result);
        let resultData ;

        if (result.status == 200)
        {
            try {
                resultData = await result.json();
            } catch (err) {
                resultData = result;
            }
            console.log(resultData);
            pwdCheck=resultData.data.checkPwd.success;
            console.log(pwdCheck);
            if(!pwdCheck)
            {
                setGlobalError(resultData.data.checkPwd.error.message);
                return;
            }

        }
        else
        {
            setGlobalError('Validare parola esuata');
            return;
        }

        /**************************************************************************/
        //STEP 2: Change  password
        /**************************************************************************/
        let pwdChanged=false;
        strValues = JSON.stringify(values);
        unquoted = strValues.replace(/"([^"]+)":/g, '$1:');
        payload1 = `query=mutation{changePwd(data:${unquoted})}`;
        result = await httpAgent(payload1);
        console.log(result);
        if (result.status == 200)
        {
            try {
                resultData = await result.json();
            } catch (err) {
                resultData = result;
            }
            console.log(resultData.data.changePwd);
           // console.log(resultData);
            pwdChanged=resultData.data.changePwd.success;
            if(!pwdChanged)
            {
                setGlobalError(resultData.data.changePwd.error.message);
                return;
            }

        }
        else
        {
            setGlobalError('Modificarea parolei a esuat');
            return;
        }
        alert('Parola a fost modificata.')

        setSubmitting(false)
        return false;

    };

    const [data, setData] = React.useState({});
    const [globalError, setGlobalError] = React.useState('');
    const initValues={password_o:'',password:'',password_c:''};

    return (
        <div className='max-w-screen-sm h-full self-center m-auto'>
               <Formik
                initialValues={initValues}
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

                            <label className='text-sm font-semibold'>Parola curenta</label>
                            <Field
                                type="password"
                                name="password_o"
                                placeholder="Introduceti parola curenta"
                                className={inputStyle(errors.password && touched.password)}/>
                            <ErrorMessage
                                name="password"
                                component="div"
                                className="text-sm text-error italic"/>


                            <label className='text-sm font-semibold'>Parola noua</label>
                            <Field
                                type="password"
                                name="password"
                                placeholder="Introduceti parola noua"
                                className={inputStyle(errors.password && touched.password)}/>
                            <ErrorMessage
                                name="password"
                                component="div"
                                className="text-sm text-error italic"/>


                            <Field
                                type="password"
                                name="password_c"
                                placeholder="Confirmare parola noua"
                                className={inputStyle(errors.confirmPassword && touched.confirmPassword)}/>
                            <ErrorMessage
                                name="password_c"
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

EditPassword.propTypes = {
    username: PropTypes.string,

};
export default EditPassword