import axios from 'axios';

export default {
    AddFavBeer(favorite){
        return axios.post('/addfavbeer', favorite)
    },
    RemoveFavBeer(favorite){
        return axios.delete('/removefavbeer', favorite)
    }
}