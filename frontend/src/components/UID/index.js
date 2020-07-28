import React from 'react'
import cn from "classnames";
import {ErrorMessage, Field, FieldArray, Form, Formik} from "formik"
import dbl from "../dbs/another-db"
import db from "../dbs/fake-db";
import AutocompleteAsync from "../autocomplete/autocomplete-async";
import Autocomplete from "../autocomplete/autocomplete";



const UidForm = () => {
    const initialValues = {
                status: '',
                uid: '',
                title: '',
                client: '',
                duration: '',
            spotTalent:[{
                 talent: '',
                 role: '',
                 obs: ''

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

    const filter = itemList => value => itemList.filter(item => item.role.toLowerCase().includes(value.trim().toLowerCase()))
    const SuggestionCompLocal = ({suggestion}) => <span>{`${suggestion.role}`}</span>
    const displaySuggestionLocal = item => item.role

    const SuggestionComp = ({suggestion}) => <span>{`${suggestion.talent}`}</span>
    const displaySuggestion = item => {
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
                 setFieldValue
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
                    <FieldArray name='spotTalent'>
                        {({push, remove}) => (
                            <>
                                <button type='button' onClick={() => push({talent: '', role: '', obs: ''})}
                                        disabled={isSubmitting}>Add
                                </button>

                                {values.spotTalent &&
                                values.spotTalent.length > 0 &&
                                values.spotTalent.map((s_part, index) => (
                                    <div key={index} className="row">
                                        <div className="col">

                                            {/*<Field name={`spotTalent[${index}].talent`}>*/}
                                                {/*{({field}) => (*/}
                                                {/*   <input {...field} type='text' placeholder='Name'/>*/}
                                                    <AutocompleteAsync
                                                    httpGetter={httpGetter}
                                                    SuggestionComp={SuggestionComp}
                                                    displaySuggestion={displaySuggestion}
                                                    name={`spotTalent[${index}].talent`}
                                                    setFValue={setFieldValue}
                                                    //mirrorInput={`spotTalent[${index}].talentInput`}
                                                    //onChange = { e => e.setFieldValue(`spotTalent[${index}].talent`, e)}

                                                    />
                                                {/*)}*/}
                                            {/*</Field>*/}
                                        </div>
                                        <div className="col">
                                            {/*<Field name={`spotTalent[${index}].role`} type='text'>*/}
                                                <Autocomplete
                                                    filter={filter(dbl)}
                                                    SuggestionCompLocal={SuggestionCompLocal}
                                                    displaySuggestionLocal={displaySuggestionLocal}
                                                    onChange={initialValues}
                                                    // value={role}
                                                    // name={role}
                                                />
                                            {/*</Field>*/}
                                        </div>
                                        <div className="col">
                                            <Field name={`spotTalent[${index}].obs`} type='text'/>
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