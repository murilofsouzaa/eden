import {useState, useEffect} from 'react'
import { api } from '../../services/api'
import { Header }  from '../../layout/Header/Header';
import { Main } from './components/Main/Main'
import { Footer }  from '../../layout/Footer/Footer';
import {Slider} from './components/Slider/Slider'

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
    const [active, setActive] = useState(false);

    useEffect(() => {
            api.get("/products")
            .then((response) => {
                setProducts(response.data)
            })
        }, []);
    
    
    const slideImages= [blackWhiteSmoke, freepikBlackWhite, ulfMeier]
    
    return(
        <>
            <Header products={products} onClose={active} handleActive={setActive}></Header>
            <Slider>{
                slideImages.map((image, i) => (
                    <img src={image} key={i} className="object-cover w-full h-full"></img>
    ))    
            }</Slider>
            <Main products={products}></Main>
            <Footer></Footer>
        </>
    )
}