import  React,{Component} from "react";
import {
    Route,
    HashRouter
} from "react-router-dom";
import SpotList from "./pages/spot/spot_list";
import Home from "./pages/home";
import Login from "./pages/login";
import Settings from "./pages/settings";
import Profile from "./pages/profile";
import RegisterTalent from "./pages/registerTalent";
import RegisterStudio from "./pages/registerStudio";
import RegisterBroadcaster from "./pages/registerEmitator";
import RegisterArbiter from "./pages/registerArbiter";
import Layout from "./components/layout";
import RegisterForm from "./components/register/register-form";


class Main extends Component {
    render() {
        return (
            <HashRouter>
                    <Layout>
                        <div className="content">
                            <Route path="/home" render={() => <Home/>}/>
                            <Route path="/spot_list" render={() => <SpotList/>}/>
                            <Route path="/settings" render={() => <Settings/>}/>
                            <Route path="/profile" render={() => <Profile/>}/>
                            <Route path="/cont_talent" render={() => <RegisterForm/>}/>
                            <Route path="/cont_producator" render={() => <RegisterStudio/>}/>
                            <Route path="/cont_emitator" render={() => <RegisterBroadcaster/>}/>
                            <Route path="/cont_arbitru" render={() => <RegisterArbiter/>}/>
                        </div>
                    </Layout>

                    {/*<Login/>*/}
                    {/*    <div className="content">*/}
                    {/*        <Route path="/home" render={() => <Home/>}/>*/}
                    {/*        <Route path="/spot_list" render={() => <SpotList/>}/>*/}
                    {/*        <Route path="/settings" render={() => <Settings/>}/>*/}
                    {/*        <Route path="/profile" render={() => <Profile/>}/>*/}
                    {/*        <Route path="/cont_talent" render={() => <RegisterTalent/>}/>*/}
                    {/*        <Route path="/cont_producator" render={() => <RegisterStudio/>}/>*/}
                    {/*        <Route path="/cont_emitator" render={() => <RegisterBroadcaster/>}/>*/}
                    {/*        <Route path="/cont_arbitru" render={() => <RegisterArbiter/>}/>*/}
                    {/*    </div>*/}
            </HashRouter>
        );
    }
}
export default Main;