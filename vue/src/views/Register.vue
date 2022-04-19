<template>
  <div id="register" class="text-center">
    <form class="form-register" @submit.prevent="register">
      <h1 class="h3 mb-3 font-weight-normal">Create Account</h1>
      <div class="alert alert-danger" role="alert" v-if="registrationErrors">
        {{ registrationErrorMsg }}
      </div>
      <label for="username" class="sr-only"></label>
      <input

        type="text"
        id="username"
        class="form-control"
        placeholder="Username"
        v-model="user.username"
        required
        autofocus
      />
      <label for="password" class="sr-only"></label>
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
      <router-link :to="{ name: 'login' }">Have an account?</router-link>
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
    flex-direction: row ;
    justify-content: center;
    align-items: flex-end;
  }
  .items{
    padding: 50%;
  }
  form {
    font-family: 'Duru Sans', sans-serif;
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 25px;
    background: lightgrey;
    border: black solid 2px;
    border-radius: 15px;
    margin: 125px;
    margin-left: 150px;
  }
  #username{
    margin: 5px;
    display: flex;
    flex-direction: column;
    width: 100%;
  }
  #password{
    margin: 5px;
    display: flex;
    flex-direction: column;
    width: 100%;
  }
  #confirmPassword{
    margin: 5px;
    display: flex;
    flex-direction: column;
    width: 100%;
  }
</style>
