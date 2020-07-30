import FetchDog from "@bitbrother/fetch-dog";
import baseURL from "./config";
// /*************************************************************/
//const baseURL='http://localhost:1337';
const apiKey='79BCD4C6A911F';
//const defaultHeader= {'Content-Type': 'application/json'};
const defaultHeader1= {'Content-Type': 'application/x-www-form-urlencoded'};

const gqlEndpoint={

    url: '/graphql',
    display: 'Graphql',
    headers:{'Content-Type': 'application/x-www-form-urlencoded'},
    method: 'post'
}

const endpoints = {

    gqlEndpoint: {
        //login
        url: '/graphql',
        display: 'Graphql',
        headers:{'Content-Type': 'application/x-www-form-urlencoded'},
        method: 'post'
    },
    registration: {
        //login
        url: '/registration',
        display: 'Inregistrare',
        headers:{'Content-Type': 'application/json'},
        method: 'post'
    },
    login: {
        url: '/auth/local',
        headers:{'Content-Type': 'application/json'},
        display: 'Login',
        method: 'post'
    },
    spotList: {
        url: '/graphql',
        display: 'UserSpots',
        headers:{'Content-Type': 'application/x-www-form-urlencoded'},
        method: 'post',
        auth: true
    }
}

 //const FDOptions = {baseUrl: baseURL, baseHeaders: apiKey,  endpoints: endpoints};
 const FDOptions = {baseUrl: baseURL, endpoints: endpoints,tokenKey:'userToken',gqlEndpoint:gqlEndpoint};
 const httpAgent = FetchDog(FDOptions);
 export default httpAgent;