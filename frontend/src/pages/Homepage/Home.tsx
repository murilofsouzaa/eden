import {useState, useEffect} from 'react';
import { api } from '../../services/api';
import { Header }  from '../../layout/Header/Header';
import { Main } from './components/Main/Main';
import { Footer }  from '../../layout/Footer/Footer';
import {Slider} from './components/Slider/Slider';

import blackWhiteSmoke from '../../../public/models/smoke-bar.jpg'
import freepikBlackWhite from '../../../public/models/blackwhhite-freepik.jpg'
import  ulfMeier from '../../../public/models/mahtla-preto-branco.jpg'

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
    imageUrl: string;
    variants: ProductVariant[];
};

export default function Home() {
    
    const [products, setProducts] = useState<Product[]>([]);
    const [isOpen, setIsOpen] = useState(false);

    useEffect(() => {
            api.get("/api/products")
            .then((response) => {
                setProducts(response.data)
            })
        }, []);
    
    //Não colocar products na dependência pois o axios.get vai retornar um novo array na memória, o que a dependência
    //considera como mudança, então entraria em um loop de requests
    
    const slideImages = [blackWhiteSmoke, freepikBlackWhite, ulfMeier];
    
    return(
        <>
            <Header products={products} isOpen={isOpen} setisOpen={setIsOpen}/>
            <Slider images={slideImages} isOpen={isOpen}/>
            <Main products={products} isOpen={isOpen}/>
            <Footer />
        </>
    )
}