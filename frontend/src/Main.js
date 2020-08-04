import React, {Component} from "react"
import {
    Route,
    HashRouter
} from "react-router-dom"

import SpotList from "./pages/spot/spot_list"
import Home from "./pages/home"
import Login from "./pages/login"
import Profile from "./pages/profile/profile"
import RegisterTalent from "./pages/registerTalent"
import RegisterStudio from "./pages/registerStudio"
import RegisterBroadcaster from "./pages/registerEmitator"
import RegisterArbiter from "./pages/registerArbiter"
import Layout from "./components/layout"

import LogOut from "./pages/logout"
import CreateSpot from "./pages/spot/create_spot"
import Other2 from "./pages/other2"
import MySpotsNew from "./pages/mySpotsNew";
import BroadcastTable from "./pages/broadcastTable";



class Main extends Component {
    render() {
         const  isAuthenticated = localStorage.getItem('isAuthenticated') ;
         console.log(isAuthenticated);
         if (isAuthenticated==='1')
            return (
                <HashRouter>
                    <Layout>
                        <div className="content">
                            <Route path="/home" render={() => <Home/>}/>
                            <Route path="/spot_list" render={() => <SpotList/>}/>
                            <Route path="/profile" render={() => <Profile/>}/>
                            <Route path="/other2" render={() => <Other2/>}/>
                            <Route path="/create_spot" render={() => <CreateSpot/>}/>
                            <Route path="/logout"  render={() => <LogOut/>}/>
                            <Route path="/my_spots" render={() => <MySpotsNew/>}/>
                            <Route path="/other1" render={() => <BroadcastTable/>}/>
                        </div>
                    </Layout>
                </HashRouter>
            )
        else
            return (
                <HashRouter>
                    <div className="content">
                        <Route path='/' render={() => <Login/>}/>
                        <Route path="/home" render={() => <Home/>}/>
                        <Route path="/cont_talent" render={() => <RegisterTalent/>}/>
                        <Route path="/cont_producator" render={() => <RegisterStudio/>}/>
                        <Route path="/cont_emitator" render={() => <RegisterBroadcaster/>}/>
                        <Route path="/cont_arbitru" render={() => <RegisterArbiter/>}/>
                    </div>
                </HashRouter>
            );
    }
}

export default Main;

