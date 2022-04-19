import axios from 'axios';

export default {

    SetLikedBeers(brewerId){
        return axios.get('/favoritebeers/' + brewerId)
    },
    GetBeerById(beerId){
        return axios.get('/beer/' + beerId)
    },
    GetBeerDescription(beerDescription){
        return axios.get('/beer/' + beerDescription)
    },
    GetAllBeers() {
        return axios.get('/beers')
    },
    AddABeer(beer){
        return axios.post('/beer/add', beer)
    },
    UpdateBeer(beer){
        return axios.put('/beer/update', beer)
    },
    GetBeersByBreweryId(breweryId){
        return axios.get('/beers/' + breweryId)
    }
}

    
  
