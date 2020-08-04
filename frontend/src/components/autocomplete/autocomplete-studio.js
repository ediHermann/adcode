import React from 'react'
import db from "../dbs/fake-db";
import AutocompleteAsync from "./autocomplete-async";
import items from '../dbs/talent'

export const AutocompleteStudio = ({setFiValue, name}) => {
    const SuggestionComp = ({suggestion}) => <span>{`${suggestion.studio}`}</span>


    const displaySuggestion = item => {
        return item.studio
    }
    const httpGetter = value => new Promise(
        resolve => {
            setTimeout(() => {
                resolve(
                    () => items.filter(
                        item => item.name
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
                setFiValue(name, suggestionValue)

            }
            }
        />
    )
}