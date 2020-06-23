import React from 'react'

const dash = st => st.replace(/\s/g, '-').toLowerCase();

const CheckBoxGroup = ({name, labels, setSelected, selected}) =>
    <ul>
        {labels.map(
            (label, idx) => {
                console.log(idx)
                return <li key={label}>
                    <label htmlFor={dash(label)}>{label}</label>
                    <input
                         id={dash(label)}
                         name={name}
                        type="checkbox"
                        value={idx}
                        checked={selected === idx}
                        onChange={() => {
                            setSelected(idx);

                        }}/>
                </li>
            }
        )}
    </ul>;

export default CheckBoxGroup