/* eslint-disable react-refresh/only-export-components */
import {createContext, useState} from 'react'
import type {Product}  from '../context/ProductContext'

export const CartContext = createContext<Product[]>([])

export function CartProvider({children}:{children: React.ReactNode}){

    const [cart, setCart] = useState<Product[]>([])

    return ( 
        <CartContext.Provider value={cart}>
            {children}
        </CartContext.Provider>
     );
}
 
export default CartProvider;