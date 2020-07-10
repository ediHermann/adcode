import React from 'react'
import TableHead from "./TableHead";
import TableBody from "./TableBody";


const TableComponent = ({ header, rows }) => {


    return (
        <div className='flex justify-center '>
            <table className="border-2 rounded-window ">
                <TableHead header={header}> </TableHead>
                <TableBody header={header} rows={rows}> </TableBody>
            </table>
        </div>
    );
}

export default TableComponent