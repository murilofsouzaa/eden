import "./Card.css";
import type { Products } from "../../../../../../services/productService.ts";

interface CardProps {
  product: Products;
}

export function Card({product}:CardProps){  
  return (
    <div className="card">
      {
        <>
          <img src={product.imgUrl} className="w-100 h-100 object-fit-cover"></img>
          <h3>{product.title}</h3>
          <p>{
            new Intl.NumberFormat('pt-BR',
              {
                style: 'currency',
                currency: 'BRL'
              }).format(product.price)}</p>
        </>
      }
    </div>
  );
}