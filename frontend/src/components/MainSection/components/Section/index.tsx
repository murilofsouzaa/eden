import { Card } from "./components/Cards/index.tsx";
import type { Products } from "../../../../services/productService.ts";
import { getAllProducts } from "../../../../services/productService.ts" 
import { useState, useEffect } from "react";
import "./Section.css";

export function Section(){

        const [products, setProducts] = useState<Products[]>([]);

        useEffect(() => {
                getAllProducts().then(data => setProducts(data))
                return () => {
                        
                };
        }, []);

   return (
        <>
        {products.map(product =>{
               return <Card key={product.id} product={product}></Card>
        })}
        </>
        );
}