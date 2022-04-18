import axios from "axios";

export default {
    SubmitReview(review){
        return axios.post('/reviews', review)
    }
}