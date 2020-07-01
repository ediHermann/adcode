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
import Layout from "./components/layout";


class Main extends Component {
    render() {
        return (
            <HashRouter>
                <Layout>
                    <div className="content">
                        <Route path="/components/register/register-form" component={RegisterForm}/>
                        <Route path="/spot_list" render={() => <SpotList/>}/>
                        <Route path="/pages/spot/create_spot" component={CreateSpot}/>
                        <Route path="/pages/spot/edit_spot" component={EditSpot}/>
                </div>
                </Layout>
            </HashRouter>
        );
    }
}
export default Main;