import React, {useState} from 'react'
import cn from "classnames"
import {ErrorMessage, Field, FieldArray, Form, Formik} from "formik"
import db from "../dbs/fake-db"
import dbl from "../dbs/another-db"
import Select from 'react-select'
import SearchInput from "../mixt/SearchInput"
import AutoSuggest from "react-autosuggest"

import './../autocomplete/styles.css'
import AutocompleteAsync from "../autocomplete/autocomplete-async";


const UidForm = () => {


    const initialValues = {
        status: '',
        uid: '',
        title: '',
        client: '',
        duration: '',
        initValues: [{
            talent: '',
            role: '',
            obs: '',
            talentInput: ''
        }]
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

    const SuggestionComp = ({suggestion}) => <span>{`${suggestion.talent}`}</span>

    const displaySuggestion = item => {
        alert(`${item.email}`)
        return item.talent
    }

    const httpGetter = value => new Promise(
        resolve => {
            setTimeout(() => {
                resolve(
                    () => db.filter(
                        item => item.talent
                            .toLowerCase()
                            .includes(value.trim().toLowerCase())))
            }, 500)
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
                 values,
                 errors,
                 touched,
                 handleSubmit,
                 isSubmitting,
             }) => <Form onSubmit={handleSubmit}>
                <label>Status</label>
                <div>{status}</div>

                <Field
                    type="text"
                    name="uid"
                    placeholder="UID"
                    className={inputStyles(errors.uid && touched.uid)}/>
                <ErrorMessage
                    name="uid"
                    component="div"
                    className="text-sm text-error italic"/>

                <Field
                    type="text"
                    name="title"
                    placeholder="Title"
                    className={inputStyless(errors.title && touched.title)}/>
                <ErrorMessage
                    name="title"
                    component="div"
                    className="text-sm text-error italic"/>

                <Field
                    type="text"
                    name="client"
                    placeholder="Client"
                    className={inputStyless(errors.client && touched.client)}/>
                <ErrorMessage
                    name="client"
                    component="div"
                    className="text-sm text-error italic"/>

                <Field
                    type="text"
                    name="duration"
                    placeholder="Durata"
                    className={inputStyles(errors.duration && touched.duration)}/>
                <ErrorMessage
                    name="duration"
                    component="div"
                    className="text-sm text-error italic"/>

                <div className='mt-2 mb-4 text-white'>
                    <label>Tip media:</label><br/>

                    <input id='audio' className='cursor-pointer mr-1' type='radio' name='choice' value='audio'
                           onClick={() => console.log()}/>
                    <label className='cursor-pointer' htmlFor='audio'>AUDIO</label>

                    <input id='video' className='ml-4 mr-1 cursor-pointer' type='radio' name='choice' value='video'
                           onClick={() => console.log()}/>
                    <label className='cursor-pointer' htmlFor='video'>VIDEO</label>
                </div>
                <div>
                    <FieldArray name='initValues'>
                        {({push, remove}) => (
                            <>
                                <button type='button'
                                        onClick={() => push({talent: '', role: '', obs: '', talentInput: ''})}
                                        disabled={isSubmitting}>Add
                                </button>

                                {values.initValues &&
                                values.initValues.length > 0 &&
                                values.initValues.map((s_part, index) => (
                                    <div key={index} className="row">
                                        <div className="col">

                                            <AutocompleteAsync
                                                label='Name'
                                                httpGetter={httpGetter}
                                                SuggestionComp={SuggestionComp}
                                                displaySuggestion={displaySuggestion}
                                                name={`initValues[${index}].talent`}

                                            />

                                        </div>
                                        <div className="col">
                                            {/*<Select*/}
                                            {/*    {...props}*/}
                                            {/*    placeholder='Select option'*/}
                                            {/*    value={dbl ? dbl.find(obj => obj.value === selectedValue) : ''}*/}
                                            {/*    options={dbl}*/}
                                            {/*    onChange={handleChange}*/}
                                            {/*    className='w-64 text-black'*/}
                                            {/*/>*/}

                                        </div>

                                        <div className="col">
                                            <Field name={`initValues[${index}].obs`} type='text'/>
                                        </div>
                                        <div>
                                            <button type='button' onClick={() => remove(index)}>X</button>
                                        </div>
                                    </div>
                                ))}

                            </>
                        )}
                    </FieldArray>

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