import {useState, useEffect} from 'react';
import logoHeader from '../../src/assets/logo/logo.png'
import userIcon from '../../src/assets/icons/user.png'
import shoppingBag from '../assets/icons/shopping-bag.png'
import textLogo from '../assets/logo/text.png'
import hamburgerIcon from '../assets/icons/hamburguer.png'

export function Header(){

    const labels : string[] = [
        "FRETE GRÁTIS ACIMA DE R$299,90",
        "COMPRE SEM MEDO, A PRIMEIRA TROCA É GRÁTIS",
        "PARCELE ATÉ 12x NO CARTÃO"
    ];


    const [currentIndex, setCurrentIndex] = useState(0);
    
    
    useEffect(() => {
        setInterval(() => {
            for(let i = 0; i < labels.length ; i++){
                setCurrentIndex((prev) => (prev + 1) % labels.length);
            }
        }, 3000);
        return () => {
            clearInterval(currentIndex);
        };
    }, []);

    // para i = 1
    // 1 + 0 % 3 -> 1 % 3 = 1, pois 1/3 o quociente fica 0 e o resto será 1

    return (
        <div className="m-0 p-0">
            <div className="bg-gray-200 p-2 text-center">{labels[currentIndex]}</div>

            <nav className="flex flex-col gap-3 justify-between items-center m-4 p-4 lg:flex lg:flex-row lg:justify-between lg:items-center lg:m-4 lg:p-4">
                <ul className="hidden lg:visible lg:flex lg:gap-7">
                    <li><a href="#">Mulheres</a></li>
                    <li><a href="#">Homens</a></li>
                    <li><a href="#">Acessórios</a></li>
                    <li><a href="#">Explorar</a></li>
                </ul>

                <div className="flex flex-row gap-20 justify-between items-center">

                    <img src={hamburgerIcon} className="w-8 h-8"></img>

                    <img src={textLogo} className="h-15 lg:hidden"></img>
                    <img src={ logoHeader} alt="eden-logo-heaeder" className="hidden lg:inline lg:w-10 lg:h-10" />

                    <div className="flex gap-4 items-center lg:flex lg:gap-4">
                            <a href="#"><img src={userIcon} alt="user-icon" className="w-6 h-6"></img></a>
                            <a href="#"><img src={shoppingBag} alt="shopping-bag-icon" className="w-6 h-6"></img></a>
                    </div>
                </div>

                <div className="flex gap-3 lg:flex lg:justify-center lg:items-center lg:gap-10">
                    <div className="search-input">
                        <input type="text" placeholder="Buscar" className="p-2 border-1 rounded-xl bg-gray-100" />
                    </div>
                </div>
            </nav>
        </div>
    )
}