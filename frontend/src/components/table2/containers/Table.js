import React from 'react'
import TableHead from "./TableHead";
import TableBody from "./TableBody";


const TableComponent = ({ header, rows }) => {


    return (
        <div className='flex justify-center'>
            <table className="border-2 rounded-window ">
                <TableHead header={header}/>
                <TableBody header={header} rows={rows}/>
            </table>
        </div>
    );
}

export default TableComponent