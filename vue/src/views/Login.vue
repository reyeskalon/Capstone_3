<template>
  <div id="login">
    <form @submit.prevent="login">
      <div class="alert alert-danger" role="alert" v-if="invalidCredentials">
        Invalid username and password!
      </div>
      <div class="alert alert-success" role="alert" v-if="this.$route.query.registration">
        Thank you for registering, please sign in.
      </div>
      <input type="text" id="username" class="items" placeholder="Username" v-model="user.username" required autofocus />
      <input type="password" id="password" class="items" placeholder="Password" v-model="user.password" required />
      <button v-on:click.prevent="login" type="submit" class="items">Sign in</button>
    </form>
  </div>
</template>

<script>
import authService from "../services/AuthService";

export default {
  name: "login",
  components: {},
  data() {
    return {
      user: {
        username: "",
        password: ""
      },
      invalidCredentials: false
    };
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then(response => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            this.$router.push("/");
          }
        })
        .catch(error => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    }
  }
};
</script>

<style scoped>
  form {
    font-family: 'Duru Sans', sans-serif;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: space-around;
    padding: 20px;
    background: white;
    border: black solid 2px;
    border-radius: 5px;
    margin: 50px;
    margin-left: 150px;
    width: 300px;
    height: 200px;
  }
  .items {
    margin-top: 5px;
    margin-right: 15px;
    margin-bottom: 5px;
    margin-left: 15px;
    width: 100%;
    height:30px;
  }
  #login {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: flex-start;
    background-image: url('../assets/images/signup_resized.jpeg');
    background-repeat: no-repeat;
    background-position: right;
    background-color: black;
    height: 89vh;
    border-top: white 2px solid;
  }
  button {
    margin-bottom: 15px;
    background: #7875AC;
    transition: background .5s;
  }

  button:hover {
    background: #54527c;
  }
  input{
    background-color:white;
    border: solid 2px #7F7875AC ;
  }
  input:hover{
    background-color: lightgray;
  }
  input:focus{
    background-color: lightgray;
  }
</style>
