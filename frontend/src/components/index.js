import React from 'react'
import Layout from "./layout";
import {Route, Switch} from 'react-router'

const App = () =>
    <Layout>
        <Switch>
            <Route exact path={'/home'} render={() => ''}/>
            <Route exact path={'/profile'} render={() => ''}/>
        </Switch>
    </Layout>
export default App