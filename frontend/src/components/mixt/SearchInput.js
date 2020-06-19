import React from 'react'
import Spinner from "../svg/Spinner"
import Search from "../svg/Search"
import {DebounceInput} from "react-debounce-input";



const SearchInput = ({isLoading, inputProps}) => {
    return(
    <div>
        <DebounceInput type='text' {...inputProps} debounceTimeout={500}/>
        {isLoading ? <Spinner className=' icon'/> : <Search className='icon'/>}
    </div>
    )
}
export default SearchInput