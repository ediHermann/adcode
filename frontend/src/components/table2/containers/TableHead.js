import React from 'react'


const TableHead = ({header}) => {
    return (
        <thead className=" uppercase bg-secondary text-left text-white " key="header-1">
        <tr key="header-0">
            {header && header.map((value, idx) => {
                return <th key={idx} className='py-6 px-2 w-64'>
                    <div>{value}</div>
                </th>
            })}
        </tr>
        </thead>
    );
}

export default TableHead