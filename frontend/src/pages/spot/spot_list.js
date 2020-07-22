import React, {Component} from "react";
import EditButton from "../../components/svg/Edit";
import AddButton from "../../components/svg/AddButton";
import ReactDOM from 'react-dom';
import fetchDog from '../../components/common/init.js';
const JsonTable = require('ts-react-json-table');

const items=[
        {

            "uid":"QQQQQQQQ",
            "title":"Spot 3",
            "client":"Client 1",
            "duration":30,
            "status":"PENDING",
            "created_at":"11.07.2020",
        },
        {
            "uid": "ABD6575B",
            "title": "Spot 1",
            "client": "Emag",
            "duration": 20,
            "status": "PENDING",
            "created_at": "16.07.2020",
        }

    ];





const columns = [
    {key: 'uid', label: 'UID'},
    {key: 'title', label: 'Titlu'},
    {key: 'client', label: 'Client'},
    {key: 'duration', label: 'Durata'},
    {key: 'status', label: 'Status'},
    {key: 'created_at', label: 'Creat la'},
    {key: 'edit', label: 'Edit', cell: function( item, columnKey ){
          let url='#/pages/spot/edit_spot/'+item.uid;
           return < a href={url} className='underline'><EditButton className='mr-2 inline align-bottom'/>Editare</a>;
        }}

];


const payload="query={userSpots}";


class SpotList extends Component {

    constructor() {
        super();
        this.state = { data: [] };
    }

    //   componentDidMount() {
    //     const resolve=fetchDog.execute('spotList',payload)
    //     let thenProm = resolve.then(value => {
    //             console.log("The data:");
    //             console.log(value);
    //             return value});
    //     console.log("result="+thenProm);
    // }

    //console.log(outcome);
     render() {
        console.log(this.state);
        return (
            <div className='ml-10'>
                <h2 className='text-2xl font-bold mb-20 mt-20'>Spoturile mele</h2>
                <a href='#/pages/spot/create_spot' className='underline '><AddButton className='inline align-bottom mr-2'/>Creaza un spot nou</a>
                <JsonTable rows = {items}  columns = {columns} />
            </div>

        );
    }
}
export default SpotList;


function Spots() {
    //let {spotUID } = useParams();
    let {spotUID} = 1;

}
