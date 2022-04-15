import axios from 'axios';

export default {

GetUsers(){
    return axios.get('/users');
},
ApproveBrewer(username){
    return axios.put(`/approvebrewer/${username}`);
},
DenyBrewer(username){
    return axios.put(`/denybrewey/${username}`);
}
}