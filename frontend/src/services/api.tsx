import axios from 'axios';

const api = axios.create({
    baseURL: "http://localhost:8080"
})

//api.get não aceita somente "localhost:"

export {api} ;