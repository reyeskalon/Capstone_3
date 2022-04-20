<template>
  <div id="register" class="text-center">
    <form class="form-register" @submit.prevent="register">
      <div class="alert alert-danger" role="alert" v-if="registrationErrors">
        {{ registrationErrorMsg }}
      </div>
      <input
        type="text"
        id="username"
        class="form-control"
        placeholder="Username"
        v-model="user.username"
        required
        autofocus
      />
      <input
        type="password"
        id="password"
        class="form-control"
        placeholder="Password"
        v-model="user.password"
        required
      />
      <input
        type="password"
        id="confirmPassword"
        class="form-control"
        placeholder="Confirm Password"
        v-model="user.confirmPassword"
        required
      />
      <button class="btn btn-lg btn-primary btn-block" v-on:click.prevent="register" type="submit">
        Create Account
      </button>
    </form>
  </div>
</template>

<script>
import authService from '../services/AuthService';

export default {
  name: 'register',
  data() {
    return {
      user: {
        username: '',
        password: '',
        confirmPassword: '',
        role: 'user',
      },
      registrationErrors: false,
      registrationErrorMsg: 'There were problems registering this user.',
    };
  },
  methods: {
    register() {
      if (this.user.password != this.user.confirmPassword) {
        this.registrationErrors = true;
        this.registrationErrorMsg = 'Password & Confirm Password do not match.';
      } else {
        authService
          .register(this.user)
          .then((response) => {
            if (response.status == 201) {
              this.$router.push({
                path: '/login',
                query: { registration: 'success' },
              });
            }
          })
          .catch((error) => {
            const response = error.response;
            this.registrationErrors = true;
            if (response.status === 400) {
              this.registrationErrorMsg = 'Bad Request: Validation Errors';
            }
          });
      }
    },
    clearErrors() {
      this.registrationErrors = false;
      this.registrationErrorMsg = 'There were problems registering this user.';
    },
  },
};
</script>

<style scoped>
 #register {
    background-image: url('../assets/images/register_image.webp');
    background-repeat: no-repeat;
    background-position: center;
    background-color: black;
    height: 89vh;
    border-top: white 2px solid;
    display: flex;
    flex-direction: column;
    justify-content: flex-end;
    align-items: center;
  }
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
    margin: 220px;
    margin-bottom: 220px;
    width: 300px;
    height: 200px;
  }
  #username{
    display: flex;
    flex-direction: column;
    width: 100%;
  }
  #password{
    display: flex;
    flex-direction: column;
    width: 100%;
  }
  #confirmPassword{
    display: flex;
    flex-direction: column;
    width: 100%;
  }
  .form-register{
    height: 200px;
    width: 300px;
  }
  button{
    width: 100%;
    height: 30px;
    background-color: #7875AC;
    transition: background .5s;
  }
  button:hover {
    background: #54527c;
  }
  .form-control{
    height: 30px;
    border: solid 2px #7F7875AC ;
  }
  input:hover{
    background-color: lightgray;
  }
  input:focus{
    background-color: lightgray;
  }
</style>
