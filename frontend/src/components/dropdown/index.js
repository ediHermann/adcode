import React from 'react'
import cn from 'classnames'
import {useOutsideClick} from "../../utils";

const Dropdown = ({label, items, action}) => {
    const [opened, setOpened] = React.useState(false)
    const ref = React.useRef()
    const open = () => {
        setOpened(true)
    }
    const close = () => {
        setOpened(false)
    }

    useOutsideClick(ref, () => opened && close())

    return <div>
        <div className='bg-white mb-1 p-2 w-48' onClick={open}>{label}</div>
        <ul ref={ref}
            className={cn("p-4 bg-white", {
                "block": opened,
                "hidden": !opened
            })}>
            {items.map((item, idx) =>
                <li
                    className='p-2 hover:bg-gray-500'
                    value={items.find(obj => obj.value === opened)}
                    key={label + idx.toString()}
                    onChange={event => setOpened(event.currentTarget.item)}
                    onBlur={event => setOpened(event.currentTarget.item)}
                    onClick={() => {
                        item.action ? item.action(item) : action(item, idx)
                        close()
                    }}>
                    {item.name}
                </li>
            )}
        </ul>
    </div>
}

export default Dropdown



// <Dropdown
// label={'Alege un rol'}
// value={name}
// items={[
//         {
//             name: 'item 1', action: item => {
//                 (item.name)
//             }
//         },
// {
//     name: 'item 2', action: item => {
//     console.log(item.name)
// }
// },
// {
//     name: 'item 3', action: item => {
//     console.log(item.name)
// }
// }
// ]}
// />