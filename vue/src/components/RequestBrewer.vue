<template>
    <div id="brewster">
         <p id="username">{{user.username}}</p>
        <button v-on:click="CallApproval(user.username)" id="approve">Approve</button>
        <button id="deny">Deny</button>
    </div>
</template>

<script>
import UserService from '../services/UserService';
export default {
    data(){
        return{
            currentUser: {
                userId: null,
                username: "",
                role: "",
                requestBrewer: true
            }
        }
    },
    methods: {
        CallApproval(username){
            UserService.ApproveBrewer(username)
        }
    },
    props: ['user']
    
}
</script>

<style scoped>

    #brewster{
        display:flex;
        justify-content: space-between 10px;
        background-color: #7875AC;
        border:black solid 1px;
        border-radius: 5px;
        padding: 5px;
        width: auto;
    }
    #approve{
        background-color: rgb(171, 240, 102);
        width:75px;
        height: 25px;
        align-self: center;
        border-radius: 25px;
        border-color: gray;
    }
    #deny{
        background-color: rgb(206, 84, 84);
        width:75px;
        height: 25px;
        align-self: center;
        border-radius: 25px;
        border-color: gray;
    }
    #username{
        padding: 5px;
    }
</style>