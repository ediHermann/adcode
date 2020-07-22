// import React from 'react';
// import {Input, CustomInput} from 'reactstrap';
//
// export const Filter = ({column}) => {
//     return (
//         <div className='mt-3 text-black '>
//             {column.canFilter && column.render('Filter')}
//         </div>
//     );
// };
//
// export const DefaultColumnFilter = ({
//                                         column: {
//                                             filterValue,
//                                             setFilter,
//                                             preFilteredRows: {length},
//                                         },
//                                     }) => {
//     return (
//         <Input
//             value={filterValue || ''}
//             className='rounded-md pl-2 py-1'
//             onChange={(e) => {
//                 setFilter(e.target.value || undefined);
//             }}
//             placeholder={`Search (${length}) ...`}
//         />
//     );
// };
//
// export const SelectColumnFilter = ({
//                                        column: {filterValue, setFilter, preFilteredRows, id},
//                                    }) => {
//     const options = React.useMemo(() => {
//         const options = new Set();
//         preFilteredRows.forEach((row) => {
//             options.add(row.values[id]);
//         });
//         return [...options.values()];
//     }, [id, preFilteredRows]);
//
//     return (
//         <CustomInput
//             id='custom-select'
//             type='select'
//             value={filterValue}
//             className='rounded-md'
//             onChange={(e) => {
//                 setFilter(e.target.value || undefined);
//             }}
//         >
//             <option value=''>All</option>
//             {options.map((option) => (
//                 <option key={option} value={option}>
//                     {option}
//                 </option>
//             ))}
//         </CustomInput>
//     );
// };