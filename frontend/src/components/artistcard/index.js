import React from "react";
import PropTypes from "prop-types";

import CardImg from "./containers/cardImg";
import CardName from "./containers/CardName";
import CardInfo from "./containers/cardInfo";
import Container from "./containers/Container";
import CardsContainer from "./containers/CardsContainer";
import Card from "./artistCard";
import AppIcon from "./containers/AppIcon";


const ArtistCard = ({cards}) =>
    <Container>
        <CardsContainer>
            {/*{cards.map((artist, idx)=>(*/}
                <Card  className="mb-8">

                    <CardImg>
                        {/*{artist.image}*/}
                        <AppIcon/>
                    </CardImg>

                    <CardName>
                        {/*{artist.title}*/}

                    </CardName>

                    <CardInfo>
                        {/*{artist.body}*/}
                      fhivnsdo
                    </CardInfo>
                </Card>
            {/*))}*/}
        </CardsContainer>
    </Container>


ArtistCard.propTypes = {
    title: PropTypes.string,
    image: PropTypes.string
};

export default ArtistCard;
