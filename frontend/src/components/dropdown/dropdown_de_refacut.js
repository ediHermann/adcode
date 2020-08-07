import React from 'react'
import {Field} from "formik";

const DropdownRefacut = () =>
    <Field
        className='border-window rounded'
        component='select'
        name={`spotTalent[${index}].role`}
        value={values.color}
        onChange={handleChange}
        onBlur={handleBlur}
        style={{display: 'block'}}>
        <option value="" label="Alege un rol"/>
        <option value="fata" label="fata"/>
        <option value="voce" label="voce"/>
        <option value="fata + voce" label="fata + voce"/>
    </Field>

export default DropdownRefacut