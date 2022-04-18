import axios from 'axios';

export default {

GetBreweries(){
    return axios.get('/breweries');
},
GetBreweriesByBrewer(brewerId){
    return axios.get('/breweries/' + brewerId);
},
AddBrewery(brewery){
    return axios.post('/newbrewery', brewery);
}  
}