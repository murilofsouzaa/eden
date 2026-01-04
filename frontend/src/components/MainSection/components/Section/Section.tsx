import { Card } from "./components/Cards/Card.tsx";
import type { Products } from "../../../../services/productService.ts";
import { getAllProducts } from "../../../../services/productService.ts" 
import { useState, useEffect } from "react";
import "./Section.css";

export function Section(props){

        const [products, setProducts] = useState<Products[]>([]);

        useEffect(() => {
                getAllProducts().then(data => setProducts(data))
                return () => {
                        
                };
        }, []);

   return (
        <div className="section">
                <h2 
                        className="section-title fs-1 mb-5 mt-5 mx-3"
                        >{props.title}
                </h2>
                <div className="d-flex">
                        {products.map(product =>{
                        return <Card key={product.id} product={product}></Card>
                        })}
                </div>
        </div>
        );
}