import React, {Fragment} from 'react';

import {Table, Row, Col, Button, Input, CustomInput} from 'reactstrap';
import {Filter, DefaultColumnFilter} from './filter';
import {useExpanded, useFilters, usePagination, useSortBy, useTable} from "react-table";

const TableContainer = ({columns, data, renderRowSubComponent}) => {
    const {
        getTableProps,
        getTableBodyProps,
        headerGroups,
        page,
        prepareRow,
        visibleColumns,
        canPreviousPage,
        canNextPage,
        pageOptions,
        pageCount,
        gotoPage,
        nextPage,
        previousPage,
        setPageSize,
        state: {pageIndex, pageSize},
    } = useTable(
        {
            columns,
            data,
            defaultColumn: {Filter: DefaultColumnFilter},
            initialState: {pageIndex: 0, pageSize: 10},
        },
        useFilters,
        useSortBy,
        useExpanded,
        usePagination
    );

    const generateSortingIndicator = (column) => {
        return column.isSorted ? (column.isSortedDesc ? ' 🔽' : ' 🔼') : '';
    };

    const onChangeInSelect = (event) => {
        setPageSize(Number(event.target.value));
    };


    return (
        <Fragment>
            <Table bordered hover {...getTableProps()}>
                <thead className=" uppercase bg-secondary text-left text-white " key="header-1">
                {headerGroups.map((headerGroup) => (
                    <tr {...headerGroup.getHeaderGroupProps()}>
                        {headerGroup.headers.map((column) => (
                            <th className='py-6 px-2 w-64 text-xl text-center' {...column.getHeaderProps()}>
                                <div {...column.getSortByToggleProps()}>
                                    {column.render('Header')}
                                    {generateSortingIndicator(column)}
                                </div>
                                <Filter column={column}/>
                            </th>
                        ))}
                    </tr>
                ))}
                </thead>

                <tbody {...getTableBodyProps()}>
                {page.map((row) => {
                    prepareRow(row);
                    return (
                        <Fragment key={row.getRowProps().key}>
                            <tr className='hover:bg-primary hover:text-white'>
                                {row.cells.map((cell) => {
                                    return (
                                        <td className='p-2 text-sm md:text-lg border-2' {...cell.getCellProps()}>{cell.render('Cell')}</td>
                                    );
                                })}
                            </tr>
                            {row.isExpanded && (
                                <tr>
                                    <td colSpan={visibleColumns.length}>
                                        {renderRowSubComponent(row)}
                                    </td>
                                </tr>
                            )}
                        </Fragment>
                    );
                })}
                </tbody>
            </Table>

            <Row className='flex' style={{maxWidth: 1000, margin: '0 auto', textAlign: 'center'}}>
                <Col md={3}>
                    <Button
                        color='primary'
                        onClick={() => gotoPage(0)}
                        disabled={!canPreviousPage}
                        className='button p-2 bg-primary my-2 rounded-lg text-white font-bold'
                    >
                        {'<<'}
                    </Button>
                    <Button
                        color='primary'
                        onClick={previousPage}
                        disabled={!canPreviousPage}
                        className='button p-2 bg-primary my-2 ml-1 rounded-lg text-white font-bold'
                    >
                        {'<'}
                    </Button>
                </Col>
                <Col className='mt-4' md={2}>
                    Page{' '}
                    <strong>
                        {pageIndex + 1} of {pageOptions.length}
                    </strong>
                </Col>
                <Col md={3}>
                    <Button color='primary' onClick={nextPage}
                            className='button p-2 bg-primary my-2 rounded-lg text-white font-bold'
                            disabled={!canNextPage}>
                        {'>'}
                    </Button>
                    <Button
                        color='primary'
                        onClick={() => gotoPage(pageCount - 1)}
                        disabled={!canNextPage}
                        className='button p-2 bg-primary my-2 ml-1 rounded-lg text-white font-bold'
                    >
                        {'>>'}
                    </Button>
                </Col>
                <Col md={2}>
                    <CustomInput
                        id='page'
                        type='select'
                        value={pageSize}
                        className='mt-5'
                        onChange={onChangeInSelect}>
                        {[10, 20, 30, 40, 50].map((pageSize) => (
                            <option key={pageSize} value={pageSize}>
                                Show {pageSize}
                            </option>
                        ))}
                    </CustomInput>
                </Col>
            </Row>
        </Fragment>
    );
};

export default TableContainer;