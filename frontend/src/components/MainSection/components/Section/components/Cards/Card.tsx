import "./Card.css";
import type { Products } from "../../../../../../services/productService.ts";

type CardVariant = "best-seller" | "category" | "default";

interface CardProps {
  product: Products;
  variant?:CardVariant;
}

export function Card({product, variant = "default"}:CardProps){  
  return (
    <div className={`card card-${variant}`}>
      {variant === 'category' && (
        <>
          <img src={product.imgUrl} className="w-100 h-100 object-fit-cover"></img>
          <div>
            <h3>{product.category.toUpperCase()}</h3>
            <button>COMPRE AGORA</button>
          </div>
        </>
            
      )}


      {variant === "best-seller" && (
        <>
          <img src={product.imgUrl} className="w-100 h-100 object-fit-cover"></img>
          <h2>{product.title}</h2>
          <p className="price">{
            new Intl.NumberFormat('pt-BR',
              {
                style: 'currency',
                currency: 'BRL'
              }).format(product.price)}</p>
        </>
      )}

      {variant === "default" && (
        <>
          <img src={product.imgUrl} className="w-100 h-100 object-fit-cover" alt={product.title}></img>
          <h2>{product.title}</h2>
        </>
      )}
    </div>
  );
}