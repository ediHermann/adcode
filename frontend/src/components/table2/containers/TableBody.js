import React, {useRef, useState} from 'react'
import Editable from "../editable";
import {Autocomplete} from "../../autocomplete";
import AutocompleteAsync from "../../autocomplete/autocomplete-async";


const TableBody = ({header, rows}) => {

    const inputRef = useRef();
    // const textareaRef = useRef();
    const [name, setName] = useState("");


    const columns = header ? header.length : 0
    const showSpinner = rows === null

    function buildRow(row, header) {
        return (
            <tbody key={row.uid} className='hover:bg-primary hover:text-white'>
            {header.map((value, index) => {
                return <div>
                    <tr key={index}>
                        <td key={index} className='p-2 text-sm md:text-lg border-2'>
                            <AutocompleteAsync/>
                        </td>
                        <td><Autocomplete/></td>
                        <td>
                            <div className="px-4 pb-4">
                                <Editable
                                    text={name}
                                    placeholder="Write a task name"
                                    childRef={inputRef}
                                    type="input"
                                >
                                    <input
                                        ref={inputRef}
                                        type="text"
                                        name="name"
                                        className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline border-blue-300"
                                        placeholder="Write a task name"
                                        value={name}
                                        onChange={e => setName(e.target.value)}
                                    />
                                </Editable>
                            </div>
                        </td>
                    </tr>
                </div>

            })}

            </tbody>
        )
    }

    return (
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
        {!showSpinner && rows && rows.map((value) => {
            return buildRow(value, header);
        })}
        </tbody>
    )
}

export default TableBody