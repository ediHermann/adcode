import React from 'react'
import TableHead from "./TableHead";
import TableBody from "./TableBody";

const Table = (props) => {
    const { header, rows } = props;
    return (
        <div>
            <table className="table table-bordered table-hover">
                <TableHead headers={header}> </TableHead>
                <TableBody headers={header} rows={rows}> </TableBody>
            </table>
        </div>
    );
}

export default Table