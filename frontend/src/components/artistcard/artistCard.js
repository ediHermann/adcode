import React from "react";
import ArtistCard from "./index";
import AppIcon from "./containers/AppIcon";



const cardData = [
    {
        title: 'Inoveaza',
        image: <AppIcon/>,
        body: 'atat accesul la materiale audio cât și procesele tranzacționale de producere a acestora prin utilizarea unui mediu atât de dinamic cum este internetul.'
    },
    {
        title: 'Libereaza',
        image: <AppIcon/>,
        body: 'piața de servicii conexe domeniului, dând posibilitatea unei largi categorii de prestatori și angajatori de a-și prezenta și/sau contracta servicii din domeniu.'
    },
    {
        title: 'Stimuleaza',
        image: <AppIcon/>,
        body: 'o piață în creștere, prin facilitarea accesului editurilor mai mici la servicii de producție de audiobook-uri și alte servicii de text-to-audio.'
    }
];

const Card = () => <ArtistCard cards={cardData}/>;


export default Card