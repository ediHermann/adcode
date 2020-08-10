import React from 'react'
import cn from "classnames";
import {ErrorMessage, Field, FieldArray, Form, Formik} from "formik"
import db from "../dbs/fake-db";
import AutocompleteAsync from "../autocomplete/autocomplete-async";
import PropTypes from "prop-types";
import Delete from "../svg/DeleteButton";
import httpAgent from "../common/init";
import AddButton from "../svg/AddButton";


const Media_types = [
    {id: "1", name: "AUDIO"},
    {id: "2", name: "VIDEO"},
];

const UidForm = (uid) => {
    const initialValues = {
        status: '',
        uid: '',
        title: '',
        client: '',
        duration: '',
        media_type: '',
        spotTalent: [{
            talent: '',
            role: '',
            obs: ''
        }]
    }


    const inputStyles = cond => cn(
        'w-full rounded p-2', {
            'border-2 border-error': cond,
            'border-gray-800 border rounded  border-secondary mb-1': !cond
        })
    const inputStyless = cond => cn(
        "w-full rounded p-2", {
            'border-2 border-error': cond,
            'border-gray-800 border rounded  border-secondary mb-1': !cond
        })

    const status="Spot nou";
    const SuggestionComp = ({suggestion}) => <span>{`${suggestion.name}`}</span>
    const displaySuggestion = item => {
        return item.name
    }

    const [data, setData] = React.useState({});

    const retrieveData = async (uid) => {
        const strCrit=JSON.stringify({uid:uid});
        const unquoted = strCrit.replace(/"([^"]+)":/g, '$1:');
        const payload = `query={userSpots(where:${unquoted})}`;
        const response = await httpAgent(payload);
        if (response.status === 200) {
            const json = await response.json();

            let _data;
            if(json.data.userSpots) {
                _data = json.data.userSpots.payload[0];
                 //console.log(_data);
                let mediaType='';
                if(_data.media_type)
                    mediaType=_data.media_type.type_name
                 const _spot_talents=[{talent:{name:'Ellary'},role:'fata',obs:'observatii talent 1'},{talent:{name:'Kacy'},role:'voce',obs:'observatii talent 2'}]
                 const formData={uid:_data.uid, title:_data.title,client:_data.client,created_at:_data.created_at,duration:_data.duration,media_type:mediaType,spotTalent:_spot_talents};
                 console.log (formData);
                 setData(formData);
            }
            // console.log(formData);
        } else {
            //Display the error
            console.log(response);
        }

    }
    React.useEffect(() => {

        retrieveData(uid.uid);
    }, [])


    const httpGetter = value => new Promise(
        resolve => {
            setTimeout(() => {
                resolve(
                    () => db.filter(
                        item => item.name
                            .toLowerCase()
                            .includes(value.trim().toLowerCase())))
            }, 500)
        })

    const onSubmit = async (values, {setSubmitting}) => {
        setSubmitting(true);

            let strValues=JSON.stringify(values);
            alert(JSON.stringify(values, null, 2));
        //   try {
        //     const unquoted = strValues.replace(/"([^"]+)":/g, '$1:');
        //     const payload1 = `query=mutation{updateProfile(data:${unquoted})}`;
        //      console.log(payload1);
        //     const outcome = await  httpAgent(payload1);
        //     if (outcome.status==200) {
        //         alert('Datele au fost salvate')
        //         console.log(outcome);
        //     }
        //     else {
        //         alert('Eroare- Datele nu au fost salvate')
        //         console.log(outcome);
        //     }
        // } catch (err) {
        //     console.log(err);
        //     setGlobalError(err.message);
        // }
        // setSubmitting(false)
        // return false;

    };

    return <Formik
            initialValues={data}
            //initialValues={initialValues}
            enableReinitialize={true}
            onSubmit={onSubmit}
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
                <label className='font-bold text-sm mb-1 mr-2 text-gray-600 '>Status: {status}</label>
                <div className='block'>
                    <label className='font-bold text-sm mb-1 text-gray-600'>UID: </label>
                    <Field
                        type="text"
                        name="uid"
                        placeholder="UID"
                        className={inputStyles(errors.uid && touched.uid)}/>
                    <ErrorMessage
                        name="uid"
                        component="div"
                        className="text-sm text-error italic "/>

                    <label className='font-bold text-sm mb-1 text-gray-600'>Titlu: </label>
                    <Field
                        type="text"
                        name="title"
                        placeholder="Titlu"
                        className={inputStyless(errors.title && touched.title)}/>
                    <ErrorMessage
                        name="title"
                        component="div"
                        className="text-sm text-error italic"/>

                    <label className='font-bold text-sm mb-1 text-gray-600'>Client: </label>
                    <Field
                        type="text"
                        name="client"
                        placeholder="Client"
                        className={inputStyless(errors.client && touched.client)}/>
                    <ErrorMessage
                        name="client"
                        component="div"
                        className="text-sm text-error italic"/>

                    <label className='font-bold text-sm mb-1 text-gray-600'>Durata (sec): </label>

                    <Field
                        type="text"
                        name="duration"
                        placeholder="Durata"
                        className={inputStyles(errors.duration && touched.duration)} />
                    <ErrorMessage
                        name="duration"
                        component="div"
                        className="text-sm text-error italic"/>
                </div>
                <div>
                    <label className='font-bold text-sm mb-1 text-gray-600'>Tip media:</label><br/>
                    <FieldArray
                        name="media_type"
                        type='text'
                        render={arrayHelpers => (
                            <div>
                                {Media_types.map(category => (
                                    <div key={category.id} className='inline-block m-1'>
                                        <label className='text-sm'>
                                            <input
                                                name="categoryId"
                                                type="radio"
                                                value={category.id}
                                                checked={values.media_type=== category.name}
                                                onChange={e => {
                                                    console.log(e.target.value);
                                                    setFieldValue('media_type', e.target.value)
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
                    <label className='font-bold text-sm mb-1 text-gray-600'>Talente:</label><br/>
                    <FieldArray name='spotTalent'>
                        {({push, remove}) => (
                            <>
                                <AddButton className='inline align-bottom mr-2'/>
                                <button type='button' onClick={() => push({talent: '', role: '', obs: ''})}
                                        disabled={isSubmitting} className='inline align-bottom mr-2 underline' >Adauga talent
                                </button>

                                {values.spotTalent &&
                                values.spotTalent.length > 0 &&
                                values.spotTalent.map((s_part, index) => (

                                    <div key={index} className="row  border-t border-gray-800 mt-1" >
                                        <div className="col inline-block m-1">
                                            <label className='font-bold text-sm mb-1 text-gray-600'>Talent</label><br/>
                                            <AutocompleteAsync
                                                httpGetter={httpGetter}
                                                SuggestionComp={SuggestionComp}
                                                displaySuggestion={displaySuggestion}
                                                name={`spotTalent[${index}].talent`}
                                                setFValue={setFieldValue}
                                                val={s_part.talent.name}

                                            />
                                        </div>

                                        <div className="col inline-block m-1">
                                            <label className='font-bold text-sm mb-1 text-gray-600'>Rol</label><br/>
                                            <Field
                                                className='border-gray-800 border rounded  border-secondary mb-1'
                                                component='select'
                                                name={`spotTalent[${index}].role`}
                                                onChange={handleChange}
                                                onBlur={handleBlur}
                                                style={{display: 'block'}}>
                                                <option value="" label="Alege un rol"/>
                                                <option value="fata" label="fata"/>
                                                <option value="voce" label="voce"/>
                                                <option value="fata + voce" label="fata + voce"/>
                                            </Field>
                                        </div>

                                        <div className="col inline-block m-1">

                                            <label className='font-bold text-sm mb-1 text-gray-600'>Observatii</label><br/>
                                            <Field name={`spotTalent[${index}].obs`} type='text' className='border-gray-800 border rounded  border-secondary mb-1 pl-2'/>
                                        </div>

                                        <div className="col inline-block m-1">

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

