import React, {useState} from 'react'


const DeleteButton = () => {
    //initial state va fi initialList
    [list, setList] = useState('')

    function handleRemove(id) {
        const newList = list.filter((item) => item.id !== id)

        setList(newList)
    }
    return <List list={list} onRemove={handleRemove}/>
}

const List = ({list, onRemove}) => (
    <ul>
        {list.map((item) => (
            <Item key={item.id} item={item} onRemove={onRemove}/>
        ))}
    </ul>
)
const Item = ({ item, onRemove }) => (
    <li>
        <span>{item.firstname}</span>
        <span>{item.lastname}</span>
        <span>{item.year}</span>
        <button type="button" onClick={() => onRemove(item.id)}>
            Remove
        </button>
    </li>
);

export default DeleteButton