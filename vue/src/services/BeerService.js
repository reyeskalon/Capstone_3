import axios from 'axios';

export default {

    SetLikedBeers(brewerId){
        return axios.get('/favoritebeers/' + brewerId)
    }
  
}