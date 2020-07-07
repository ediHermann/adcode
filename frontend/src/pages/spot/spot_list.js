import React, {Component} from "react";
import EditButton from "../../components/svg/Edit";
import AddButton from "../../components/svg/AddButton";

class SpotList extends Component {
    render() {
        return (
            <div className='ml-10'>
                <h2 className='text-2xl font-bold mb-20 mt-20'>Spoturile mele</h2>
                <a href='#/pages/spot/create_spot' className='underline '><AddButton className='inline align-bottom mr-2'/>Creaza un spot nou</a>
                <table className='table-auto'>
                    <tr className='bg-gray-500'>
                        <td className='w-1/2 px-4 py-2 font-bold'>Denumire</td>
                        <td className='w-1/4 px-4 py-2 font-bold'>Data</td>
                        <td className='w-1/4 px-4 py-2 font-bold'>Actiuni</td>
                    </tr>
                    <tr>
                        <td className='border px-4 py-2'>Spot 1</td>
                        <td className='border px-4 py-2'>Creat la 10.01.2020</td>
                        <td className='border px-4 py-2'>
                            <a href="#/pages/spot/edit_spot" className='underline'>
                                <EditButton className='mr-2 inline align-bottom'/>Editare
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td className='border px-4 py-2'>Spot 2</td>
                        <td className='border px-4 py-2'>Creat la 16.01.2020</td>
                        <td className='border px-4 py-2'>
                            <a href="#/pages/spot/edit_spot" className='underline'>
                                <EditButton className='mr-2 inline align-bottom'/>Editare
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td className='border px-4 py-2'>Spot 3</td>
                        <td className='border px-4 py-2'>Creat la 20.01.2020</td>
                        <td className='border px-4 py-2'>
                            <a href="#/pages/spot/edit_spot" className='underline'>
                                <EditButton className='mr-2 inline align-bottom'/>Editare
                            </a>
                        </td>
                    </tr>
                </table>

            </div>
        );
    }
}

export default SpotList;

function Spots() {
    //let {spotUID } = useParams();
    let {spotUID} = 1;

}
