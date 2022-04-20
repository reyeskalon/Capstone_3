import axios from "axios";

export default {
    SubmitReview(review){
        return axios.post('/reviews', review)
    },
    GetReviewByBeerId(beerId){
        return axios.get('/reviews/' + beerId)
    }
}