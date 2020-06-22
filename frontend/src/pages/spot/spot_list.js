import React, { Component } from "react";

class SpotList extends Component {
    render() {
        return (
            <div>
                <h2>Spoturile mele</h2>
               <a href='#/pages/spot/create_spot'>Creaza un spot nou</a>
                <table>
                    <tr><td>Spot 1</td><td>Creat la 10.01.2020</td><td><a href="#/pages/spot/edit_spot">Editare</a></td></tr>
                    <tr><td>Spot 2</td><td>Creat la 16.01.2020</td><td><a href="#/pages/spot/edit_spot">Editare</a></td></tr>
                    <tr><td>Spot 3</td><td>Creat la 20.01.2020</td><td><a href="#/pages/spot/edit_spot/:spotUID">Editare</a></td></tr>
                </table>

            </div>
        );
    }
}

export default SpotList;

function Spots() {
    //let {spotUID } = useParams();
    let {spotUID } = 1;

}
