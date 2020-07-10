import React from 'react'


const TableBody = ({header, rows}) => {

    const columns = header ? header.length : 0
    const showSpinner = rows === null

    function buildRow(row, header) {
        return (
            <tr key={row.uid} className='hover:bg-primary hover:text-white'>
                { header.map((value, index) => {
                    return <td key={index} className='p-2 text-sm md:text-lg border-2'>{row[value]}</td>
                })}
            </tr>
        )
    }

    return(
        <tbody>
        {showSpinner &&
        <tr key="spinner-0">
            <td colSpan={columns} className="text-center">
                <div className="spinner-border" role="status">
                    <span className="sr-only">Loading...</span>
                </div>
            </td>
        </tr>
        }
        { !showSpinner && rows && rows.map((value) => {
            return buildRow(value, header);
        })}
        </tbody>
    )
}

export default TableBody