import React, { useState} from 'react'
import AutoSuggest from "react-autosuggest"


import SearchInput from "../mixt/SearchInput"

import './styles.css'


    const AutocompleteAsync = ({httpGetter, SuggestionComp, displaySuggestion, name, setFValue}) => {
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
        <div>
            <AutoSuggest suggestions={suggestions || []}

                onSuggestionsFetchRequested={onSuggestionsFetchRequested}
                onSuggestionsClearRequested={onSuggestionsClearRequested}
                onSuggestionSelected={(_, {suggestionValue}) =>

                       // const elem = document.getElementsByName(mirrorInput)[0]
                       // elem.value = suggestionValue
                       //
                       // elem.props.handleChange (new Event('change'))
                       // document.getElementsByName(mirrorInput)[0].value = suggestionValue
                       //  elem.dispatchEvent(new Event('change', {
                       //      bubbles: true
                       //  }))

                    {
                        console.log("Selected name: " + suggestionValue);
                        setFValue(name, suggestionValue)
                        //setFieldValue(value,suggestionValue.talent);

                    }


                }
                getSuggestionValue={displaySuggestion}
                renderSuggestion={suggestion => <SuggestionComp suggestion={suggestion}/>}
                renderInputComponent={renderInputComponent}
                inputProps={{
                    placeholder: "Search",
                    value: value,
                    name:name,
                    onChange: (_, {newValue}) => {
                        setValue(newValue);
                    },
                    onBlur:() => {
                        console.log('fgbdfgdf' + value)
                    }

                }}
                highlightFirstSuggestion={true}
            />
        </div>
    )
}

export default AutocompleteAsync