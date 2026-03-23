import {useEffect, useState} from 'react';
import {api} from '../../../../services/api.js';

type ProductVariant = {
    id: number;
    price: number;
    defaultVariant: boolean;
};

type Product = {
    id: number;
    title: string;
    imageUrl: string;
    variants: ProductVariant[];
};

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
                {products.map((product:Product) => {
                    const variants = product.variants ?? [];
                    const defaultVariant = variants.find((variant) => variant.defaultVariant);
                    const variantToShow = defaultVariant ?? variants[0];
                    return (
                        <div key={product.id} className="shrink-0 w-64 m-10 sm:w-72 lg:w-80">
                            <img src={`http://localhost:8080/${product.imageUrl}`} alt={product.title} className="object-contain w-full h-[28rem]"></img>
                            <p>{product.title}</p>
                            {variantToShow?.price !== undefined && variantToShow?.price !== null && (
                                <p className="text-md font-semibold">R$ {variantToShow.price.toFixed(2)}</p>
                            )}
                        </div>
                    );
                })}
            </div>
        </>
    )
}