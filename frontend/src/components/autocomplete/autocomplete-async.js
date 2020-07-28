import React, {useState} from 'react'
import AutoSuggest from "react-autosuggest"
import {useField, Form, FormikProps, Formik, Field} from 'formik';

import SearchInput from "../mixt/SearchInput"

import './styles.css'
import db from "../dbs/fake-db";


const AutocompleteAsync = ({httpGetter, SuggestionComp, displaySuggestion, label, ...props}) => {
    const [field, meta, helpers] = useField(props);
    const [value, setValue] = useState("")
    const [suggestions, setSuggestions] = useState([])
    const [isLoading, setIsLoading] = useState(false)


    const onSuggestionsFetchRequested = ({value}) => {
        setIsLoading(true)
        httpGetter(value)
            .then(
                resp => {
                    setSuggestions(resp)
                    setIsLoading(false)
                })
            .catch(err => {
                console.warn('Autosuggest http request failure', err.message)
                setIsLoading(false)
            })
    }


    const onSuggestionsClearRequested = () => {
        setSuggestions([])
    }
    const renderInputComponent = inputProps =>
        <SearchInput
            isLoading={isLoading}
            inputProps={inputProps}/>



    return (
         <Field>
            <AutoSuggest suggestions={suggestions || []}
                         onSuggestionsFetchRequested={onSuggestionsFetchRequested}
                         onSuggestionsClearRequested={onSuggestionsClearRequested}
                         onSuggestionSelected={(event, {suggestion, method}) => {
                             if (method === "enter") {
                                 event.preventDefault()
                             }
                             setValue(suggestion.talent)
                            // setFieldValue('talent', suggestion.talent)
                         }}
                         getSuggestionValue={item => {
                             return item.talent}}
                         renderSuggestion={suggestion => <span>{`${suggestion.talent}`}</span>}
                         renderInputComponent={renderInputComponent}
                         inputProps={{
                             placeholder: "Search",
                             value: {...props},
                             name: name,
                             onChange: (_, {newValue}) => {
                                 setValue(newValue);
                             }
                         }}
                         highlightFirstSuggestion={true}

            />
         </Field>

    )
}

export default AutocompleteAsync