import React, {useEffect, useState} from 'react'
import datas from './data'
import schema from './schema'

const Table = () => {
    const [ data, setData] = useState(null);

    useEffect(() => {
        new Promise((resolve) => {
            setTimeout(() => {
                resolve(datas);
            }, 2000)
        }).then((result) => {
            setData(result);
        })
    });
return(
    <div className="container p-2">
        <div className="row">
            <div className="col">
                <Table header={Object.keys(schema)} rows={data}/>
            </div>
        </div>
    </div>
)}
export default Table