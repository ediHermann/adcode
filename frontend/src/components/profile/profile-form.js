import React from 'react'
import {Form, Formik} from "formik";


const ProfileForm = () => {

    const initialValues = {
        avatar: '',
        name: '',
        cnp: '',
        cui: '',
        address: '',
        phone: '',
        email: '',
        talent_types: '',
        media_types: '',
        broadcast_types: ''
    }

    return <Formik
        initialValues={initialValues}
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
                 values,
                 errors,
                 touched,
                 handleSubmit,
                 isSubmitting
             }) => <Form onSubmit={handleSubmit}>


            </Form>
        }
    </Formik>

}

export default ProfileForm
