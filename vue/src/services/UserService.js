import axios from 'axios';

export default {

GetUsers(){
    return axios.get('/users');
},
ApproveBrewer(user){
    return axios.put(`/approvebrewer/${user.username}`);
},
DenyBrewer(user){
    return axios.put(`/denybrewer/${user.username}`);
}
}