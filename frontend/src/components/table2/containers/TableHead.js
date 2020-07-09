import React from 'react'


const TableHead = (props) => {
    const {header} = props
    return(
        <thead className="thead-dark" key="header-1">
        <tr key="header-0">
            { header && header.map((value, idx) => {
                return <th key={idx}><div>{value}</div></th>
            })}
        </tr>
        </thead>
    );
}

export default TableHead