
import {useContext} from 'react'
import {ProductContext} from '../src/context/ProductContext'

function useProducts() {
    return useContext(ProductContext)
} 
 
export default useProducts;