import FetchDog from "@vladblindu/fetch-dog";
// /*************************************************************/
const baseURL='http://localhost:1337';
const apiKey='79BCD4C6A911F';

const defaultHeader= {'Content-Type': 'application/json'};
const endpoints = {
    registration: {
        //login
        url: '/registration',
        display: 'Inregistrare',
        method: 'post'
    },
    login: {
        url: '/auth/local',
        display: 'Login',
        method: 'post'
    },
    spotList: {
        url: '/graphql',
        display: 'UserSpots',
        method: 'post'
    }
}

 //const FDOptions = {baseUrl: baseURL, baseHeaders: apiKey,  endpoints: endpoints};
 const FDOptions = {baseUrl: baseURL, endpoints: endpoints,baseHeaders: defaultHeader, param:""};
 const httpAgent = FetchDog(FDOptions);
 export default httpAgent;