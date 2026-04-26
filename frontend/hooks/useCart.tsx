import {useContext} from "react";
import CartContext from '../src/context/CartContext'

function useCart() {
    return useContext(CartContext)
}
 
export default useCart;