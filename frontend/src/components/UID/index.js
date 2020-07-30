import React from 'react'
import cn from "classnames";
import {ErrorMessage, Field, FieldArray, Form, Formik} from "formik"
import db from "../dbs/fake-db";
import AutocompleteAsync from "../autocomplete/autocomplete-async";

import PropTypes from "prop-types";
import Delete from "../svg/DeleteButton";


const Media_types = [
    {id: "1", name: "AUDIO"},
    {id: "2", name: "VIDEO"},
];

const UidForm = () => {
    const initialValues = {
        status: '',
        uid: '',
        title: '',
        client: '',
        duration: '',
        media_types: [],
        spotTalent: [{
            talent: '',
            role: '',
            obs: ''
        }]
    }



    const inputStyles = cond => cn(
        "w-1/3 rounded-md p-2 ", {
            "border-2 border-error": cond,
            'border-2 border-secondary mb-2': !cond
        })
    const inputStyless = cond => cn(
        "w-2/3 rounded-md p-2", {
            "border-2 border-error": cond,
            'border-2 border-secondary mb-2': !cond
        })


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
                 handleBlur,
                 handleChange,
                 handleSubmit,
                 isSubmitting,
                 setFieldValue
             }) => <Form onSubmit={handleSubmit}>
                <label>Status</label>
                <div>{status}</div>
                <div className='block'>
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
                </div>
                <div>
                    <label className='font-bold text-sm'>Tipul talentului</label><br/>
                    <FieldArray
                        name="media_types"
                        type='text'
                        render={arrayHelpers => (
                            <div>
                                {Media_types.map(category => (
                                    <div key={category.id}>
                                        <label className='text-sm font-bold'>
                                            <input
                                                name="categoryId"
                                                type="radio"
                                                value={category.id}
                                                checked={values.media_types.find(o => o.id === category.id)}
                                                onChange={e => {
                                                    if (e.target.checked) arrayHelpers.push({id: category.id});
                                                    else {
                                                        let obj = values.media_types.find(o => o.id === category.id);
                                                        let idx = values.media_types.indexOf(obj);
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
                </div>
                <div className=' flex-row'>
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
                                            <AutocompleteAsync
                                                httpGetter={httpGetter}
                                                SuggestionComp={SuggestionComp}
                                                displaySuggestion={displaySuggestion}
                                                name={`spotTalent[${index}].talent`}
                                                setFValue={setFieldValue}
                                            />
                                        </div>

                                        <div className="col">
                                            <Field
                                                className='border-window rounded'
                                                component='select'
                                                name={`spotTalent[${index}].role`}
                                                value={values.color}
                                                onChange={handleChange}
                                                onBlur={handleBlur}
                                                style={{display: 'block'}}>
                                                <option value="" label="Alege un rol"/>
                                                <option value="fata" label="fata"/>
                                                <option value="voce" label="voce"/>
                                                <option value="fata + voce" label="fata + voce"/>
                                            </Field>
                                        </div>

                                        <div className="col">
                                            <Field name={`spotTalent[${index}].obs`} type='text' className='border-window rounded'/>
                                        </div>

                                        <div>
                                            <button type='button' onClick={() => remove(index)}><Delete/></button>
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
UidForm.propTypes = {
    uid: PropTypes.string,
    title: PropTypes.string,
    client: PropTypes.string,
    duration: PropTypes.string,
    talent: PropTypes.string,
    role: PropTypes.string,
    obs: PropTypes.string,
    talent_types: PropTypes.array,
}

export default UidForm