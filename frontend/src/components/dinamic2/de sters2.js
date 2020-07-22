// import React, {useEffect, useState} from 'react'
// import datas from "../table2/data"
// import {Formik} from "formik";
//
//
// const TableForm = ({datas}) => {
//
//     const [data, setData] = useState('');
//
//     // const resetFormState = () => {
//     //     setData({
//     //         setData: {
//     //             name: '',
//     //             role: '',
//     //             obs: '',
//     //             mode: 'submit',
//     //             id: ''
//     //         }
//     //     })
//     // }
//
//     // useEffect(() => {
//     //     new Promise((resolve) => {
//     //         setTimeout(() => {
//     //             resolve(datas);
//     //         }, 2000)
//     //     }).then((result) => {
//     //         setData(result);
//     //     })
//     // })
//
//     const onChange = event => {
//         event.preventDefault()
//         setData(event.target.value)
//     }
//
//     const onSubmit = (event) => {
//
//         const name = event.target.querySelector("input[name='name']")
//             .value;
//         const role = event.target.querySelector("input[name='role']")
//             .value;
//         const obs = event.target.querySelector("input[name='obs']").value;
//         if (setData.mode === 'submit') {
//             setData(data, {
//                 name,
//                 role,
//                 obs,
//                 updating: false,
//                 id: data[data.length - 1].id + 1
//             })
//         } else if (setData.mode === 'edit') {
//             const index = data.find((data) => data.id === setData.id).id
//             data[index] = {
//                 name,
//                 role,
//                 obs,
//                 updating: false,
//                 id: data[index].id
//             }
//             setData({data: [...data]})
//         }
//         // resetFormState()
//     }
//
//     const updateData = (key) => {
//         data[key].updating = true
//
//         setData({
//             setData: {...data[key], mode: 'edit'}, data
//         })
//     }
//
//     const deleteData = key => {
//         data.splice(key, 1)
//         setData({
//             data: [...data]
//         })
//     }
//
//     const Table = ({ updateData, deleteData}) => {
//         return (
//             <div className="table">
//                 <div className="table-header">
//                     <div className="row">
//                         <div className="column">Nume</div>
//                         <div className="column">Role</div>
//                         <div className="column">Observations</div>
//                         <div className="column">Options</div>
//                     </div>
//                 </div>
//                 <div className="table-body">
//                     {datas.map((data, key) =>
//                         <div key={key} className={`row ${data.updating ? "updating" : ""}`}>
//                             <div className="column">{data.name}</div>
//                             <div className="column">{data.role}</div>
//                             <div className="column">{data.obs}</div>
//                             <div className="column">
//                                 <button
//                                     className="icon"
//                                     onClick={() => updateData(key)}
//                                 >
//                                     <i className="far fa-edit"/>
//                                 </button>
//                                 <button className="icon">
//                                     <i
//                                         className="fas fa-user-minus"
//                                         onClick={() => deleteData(key)}
//                                     />
//                                 </button>
//                             </div>
//                         </div>
//                     )}
//                 </div>
//             </div>
//         );
//     };
//
//     const Field = ({label = "", name = "", value = "", onChange}) => {
//         return (
//             <div className="field">
//                 <label htmlFor={name}>{label}</label>
//                 <input type="text" name={name} value={value} onChange={onChange}/>
//             </div>
//         );
//     };
//
//     const Form = ({setState, onChange, onSubmit}) => {
//         return (
//             <form className="form" onSubmit={onSubmit}>
//                 <fieldset>
//                     <Field
//                         name="name"
//                         label="name"
//                         value={setState.name}
//                         onChange={onChange}
//                     />
//                     <Field
//                         name="role"
//                         label="role"
//                         value={setState.role}
//                         onChange={onChange}
//                     />
//                     <Field
//                         name="obs"
//                         label="obs"
//                         value={setState.obs}
//                         onChange={onChange}
//                     />
//                 </fieldset>
//                 <button>{setState.mode}</button>
//             </form>
//         );
//     };
//
//
//     return (
//
//         <div>
//             <Form onSubmit={onSubmit}
//                   onChange={onChange}
//                   setData={setData}/>
//
//
//             <Table data={data}
//                    updateData={updateData}
//                    deleteData={deleteData}/>
//         </div>
//
//
//     )
// }
//
//
// export default TableForm