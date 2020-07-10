import React, {useEffect, useState, useMemo} from 'react';
import {
    Card,
    CardImg,
    CardText,
    CardBody,
    CardTitle,
} from 'reactstrap';
import TableContainer from './TableContainer';
import {SelectColumnFilter} from './filter';

const Table = () => {
    const [data, setData] = useState([]);
    useEffect(() => {
        const doFetch = async () => {
            const response = await fetch('https://randomuser.me/api/?results=100');
            const body = await response.json();
            const contacts = body.results;
            console.log(contacts);
            setData(contacts);
        };
        doFetch();
    }, []);

    const renderRowSubComponent = (row) => {
        const {
            name: {first, last},
            location: {city, street, postcode},
            picture,
            cell,
        } = row.original;
        return (
            <Card style={{width: '18rem', margin: '0 auto'}}>
                <CardImg top src={picture.large} alt='Card image cap'/>
                <CardBody>
                    <CardTitle>
                        <strong>{`${first} ${last}`} </strong>
                    </CardTitle>
                    <CardText>
                        <strong>Phone</strong>: {cell} <br/>
                        <strong>Address:</strong>{' '}
                        {`${street.name} ${street.number} - ${postcode} - ${city}`}
                    </CardText>
                </CardBody>
            </Card>
        );
    };

    const columns = useMemo(
        () => [
            {
                Header: () => null,
                id: 'expander', // 'id' is required
                Cell: ({row}) => (
                    <span {...row.getToggleRowExpandedProps()}>
            {row.isExpanded ? '👇' : '👉'}

          </span>
                ),
            },
            {
                Header: 'Title',
                accessor: 'name.title',
                disableSortBy: true,
                Filter: SelectColumnFilter,
                filter: 'equals',
            },
            {
                Header: 'First Name',
                accessor: 'name.first',
            },
            {
                Header: 'Last Name',
                accessor: 'name.last',
            },
            {
                Header: 'Email',
                accessor: 'email',
            },
            {
                Header: 'City',
                accessor: 'location.city',
            },
        ],
        []
    );

    return (
        <div className="flex-center p-2 mt-20 w-full h-full">
            <div className='flex justify-center'>
                <div>
                    <TableContainer
                        columns={columns}
                        data={data}
                        renderRowSubComponent={renderRowSubComponent}
                    />
                </div>
            </div>
        </div>
    )
}

export default Table