import FetchDog from "@vladblindu/fetch-dog/src/index.js";
/*************************************************************/
const baseURL='http://localhost:1337';
const apiKey='79BCD4C6A911F';
/*************************************************************/
const userToken=localStorage.getItem('userToken');
console.log("token="+userToken);

const endpoints = {
    registration: {
        //login
        url: '/registration',
        display: 'Inregistrare',
        method: 'post',
        default: true
    },
    login: {
        url: '/auth/local',
        display: 'Login',
        method: 'post',
        default: true
    },
    spotList: {
        url: '/graphql',
        display: 'UserSpots',
        method: 'post',
        default: true
    }
}
const FDOptions = {baseUrl: baseURL, apiKey: apiKey, token: userToken, endpoints: endpoints};
const fetchDog = new FetchDog.FetchDog(FDOptions);
export default fetchDog;