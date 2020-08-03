import React from 'react'

const dash = st => st.replace(/\s/g, '-').toLowerCase();

const RadioGroup = ({labels, setSelected, selected}) =>
    <ul className='flex'>
        {labels.map(
            (label, idx) =>
                <li key={label}>
                    <input
                        id={dash(label)}
                        type="radio"
                        value={idx}
                        checked={selected === idx}
                        className='mb-10 mr-1 cursor-pointer'
                        onChange={() => {
                            setSelected(idx);
                        }}/>
                    <label className='text-sm md:text-lg mr-24 cursor-pointer ' htmlFor={dash(label)}>{label}</label>
                </li>
        )}
    </ul>;

export default RadioGroup