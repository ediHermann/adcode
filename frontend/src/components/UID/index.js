import React from 'react'
import cn from "classnames";
import {ErrorMessage, Field, Form, Formik} from "formik";
import TableComponent from "../table-bun";
import Table from "../table-bun/Table";


const UidForm = () => {
    const initialValues = {
        status: '',
        uid: '',
        title: '',
        client: '',
        duration: '',
        name: '',
        talent_role: '',
        obs: '',
    }

    const inputStyle = cond => cn(
        "w-full rounded-md p-2 ", {
            "border-2 border-error": cond,
            'border-2 border-secondary mb-2': !cond
        })

    const inputStyles = cond => cn(
        "w-1/3 rounded-md p-2 ", {
            "border-2 border-error": cond,
            'border-2 border-secondary mb-2': !cond
        })
    const inputStyless = cond => cn(
        "w-2/3 rounded-md p-2 ", {
            "border-2 border-error": cond,
            'border-2 border-secondary mb-2': !cond
        })

    return <Formik initialValues={initialValues}
                   onSubmit={(values, {setSubmitting}) => {
                       setTimeout(() => {
                           alert(JSON.stringify(values, null, 2));
                           setSubmitting(false);
                       }, 400);
                   }}
        // onSubmit={onSubmit}
    >
        {
            ({

                 errors,
                 touched,
                 handleSubmit,
                 isSubmitting
             }) => <Form onSubmit={handleSubmit}>
                <label>Status</label>
                <div>{status}</div>

                <input
                    type="text"
                    name="uid"
                    placeholder="UID"
                    className={inputStyles(errors.uid && touched.uid)}/>
                <ErrorMessage
                    name="uid"
                    component="div"
                    className="text-sm text-error italic"/>

                <input
                    type="text"
                    name="title"
                    placeholder="Title"
                    className={inputStyless(errors.title && touched.title)}/>
                <ErrorMessage
                    name="title"
                    component="div"
                    className="text-sm text-error italic"/>

                <input
                    type="text"
                    name="duration"
                    placeholder="Durata"
                    className={inputStyle(errors.duration && touched.duration)}/>
                <ErrorMessage
                    name="duration"
                    component="div"
                    className="text-sm text-error italic"/>

                <div className='mt-2 mb-4 text-white'>
                    <label>Tip media:</label><br/>

                    <input id='audio' className='cursor-pointer mr-1' type='checkbox' name='choice' value='audio'
                           onClick={() => console.log()}/>
                    <label className='cursor-pointer' htmlFor='audio'>AUDIO</label>

                    <input id='video' className='ml-4 mr-1 cursor-pointer' type='checkbox' name='choice' value='video'
                           onClick={() => console.log()}/>
                    <label className='cursor-pointer' htmlFor='video'>VIDEO</label>
                </div>
                <div>
                   <Table/>
                </div>


                <div>
                    <button className='absolute bg-primary px-16 py-4 mt-10 rounded-md text-text'
                            style={{left: '50%', marginLeft: '-90px'}}
                            type='submit' disabled={isSubmitting}>Submit
                    </button>
                </div>
            </Form>
        }

    </Formik>

}


export default UidForm