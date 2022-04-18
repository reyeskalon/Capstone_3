<template>
    <div id="brewster">
         <p id="username">{{user.username}} has requested Brewer privilege</p>
        <button v-on:click="CallApproval(user); ReloadPage();" id="approve">Approve</button>
        <button v-on:click="CallDenial(user); ReloadPage();" id="deny">Deny</button>
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
                requestBrewer: false
            }
        }
    },
    methods: {
        CallApproval(user){
            UserService.ApproveBrewer(user)
        },
        CallDenial(user){
            UserService.DenyBrewer(user)
        },
        ReloadPage() {
            window.location.reload();
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
        margin: 10px;
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
    #submit{
        background-color: rgb(128, 240, 230);
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