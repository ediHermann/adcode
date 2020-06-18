import React from 'react'

const dash = st => st.replace(/\s/g, '-').toLowerCase();

const RadioGroup = ({labels, setSelected, selected}) =>
    <ul>
        {labels.map(
            (label, idx) =>
                <li key={label}>
                    <label htmlFor={dash(label)}>{label}</label>
                    <input
                        id={dash(label)}
                        type="radio"
                        value={idx}
                        checked={selected === idx}
                        onChange={() => {
                            setSelected(idx);

                        }}/>
                </li>
        )}
    </ul>;

export default RadioGroup