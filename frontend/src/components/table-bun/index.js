import React, {useState} from 'react'
import db from "./fake-db";
import AutocompleteAsync from "../autocomplete/autocomplete-async";
import dbl from "./another-db";
import Autocomplete from "../autocomplete/autocomplete";


let tableRowIndex = 0;
function TableRow ({row, handleDataChange, deleteRow}) {
    const index = row.index
    const [name, setName] = useState(row.name);
    const [role, setRole] = useState(row.role);
    const [obs, setObs] = useState(row.obs);

    const updateValues = e => {
        let inputName = e.target.name
        let inputValue = e.target.value
        if(inputName === 'name'){
            setName(inputValue)
        }else if(inputName === 'role'){
            setRole(inputValue)
        }else if(inputName === 'obs'){
            setObs(inputValue)
        }

        handleDataChange({
            index: index,
            name: name,
            role: role,
            obs: obs
        })
    }

    const removeRow = () => {
        deleteRow(index)
    }

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

    return(
        <tr>
            {/*<td>{index + 1}</td>*/}
            <td>
                <AutocompleteAsync
                    httpGetter={httpGetter}
                    SuggestionComp={SuggestionComp}
                    displaySuggestion={displaySuggestion}
                    onChange={updateValues}
                    value={name}
                    name={name}
                />
            {/*</td>*/}
            {/*<td>*/}
                <Autocomplete
                    filter={filter(dbl)}
                    SuggestionCompLocal={SuggestionCompLocal}
                    displaySuggestionLocal={displaySuggestionLocal}
                    onChange={updateValues}
                    value={role}
                    name={role}
                />
            {/*</td>*/}
            {/*<td>*/}
                <input type="text" name="obs"  className="obs" placeholder="Observatii" value={obs} onChange={updateValues}/>
            </td>
            <td><button type="button" className="btn btn-remove" onClick={removeRow}>&times;</button></td>
        </tr>
    )
}

function Table() {
    const [tableRows, setRows] = useState([{
        index: 0,
        name: "",
        role: "",
        obs: ""
    }
    ]);



    // Receive data from TableRow
    const handleChange = data => {
        tableRows[data.index] = data
    }

    // Add New Table Row
    const addNewRow = () => {
        tableRowIndex = parseFloat(tableRowIndex) + 1
        let updatedRows = [...tableRows]
        updatedRows[tableRowIndex] = {index: tableRowIndex, name: "", role: "", obs: ""}
        setRows(updatedRows)
    }

    // Remove Table row if rows are count is more than 1
    const deleteRow = (index) => {
        if(tableRows.length > 1){
            let updatedRows = [...tableRows]
            let indexToRemove = updatedRows.findIndex(x => x.index === index);
            if(indexToRemove > -1){
                updatedRows.splice(indexToRemove, 1)
                setRows(updatedRows);
            }
        }
    }

    return (
        <div className="customers">
            <div>
                <button className="btn-add" onClick={addNewRow}>+Add</button>
            </div>
            <table className="table" id="customers">
                <thead>
                <tr>
                    <th>Nume</th>
                    <th>Rol</th>
                    <th>Observatii</th>
                    <th>/</th>
                </tr>
                </thead>
                <tbody>
                {
                    tableRows.map((row, index) => {
                        if(row)
                            return(
                                <TableRow key={index} row={row} handleDataChange={handleChange} deleteRow={deleteRow}> </TableRow>
                            )
                    })
                }
                </tbody>
            </table>

        </div>
    );
}

export default Table;