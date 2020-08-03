import React from "react"
import EditButton from "../../components/svg/Edit"
import AddButton from "../../components/svg/AddButton"
import httpAgent from "../../components/common/init"
import {useTableSearch} from "../../components/table/TableSearch"
import {Input} from 'antd'


const JsonTable = require('ts-react-json-table')


const userColumns = [
    {key: 'uid', label: 'UID', dataIndex: 'uid'},
    {key: 'title', label: 'Titlu', dataIndex: 'title'},
    {key: 'client', label: 'Client', dataIndex: 'client'},
    {key: 'duration', label: 'Durata', dataIndex: 'duration'},
    {key: 'status', label: 'Status', dataIndex: 'status'},
    {key: 'created_at', label: 'Creat la', dataIndex: 'created_at'},
    {
        key: 'edit', label: 'Edit', dataIndex: 'edit', cell: function (item, columnKey) {
            let url = '#/pages/spot/edit_spot/' + item.uid;
            return < a href={url} className='underline'><EditButton className='mr-2 inline align-bottom'/>Editare</a>;
        }
    }

]

const payload = 'query={userSpots}';

const SpotList = () => {

    const { Search } = Input

    const [items, setItems] = React.useState([])
    const [searchVal, setSearchVal] = React.useState(null);





    const retrieveData = async () => {
        const response = await httpAgent(payload)
        if (response.status === 200) {
            const json = await response.json()
            console.log(json)
            const _items = json.data.userSpots
            console.log("items")
            console.log(_items)
            setItems(_items)
        } else {
            //Display the error
            console.log(response);
        }

    }

    const { filteredData, loading } = useTableSearch({
        searchVal,
        retrieve: retrieveData
    });

    React.useEffect(() => {
        retrieveData()
    }, [])

    return (
        <div className='ml-10'>
            <h2 className='text-2xl font-bold mb-20 mt-20'>Spoturile mele</h2>
            <Search
                onChange={e => setSearchVal(e.target.value)}
                placeholder="Search"
                enterButton
                style={{ position: "sticky", top: "0", left: "0" }}
            />
            <a href='#/create_spot' className='underline '>
                <AddButton className='inline align-bottom mr-2'/>
                Creaza un spot nou
            </a>
            <JsonTable rowKey='name' rows={items} columns={userColumns} dataSource={filteredData}
                       loading={loading}/>
        </div>
    )
}

export default SpotList

