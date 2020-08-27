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
    {key: 'broadcast_duration', label: 'Durata (sec)'}

]

const Broadcast = () => {

    let  inidate = new Date();
    inidate.setDate(inidate.getDate() - 30);

    const initialValues = {
        broadcaster: '',
        studio: '',
        title: '',
        startDate: inidate,
        endDate: new Date()
    }



    const [filter, setFilter] = React.useState(initialValues)

    const [items, setItems] = React.useState([])



    const retrieveData = async (criteria) => {

        const strCrit = JSON.stringify(criteria);
        const unquoted = strCrit.replace(/"([^"]+)":/g, '$1:');
        const payload = `query={userBroadcastTable(where:${unquoted})}`;
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
        retrieveData(initialValues)
    }, [])


    const SuggestionComp = ({suggestion}) => <span>{`${suggestion.name}`}</span>
    const displaySuggestion = item => {
        return item.name
    }
    const httpGetterBroadcaster = value => new Promise(
        resolve => {
            setTimeout(async() => {

                const strCrit = JSON.stringify({username: '%'+value.trim().toLowerCase()+'%',role:{name:'Broadcaster'}});
                const unquoted = strCrit.replace(/"([^"]+)":/g, '$1:');
                const payload = `query={searchUser(where:${unquoted})}`;
                const resp =  await httpAgent(payload);
                const r= await resp.json();
                const datarows=r.data.searchUser.payload;
                resolve(
                    ()  => datarows)
            }, 100)
        })
    const httpGetterSpot = value => new Promise(
        resolve => {
            setTimeout(async() => {
                const strCrit = JSON.stringify({title_contains: value.trim().toLowerCase()});
                const unquoted = strCrit.replace(/"([^"]+)":/g, '$1:');
                const payload = `query={spots(where:${unquoted},sort:"title"){uid,title}}`;
                const resp =  await httpAgent(payload);
                const r= await resp.json();
                console.log(r);
                const datarows=r.data.spots.map(item => ({uid:item.uid, name:item.title}));

                resolve(
                    ()  => datarows)
            }, 100)
        })
    const httpGetterStudio = value => new Promise(
        resolve => {
            setTimeout(async() => {

                const strCrit = JSON.stringify({username: '%'+value.trim().toLowerCase()+'%',role:{name:'Studio'}});
                const unquoted = strCrit.replace(/"([^"]+)":/g, '$1:');
                const payload = `query={searchUser(where:${unquoted})}`;
                const resp =  await httpAgent(payload);
                const r= await resp.json();
                const datarows=r.data.searchUser.payload;
                resolve(
                    ()  => datarows)
            }, 100)
        })



    const onSubmit = async (values, {setSubmitting}) => {
        setSubmitting(true);
        alert(JSON.stringify(values, null, 2));
        setSubmitting(false);
        setFilter(values);
        await retrieveData(values);
        setSubmitting(false)
        return false;

    };

    return <Formik
            initialValues={initialValues}
            onSubmit={onSubmit}>
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
                                    httpGetter={httpGetterBroadcaster}
                                    SuggestionComp={SuggestionComp}
                                    displaySuggestion={displaySuggestion}
                                    name='broadcaster'
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
                                <label htmlFor='title'>Spot</label>
                                <AutocompleteAsync
                                    httpGetter={httpGetterSpot}
                                    SuggestionComp={SuggestionComp}
                                    displaySuggestion={displaySuggestion}
                                    name='title'
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
                                    dateFormat="yyyy-MM-dd"
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
                                    dateFormat="yyyy-MM-dd"
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