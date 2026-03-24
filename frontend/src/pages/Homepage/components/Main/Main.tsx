import './Main.css';
import {useEffect, useState} from 'react';
import {api} from '../../../../services/api.js';
import {GenderButton} from './components/GenderButton'

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
            <h2 className="text-2xl font-semibold mt-12 ml-5 lg:text-3xl">Novidades: Power Elite</h2>

            <div className="flex overflow-x-auto">
                {products.slice(0, 8).map((product:Product) => {
                    const variants = product.variants ?? [];
                    const defaultVariant = variants.find((variant) => variant.defaultVariant);
                    const variantToShow = defaultVariant ?? variants[0];
                    return (
                        <div key={product.id} className="shrink-0 w-80 m-10 lg:w-80">
                            <a href="#"><img src={`http://localhost:8080/${product.imageUrl}`} alt={product.title} className="product-image-catalog object-cover w-full h-[24rem] lg:h-[36rem]"></img></a>
                            <p className="mt-6">{product.title}</p>
                            {variantToShow?.price !== undefined && variantToShow?.price !== null && (
                                <p className="text-md">R$ {variantToShow.price.toFixed(2)}</p>
                            )}
                        </div>
                    );
                })}
            </div>

            <GenderButton />

        </>
    )
}