import "./Card.css";
import type { Products } from "../../../../../../services/productService.ts";
import type { Order } from "../../../../../../services/orderService.ts";

type CardVariant = "best-seller" | "category" | "default";
type Gender = "feminine" | "masculine";


interface CardProps {
  product: Products;
  variant?: CardVariant;
  gender: Gender;
  order?: Order;
}

const masculineCategory = (category?:string)=>{
  switch (category) {
    case "shirts":
      return "Camisas"

    case "t_shirts":
      return "Camisetas"

    case "regatta":
      return "Regatas";

    case "pants":
      return "Calças";
    
    case "shorts":
      return "Shorts";

    case "set":
      return "Conjuntos";

    case "shoes":
      return "Sapatos";
    
    case "caps":
      return "Bonés";

    case "sweatshirts":
      return "Moletons";

    default:
      return "";
  }
}

const feminineCategory = (category?:string)=>{
  switch (category) {
    case "shirts":
      return "Camisas"

    case "t_shirts":
      return "Camisetas"

    case "regatta":
      return "Regatas";

    case "pants":
      return "Calças";
    
    case "legging":
      return "Leggings";

    case "shorts":
      return "Shorts";

    case "set":
      return "Conjuntos";

    case "shoes":
      return "Sapatos";
    
    case "caps":
      return "Bonés";

    case "sweatshirts":
      return "Moletons";

    default:
      return "";
  }
}

export function Card({product, variant = "default", gender, order}:CardProps){  
  return (
    <div className={`card card-${variant}`}>

      {variant === "best-seller" && (
        <div className="best-seller">
          <img src={product.imgUrl} className={`img-card-${variant}`}></img>
          
          <div>
          <h2 className="">{product.title}</h2>

              <p className="price">{
                new Intl.NumberFormat('pt-BR',
                  {
                    style: 'currency',
                    currency: 'BRL'
                  }).format(product.price)}</p>
             
              <p className="price-discount">{
                new Intl.NumberFormat('pt-br', {
                  style: 'currency',
                  currency: 'BRL'
                }).format(product.price * (1 - 0.35))
              }</p>
              <div className="discount">35% OFF</div>
              {order &&
                <p
                  className="solds">{order.items?.reduce((total, item) => total + item.quantity, 0)} Vendido(s)
                </p>
              }
            </div>
          </div>
      )}

      {variant === 'category'&& gender === "masculine"  && (
        <>
          <img src={product.imgUrl} className={`img-card-${variant}`}></img>
          <div>
            <h3>{masculineCategory(product.category) == undefined ? "" : masculineCategory(product.category).toUpperCase()}</h3>
            <button>COMPRE AGORA</button>
          </div>
        </>
      )}

      {variant === 'category'&& gender === "feminine"  && (
        <>
          <img src={product.imgUrl} className={`img-card-${variant}`}></img>
          <div>
            <h3>{feminineCategory(product.category) == undefined ? "" : feminineCategory(product.category).toUpperCase()}</h3>
            <button>COMPRE AGORA</button>
          </div>
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