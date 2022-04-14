import axios from 'axios';

export default {

GetBreweries(){
    return axios.get('/breweries');
}
  
}