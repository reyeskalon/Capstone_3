<template>
  <div id="login">
    <!-- FONTS -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap" rel="stylesheet">
    <!---->
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
    font-family: Roboto; /*'Duru Sans', sans-serif;*/
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: space-around;
    padding: 20px;
    background: white;
    border: black solid 2px;
    border-radius: 5px;
    margin: 220px;
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
    justify-content: flex-end;
    align-items: center;
    background-image: url('../assets/images/bottles_resized.jpg');
    background-repeat: no-repeat;
    background-position: right;
    background-color: black;
    height: 89vh;
    border-top: white 2px solid;
  }
  button {
    width: 100%;
    margin-bottom: 15px;
    font-family: Roboto;
    text-transform: uppercase;
    font-weight: 500;
    font-size: 1.1rem;
    letter-spacing: 1px;
    background-color: white;
    background-image: 
      linear-gradient(to right, 
      rgb(70, 214, 250),
      rgba(76, 0, 255, 0.671),
      rgba(129, 39, 231, 0.686), 
      rgba(87, 81, 199, 0.686));
    transition: background .2s;
  }

  button:hover {
    background-color: white;
    background-image: 
      linear-gradient(to right, 
      rgb(70, 214, 250), 
      #8d49e6);
    background: #8d49e6;
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
