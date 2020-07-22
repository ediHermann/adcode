import React, {useState} from 'react'
import AutocompleteAsync from "../autocomplete/autocomplete-async";
import db from './fake-db'
import Autocomplete from "../autocomplete/autocomplete";
import dbl from "./another-db"


const TableComponent = () => {
    const [data, setData] = useState([{
        index: 0,
        name: '',
        role: '',
        obs: '',
        mode: 'add'
    }])
    let indexData = 0
    const onChange = e => {
        data[e.index] = e
    }

    // const onAdd = () => {
    //     indexData = parseFloat(indexData) + 1
    //     let updatedData = [...data]
    //     updatedData[indexData] = {index: indexData, name: '', role: '', obs: ''}
    //     setData(updatedData)
    // }
    //
    // const onAdd = (e) => {
    //     e.preventDefault()
    //     const name = e.target.querySelector("input[name='name']").value;
    //     const role = e.target.querySelector("input[name='role']").value;
    //     const obs = e.target.querySelector("input[name='obs']").value;
    //
    //     if(setData.mode === 'add'){
    //         setData({
    //             data:[
    //                 ...data,
    //                 {
    //                     name,
    //                     role,
    //                     obs,
    //                     index: data[data.length - 1].index + 1
    //                 }
    //             ]
    //         })
    //     } else if (setData.mode === 'edit'){
    //         const idx = data.find((data) => data.index === setData.index).index
    //         data[idx] = {
    //             name,
    //             role,
    //             obs,
    //             index: data[idx].index
    //         }
    //     }
    // }
    //
    // const deleteData = index => {
    //     if (data.length > 1) {
    //         let updatedData = [...data]
    //         let indexToRemove = updatedData.findIndex(x => x.index === index)
    //         if (indexToRemove > -1) {
    //             updatedData.splice(indexToRemove, 1)
    //             setData(updatedData)
    //         }
    //     }
    // }
    return (
        <div>
            <TableForm
                setData={setData}
                onChange={onChange}
                onSubmit={onAdd}
            />
            <Table
                data={data}
                deleteData={deleteData}
            />
        </div>
    )
}

const Table = ({db = [], updateData, deleteData}) => {

    return (
        <div>
            <table className='w-full table-fixed'>
                <thead className='text-white bg-primary '>
                <tr className='row '>
                    <th className='py-3'>Nume</th>
                    <th className='py-3'>Rol</th>
                    <th className='py-3'>Observations</th>
                    <th className='py-3'>/</th>
                </tr>
                </thead>

                <tbody>
                {db.map((data, idx) => {
                    return (
                        <tr key={idx} className='flex'>
                            <td>{data.name}</td>
                            <td>{data.role}</td>
                            <td>{data.obs}</td>
                            <td>
                                <button className='icon'
                                        onClick={() => updateData(idx)}>
                                    <i className="far fa-edit"/>
                                </button>
                                <button className='icon'>
                                    <i className="fas fa-user-minus"
                                       onClick={() => deleteData(idx)}
                                    />
                                </button>
                            </td>
                        </tr>
                    )
                })}
                </tbody>
            </table>
        </div>
    )
}
const TableForm = ({setState, onChange, onAdd}) => {

    const filter = itemList => value => itemList.filter(item => item.role.toLowerCase().includes(value.trim().toLowerCase()))
    const SuggestionCompLocal = ({suggestion}) => <span>{`${suggestion.role}`}</span>
    const displaySuggestionLocal = item => item.role

    const SuggestionComp = ({suggestion}) => <span>{`${suggestion.name}`}</span>
    const displaySuggestion = item => {
        return item.name
    }
    const httpGetter = value => new Promise(
        resolve => {
            setTimeout(() => {
                resolve(
                    () => db.filter(
                        item => item.name
                            .toLowerCase()
                            .includes(value.trim().toLowerCase())))
            }, 500)
        })


    return (
        <table className='w-full table-fixed' onSubmit={onAdd}>
            <thead className='text-white bg-primary '>
            <tr className='row '>
                <th className='py-3'>Nume</th>
                <th className='py-3'>Rol</th>
                <th className='py-3'>Observations</th>
            </tr>
            </thead>

            <tbody>
            <tr className='flex'>
                <td className="column pt-2">
                    <AutocompleteAsync
                        httpGetter={httpGetter}
                        SuggestionComp={SuggestionComp}
                        displaySuggestion={displaySuggestion}
                        onChange={onChange}

                    />
                </td>
                <td className="column pt-2">
                    <Autocomplete
                        filter={filter(dbl)}
                        SuggestionCompLocal={SuggestionCompLocal}
                        displaySuggestionLocal={displaySuggestionLocal}
                        onChange={onChange}

                    />
                </td>
                <td className="column pt-2">
                    <input name="message"
                           className='flex border rounded-md w-32 ml-1 sm:w-64 lg:w-64 '
                           style={{padding: '2.5px 20px', border: '1px solid #aaa'}}
                           placeholder="Observatii"
                           onChange={onChange}

                    />
                </td>
            </tr>
            </tbody>
            <button className='p-4'>{setState.mode}</button>
        </table>
    )
}
export default TableComponent