import axios from 'axios';

const api = axios.create({
    baseURL: "/"
})

//api.get não aceita somente "localhost:"

export {api} ;