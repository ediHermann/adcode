import  React,{Component} from "react";
import {
    Route,
    NavLink,
    HashRouter
} from "react-router-dom";
import RegisterForm from "./components/register/register-form";
import SpotList from "./pages/spot/spot_list";
import CreateSpot from "./pages/spot/create_spot";
import EditSpot from "./pages/spot/edit_spot";
class Main extends Component {
    render() {
        return (
            <HashRouter>
                <div>
                    <h1>ADCODE</h1>
                    <ul className="header">
                        <li><NavLink to="/">Home</NavLink></li>
                        <li><NavLink to="/components/register/register-form">Register</NavLink></li>
                        <li><NavLink to="/pages/spot/spot_list">Spots</NavLink></li>
                    </ul>
                    <div className="content">
                        <Route path="/components/register/register-form" component={RegisterForm}/>
                        <Route path="/pages/spot/spot_list" component={SpotList}/>
                        <Route path="/pages/spot/create_spot" component={CreateSpot}/>
                        <Route path="/pages/spot/edit_spot" component={EditSpot}/>
                    </div>
                </div>
            </HashRouter>
        );
    }
}
export default Main;