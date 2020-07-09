import React from 'react'

const TableBody = (props) => {
    const { header, rows } = props;
    const columns = header ? header.length : 0;
    const showSpinner = rows === null;

    function buildRow(row, header) {
        return (
            <tr key={row.id}>
                { header.map((value, index) => {
                    return <td key={index}>{row[value]}</td>
                })}
            </tr>
        )
    };

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
    );
}

export default TableBody