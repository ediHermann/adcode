import React from "react";
import UidForm from "../../components/UID";
import httpAgent from "../../components/common/init";
import SearchButton from "../../components/svg/Search";
import {Form} from "formik";


const JsonTable = require('ts-react-json-table')
const columns = [
    {key: 'talent.name', label: 'Nume'},
    {key: 'role', label: 'Rol'},
    {key: 'obs', label: 'Observatii'},


]
const DetailsSpot = () => {
       //VIEW SPOT

        const initValues = {
            status: 'PENDING',
            uid: '',
            title: '',
            client: '',
            duration: '',
            media_type: '1',
            spotTalents: [{
                talent: {name: ''},
                role: '',
                obs: ''
            }]
        }
        const uid=(window.location.href.substring(window.location.href.lastIndexOf('/') + 1));
        const [items, setItems] = React.useState(initValues);

        const retrieveData = async (uid) => {
            console.log('RV')
            const strCrit = JSON.stringify({uid: uid});
            const unquoted = strCrit.replace(/"([^"]+)":/g, '$1:');
            const payload = `query={artistsSpots(where:${unquoted})}`;
            const response = await httpAgent(payload);

            if (response.status === 200) {
                const json = await response.json()
                console.log(json)
                const _items = json.data.artistsSpots.payload;
                console.log("items")
                console.log(_items[0])
                setItems(_items[0])
            } else {
                //Display the error
                console.log(response);
            }

     }

    React.useEffect(() => {
       retrieveData(uid.uid);
    }, [])


    return (
        <div className='max-w-screen-sm h-full self-center m-auto px-5'>
            <div className='flex justify-center uppercase mt-40 text-2xl md:text-5xl font-bold w-2/3'>Detalii spot</div>
            <div className='flex justify-center mx-auto'>

                <table className='w-full'>
                    <tbody>
                    <tr className='border-t border-gray-500 p-2'><td className='p-2'>UID:</td><td className='p-2'>{items.uid}</td></tr>
                    <tr className='border-t border-gray-500 p-2'><td className='p-2'>Titlu:</td><td className='p-2'>{items.title}</td></tr>
                    <tr className='border-t border-gray-500 p-2'><td className='p-2'>Client:</td><td className='p-2'>{items.client}</td></tr>
                    <tr className='border-t border-gray-500 p-2'><td className='p-2'>Durata:</td><td className='p-2'>{items.duration}</td></tr>
                    <tr className='border-t border-gray-500 p-2'><td className='p-2'>Creat la:</td><td className='p-2'>{items.created_at}</td></tr>

                    </tbody>
                </table>



            </div>
            <hr   className='border-gray-800 w-full my-8'/>
            <label className='font-bold text-sm mb-1 text-gray-600'>Talente:</label><br/>
            <JsonTable rows={items.spotTalents} columns={columns} className='w-full'/>
        </div>
    )

}

export default DetailsSpot;