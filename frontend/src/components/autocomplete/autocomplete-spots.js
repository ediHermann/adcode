import React from 'react'
import db from "../dbs/fake-db";
import AutocompleteAsync from "./autocomplete-async"
import items from '../dbs/talent'


export const AutocompleteSpot = ({setFValue, name}) => {
    const SuggestionComp = ({suggestion}) => <span>{`${suggestion.spot}`}</span>


    const displaySuggestion = item => {
        return item.spot
    }
    const httpGetter = value => new Promise(
        resolve => {
            setTimeout(() => {
                resolve(
                    () => talent.filter(
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

        />
    )
}