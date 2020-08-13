import React, {useEffect, useState} from 'react'
import datas from './data'
import schema from './schema'
import TableComponent from "./containers/Table";


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
    <div className="flex-center p-2 mt-20 w-full h-full">
        <div className="row">
            <div className="col">
                <TableComponent header={Object.keys(schema)} rows={data} />
            </div>
        </div>
    </div>
)}
export default Table