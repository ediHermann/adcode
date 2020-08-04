import React from 'react'
import AutocompleteAsync from "./autocomplete-async";
import items from '../dbs/talent'

export const AutocompleteTalent = ({setValue, name}) => {
    const SuggestionComp = ({suggestion}) => <span>{`${suggestion.talent}`}</span>


    const displaySuggestion = item => {
        return item.talent
    }
    const httpGetter = value => new Promise(
        resolve => {
            setTimeout(() => {
                resolve(
                    () => items.filter(
                        item => item.talent
                            .toLowerCase()
                            .includes(value.trim().toLowerCase())))
            }, 500)
        })
    return (
        <AutocompleteAsync
            httpGetter={httpGetter}
            SuggestionComp={SuggestionComp}
            displaySuggestion={displaySuggestion}
            onSuggestionSelected={(_, {suggestionValue}) => {
                setValue(name, suggestionValue)

            }
            }
        />
    )
}