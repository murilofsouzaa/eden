/* eslint-disable react-refresh/only-export-components */
import {createContext, useState, useEffect} from 'react'
import { api } from '../services/api';

export type ProductVariant = {
    id: number;
    price: number;
    defaultVariant: boolean;
    gender: string,
    stock: number
    description:string
};

export type Product = {
    id: number;
    title: string;
    description: string;
    imageUrl: string;
    variants: ProductVariant[];
};

export const ProductContext = createContext<Product[]>([]);

export function ProductProvider({children}:{children: React.ReactNode}){

    const [products, setProducts] = useState<Product[]>([]);

    useEffect(() => {
            api.get("/api/products")
            .then((response) => {
                setProducts(response.data)
            })
        }, []);

    return ( 
            <ProductContext.Provider value={products}>
                {children}
            </ProductContext.Provider>
     );
}
 
export default ProductProvider;