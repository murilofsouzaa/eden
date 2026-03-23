import {useEffect, useState} from 'react';
import {api} from '../../../../services/api.js';

type Product= {
    id:number;
    title:string;
    price:number;
    imageUrl:string;
}

export function Main() {

    const [products, setProducts] = useState<Product[]>([]);

    useEffect(() => {
        api.get("/products")
        .then((response) => {
            setProducts(response.data)
        })
        return () => {
            
        };
    }, []);

    //Não colocar products na dependência pois o axios.get vai retornar um novo array na memória, o que a dependência
    //considera como mudança, então entraria em um loop de requests


    return(
        <>
            <h2 className="text-xl font-semibold mt-12 ml-5">Novidades: Power Elite</h2>

            <div className="flex overflow-x-auto gap-8">
                {products.map((product:Product) => (
                    <div key={product.id} className="shrink-0 w-64 m-10 sm:w-72 lg:w-80">
                        <img src={`http://localhost:8080/${product.imageUrl}`} alt={product.title} className="object-contain w-full h-[28rem]"></img>
                        <p>{product.title}</p>
                        <p>R${product.price}</p>
                    </div>
                ))}
            </div>
        </>
    )
}