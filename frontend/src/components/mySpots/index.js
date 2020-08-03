import React from 'react'


const JsonTable = require('ts-react-json-table')




const MySpots = ({row = false, cell = false, sort = false}) => {
    const [item, setItem] = React.useState('')

    const items = [
        {uid: 'Louise', title: 'cartofi', studio_name: 'red', duration: 4, created_at: 2022020, observation: 'ceva'},
        {uid: 'Margaret', title: 'morcovi', studio_name: 'blue', duration: 4, created_at: 2022020, observation: 'altceva'},
        {uid: 'Lisa', title: 'rosii', studio_name: 'yellow', duration: 4, created_at: 2022020, observation: 'totceva'}
    ]
    const columns = [
        {key: 'uid', label: 'UID'},
        {key: 'title', label: 'Titlu'},
        {key: 'studio_name', label: 'Studio name'},
        {key: 'duration', label: 'Durata'},
        {key: 'created_at', label: 'Data'},
        {key: 'observation', label: 'Observatii'},
    ];
        //nu merge sortarea in ambele directii
        if (item.sort) {
            items.sort(function (a, b) {
                return a [item.sort] > b[item.sort] ? 1 : -1
            })
        } else {
            items.sort(function (a, b) {
                return a [item.sort] < b[item.sort] ? 1 : -1
            })
        }



   const getSettings = () =>{
        return {
            keyField: 'name',
            cellClass: function( current, key, item){
                if( cell === key && row === item.name )
                    return current + ' cellSelected';
                return current;
            },
            headerClass: function( current, key ){
                if( sort === key )
                    return current + ' headerSelected';
                return current;
            },
            rowClass: function( current, item ){
                if( row === item.name )
                    return current + ' rowSelected';
                return current;
            }
        };
    }
   const onClickCell = ( e, column, item ) => {
        setItem ( {cell: column} );
    }


    const onClickHeader = ( e, column ) =>{
        setItem( {sort: column} );
    }

   const onClickRow = ( e, item ) => {
        setItem( {row: item.name} );
    }

    return (
        <div className='ml-10'>
            <h2 className='text-2xl font-bold mb-20 mt-20'>Spoturile mele</h2>
            <JsonTable
                rows={items}
                columns={columns}
                settings={getSettings}
                onClickCell={onClickCell}
                onClickHeader={onClickHeader}
                onClickRow={onClickRow}
            />
        </div>
    )


}



export default MySpots