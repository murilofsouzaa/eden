import { Header }  from '../../layout/Header/Header';
import { Footer }  from '../../layout/Footer/Footer';
import {SliderMainPage} from './components/SliderMainPage'

import blackWhiteSmoke from '../../assets/models/smoke-bar.jpg'
import freepikBlackWhite from '../../assets/models/blackwhhite-freepik.jpg'
import  ulfMeier from '../../assets/models/mahtla-preto-branco.jpg'




export default function Home() {
    
    
    const slideImages= [blackWhiteSmoke, freepikBlackWhite, ulfMeier]
    
    
    return(
        <>
            <Header></Header>
            <SliderMainPage>{
                slideImages.map((image, i) => (
                    <img src={image} key={i} className="object-cover w-full h-full"></img>
    ))    
            }</SliderMainPage>
            <Footer></Footer>
        </>
    )
}