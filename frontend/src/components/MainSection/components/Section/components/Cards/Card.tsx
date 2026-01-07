import "./Card.css";
import type { Products } from "../../../../../../services/productService.ts";

type CardVariant = "best-seller" | "category" | "default";

interface CardProps {
  product: Products;
  variant?:CardVariant;
}

const category = (category?:string)=>{
  switch (category) {
    case "shirts":
      return "Camisetas"

    case "t_shirts":
      return "Camisas"

    case "pants":
      return "Calças";
    
    case "shoes":
      return "Sapatos";
    
    case "caps":
      return "Bonés"

    default:
      return "";
  }
}

export function Card({product, variant = "default"}:CardProps){  
  return (
    <div className={`card card-${variant}`}>
      {variant === 'category' && (
        <>
          <img src={product.imgUrl} className={`img-card-${variant} object-fit-cover`}></img>
          <div>
            <h3>{category(product.category) == undefined ? "" : category(product.category).toUpperCase()}</h3>
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