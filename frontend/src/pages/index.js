import React from 'react'
import Layout from "../components/layout";
import {Route, Switch, HashRouter} from 'react-router-dom'
import Home from "./home";
import Profile from "./profile";
import CreateSpot from "./spot/create_spot";
import Settings from "./settings";
import {Router} from "react-router";
import {HOME} from "../components/__constants";



const App = () =>{
const route = location.pathname
    return(
    <Router >
        <Layout>
           <Switch>
                <Route exact path={route.link(HOME)} render={() => <Home/>}/>
                <Route exact path={'/profile'} render={() => <Profile/>}/>
                <Route exact path={'/create_spot'} render={() => <CreateSpot/>}/>
                <Route exact path={'/settings'} render={() => <Settings/>}/>
           </Switch>
        </Layout>
    </Router>
    )}

export default App