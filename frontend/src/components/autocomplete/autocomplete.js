import React, {useState} from 'react'
import AutoSuggest from "react-autosuggest";

import "./styles.css";

const Autocomplete = ({filter, SuggestionComp, displaySuggestion}) => {
    const [value, setValue] = useState("");
    const [suggestions, setSuggestions] = useState([]);

    return (
        <div>
            <AutoSuggest
                suggestions={suggestions}
                onSuggestionsClearRequested={() => setSuggestions([])}
                onSuggestionsFetchRequested={({value}) => {
                    setValue(value);
                    setSuggestions(filter(value));
                }}
                onSuggestionSelected={(_, {suggestionValue}) =>
                    console.log("Selected: " + suggestionValue)
                }
                getSuggestionValue={displaySuggestion}
                renderSuggestion={suggestion => <SuggestionComp suggestion={suggestion}/>}
                inputProps={{
                    placeholder: "Search",
                    value: value,
                    onChange: (_, {newValue}) => {
                        setValue(newValue);
                    }
                }}
                highlightFirstSuggestion={true}
            />
        </div>
    );
};

export default Autocomplete