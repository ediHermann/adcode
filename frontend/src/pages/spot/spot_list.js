import React from "react"
import EditButton from "../../components/svg/Edit"
import AddButton from "../../components/svg/AddButton"
import httpAgent from "../../components/common/init"



const JsonTable = require('ts-react-json-table')


const columns = [
    {key: 'uid', label: 'UID'},
    {key: 'title', label: 'Titlu'},
    {key: 'client', label: 'Client'},
    {key: 'duration', label: 'Durata'},
    {key: 'status', label: 'Status'},
    {key: 'created_at', label: 'Creat la'},
    {
        key: 'edit', label: 'Edit', cell: function (item, columnKey) {
            let url = '#/edit_spot/' + item.uid;
            return < a href={url} className='underline'><EditButton className='mr-2 inline align-bottom'/>Editare</a>;
        }
    }

]

    const payload = 'query={userSpots}';

    const SpotList = () => {

    const [items, setItems] = React.useState([])


    const retrieveData = async () => {
        const response = await httpAgent(payload)
        if (response.status === 200) {
            const json = await response.json()
            console.log(json)
            const _items = json.data.userSpots.payload;
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

    return (
        <div className='ml-10'>
            <h2 className='text-2xl font-bold mb-20 mt-20'>Spoturile mele</h2>
            <a href='#/create_spot' className='underline '>
                <AddButton className='inline align-bottom mr-2'/>
                Creaza un spot nou
            </a>
            <JsonTable rows={items} columns={columns} />
        </div>
    )
}

export default SpotList

