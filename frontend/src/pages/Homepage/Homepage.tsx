import {useContext} from 'react'
import { Header }  from '../../layout/Header/Header';
import { Main } from './components/Main/Main';
import { Footer }  from '../../layout/Footer/Footer';
import {Slider} from './components/Slider/Slider';
import { ProductContext } from '../../context/ProductContext'

import blackWhiteSmoke from '../../../public/models/smoke-bar.jpg'
import freepikBlackWhite from '../../../public/models/blackwhhite-freepik.jpg'
import  ulfMeier from '../../../public/models/mahtla-preto-branco.jpg'


export default function Home() {
    const products = useContext(ProductContext)

   
    //Não colocar products na dependência pois o axios.get vai retornar um novo array na memória, o que a dependência
    //considera como mudança, então entraria em um loop de requests
    
    const slideImages = [blackWhiteSmoke, freepikBlackWhite, ulfMeier];
    
    return(
        <>
            <Header products={products} />
            <Slider images={slideImages} />
            <Main products={products} />
            <Footer />
        </>
    )
}