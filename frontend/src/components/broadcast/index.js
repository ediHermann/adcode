import React, {useState} from 'react'
import {Form, Formik} from "formik"
import talent from '../dbs/talent'
import AutocompleteAsync from "../autocomplete/autocomplete-async";
import spots from "../dbs/spots";
import studio from '../dbs/studio'
import DatePicker from 'react-datepicker'
import {ro} from 'date-fns/locale'
import "react-datepicker/dist/react-datepicker.css";
import './../calendar/styles.css'
import db from "../dbs/fake-db";
import httpAgent from "../common/init";
import SearchButton from "../svg/Search";
const JsonTable = require('ts-react-json-table');

const columns = [
    {key: 'broadcaster', label: 'Broadcaster'},
    {key: 'title', label: 'Spot'},
    {key: 'uid', label: 'UID'},
    {key: 'studio', label: 'Studio'},
    {key: 'client', label: 'Client'},
    {key: 'date', label: 'Data'},
    {key: 'time', label: 'Ora'},
    {key: 'broadcast_duration', label: 'Durata'}

]

const Broadcast = () => {
    const initialValues = {
        spot: '',
        talent: '',
        studio: '',
        startDate: new Date(),
        endDate: new Date()
    }



    const [items, setItems] = React.useState([])


    const retrieveData = async () => {

        const payload = 'query={userBroadcastTable}';
        const response = await httpAgent(payload);
        if (response.status === 200) {
            const json = await response.json()
            console.log(json)
            const _items = json.data.userBroadcastTable.payload;
            console.log("items")
            console.log(_items)
            setItems(_items)
        } else {
            //Display the error
            console.log(response);
        }

    }

    React.useEffect(() => {
        retrieveData()
    }, [])


    const SuggestionComp = ({suggestion}) => <span>{`${suggestion.name}`}</span>
    const displaySuggestion = item => {
        return item.name
    }
    const httpGetterTalent = value => new Promise(
        resolve => {
            setTimeout(() => {
                resolve(
                    () => talent.filter(
                        item => item.name
                            .toLowerCase()
                            .includes(value.trim().toLowerCase())))
            }, 500)
        })
    const httpGetterSpot = value => new Promise(
        resolve => {
            setTimeout(() => {
                resolve(
                    () => spots.filter(
                        item => item.name
                            .toLowerCase()
                            .includes(value.trim().toLowerCase())))
            }, 500)
        })
    const httpGetterStudio = value => new Promise(
        resolve => {
            setTimeout(() => {
                resolve(
                    () => studio.filter(
                        item => item.name
                            .toLowerCase()
                            .includes(value.trim().toLowerCase())))
            }, 500)
        })


    return <Formik initialValues={initialValues} onSubmit={(values, {setSubmitting}) => {
        setTimeout(() => {
            alert(JSON.stringify(values, null, 2));
            setSubmitting(false);
        }, 400);
    }}>
        {
            ({
                 values,
                 handleSubmit,
                 isSubmitting,
                 setFieldValue
             }) =>
                <Form onSubmit={handleSubmit}>
                    <div className=''
                    style={{width: '1500px'}}>
                        <div className='block lg:flex justify-center'>
                            <div className='mr-4'>
                                <label htmlFor='talent'>Broadcaster</label>
                                <AutocompleteAsync
                                    httpGetter={httpGetterTalent}
                                    SuggestionComp={SuggestionComp}
                                    displaySuggestion={displaySuggestion}
                                    name='talent'
                                    setFValue={setFieldValue}
                                    val=''
                                />
                            </div>

                            <div className='mr-4'>
                                <label htmlFor='studio'>Studio</label>
                                <AutocompleteAsync
                                    httpGetter={httpGetterStudio}
                                    SuggestionComp={SuggestionComp}
                                    displaySuggestion={displaySuggestion}
                                    name='studio'
                                    setFValue={setFieldValue}
                                    val=''

                                />
                            </div>

                            <div className='mr-4'>
                                <label htmlFor='spot'>Spot</label>
                                <AutocompleteAsync
                                    httpGetter={httpGetterSpot}
                                    SuggestionComp={SuggestionComp}
                                    displaySuggestion={displaySuggestion}
                                    name='spot'
                                    setFValue={setFieldValue}
                                    val=''
                                />
                            </div>

                            <div className='mr-4'>
                                <label htmlFor='startDate'>Data de inceput</label>
                                <DatePicker
                                    selected={values.startDate}
                                    onChange={date => setFieldValue('startDate', date)}
                                    locale={ro}
                                    selectsStart
                                    startDate={values.startDate}
                                    endDate={values.endDate}
                                    dateFormat="yyyy-mm-dd"
                                    value={values.date}
                                    name='startDate'
                                    className='w-24'

                                />
                            </div>
                            <div>
                                <label htmlFor='endDate'>Data de sfarsit</label>
                                <DatePicker
                                    selected={values.endDate}
                                    onChange={date => setFieldValue('endDate', date)}
                                    locale={ro}
                                    selectsEnd
                                    startDate={values.startDate}
                                    endDate={values.endDate}
                                    dateFormat="yyyy-mm-dd"
                                    value={values.date}
                                    name='endDate'
                                    className='w-24'
                                />
                            </div>
                        </div>
                        <button className='absolute bg-primary px-16 py-4 mt-10 rounded-md text-text'
                                style={{left: '50%', marginLeft: '-90px'}}
                                type='submit' disabled={isSubmitting}>Apply
                        </button>
                        <div className='block lg:flex justify-center '>
                            <div className='mt-40 align-content-center'>
                                <JsonTable rows={items} columns={columns}/>
                            </div>
                        </div>
                    </div>
                </Form>
        }
    </Formik>

}


export default Broadcast