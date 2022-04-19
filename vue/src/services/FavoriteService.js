import axios from 'axios';

export default {
    AddFavBeer(favorite){
        return axios.post('/addfavbeer', favorite)
    }
}