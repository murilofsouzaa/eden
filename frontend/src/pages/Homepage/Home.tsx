import { Header }  from '../../layout/Header/Header';
import { Main } from './components/Main/Main'
import { Footer }  from '../../layout/Footer/Footer';
import {Slider} from './components/Slider/Slider'

import blackWhiteSmoke from '../../../public/models/smoke-bar.jpg'
import freepikBlackWhite from '../../../public/models/blackwhhite-freepik.jpg'
import  ulfMeier from '../../../public/models/mahtla-preto-branco.jpg'

export default function Home() {
    
    
    const slideImages= [blackWhiteSmoke, freepikBlackWhite, ulfMeier]
    
    
    return(
        <>
            <Header></Header>
            <Slider>{
                slideImages.map((image, i) => (
                    <img src={image} key={i} className="object-cover w-full h-full"></img>
    ))    
            }</Slider>
            <Main></Main>
            <Footer></Footer>
        </>
    )
}