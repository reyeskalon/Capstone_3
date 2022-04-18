import axios from 'axios';

export default {

    SetLikedBeers(brewerId){
        return axios.get('/favoritebeers/' + brewerId)
    },
     GetBeerById(beerId){
        return axios.get('/beer/' + beerId)
    },
    GetBeerName(Beername){
        return axios.get('/beer/' + Beername)
    },
    GetBeerDescription(beerDescription){
        return axios.get('/beer/' + beerDescription)
    },
}

    
  
