import {useState, useEffect} from 'react';
import './Header.css';
import logoHeader from '../../../public/logo/logo.png'
import userIcon from '../../assets/icons/user.png'
import shoppingBag from '../../assets/icons/shopping-bag.png'
import textLogo from '../../../public/logo/text.png'
import hamburgerIcon from '../../assets/icons/hamburguer.png'
import searchIcon from '../../assets/icons/search.png'

export function Header(){

    const labels : string[] = [
        "FRETE GRÁTIS ACIMA DE R$299,90",
        "COMPRE SEM MEDO, A PRIMEIRA TROCA É GRÁTIS",
        "PARCELE ATÉ 12x NO CARTÃO"
    ];

    const [currentIndex, setCurrentIndex] = useState(0);
    
    useEffect(() => {
        //retorna um ID para o clearInterval
    const interval = setInterval(() => {
        setCurrentIndex((prev) => (prev + 1) % labels.length);
    }, 3000);

    return () => {
        clearInterval(interval); //precisa ser liberado para não rodar quando o usuário trocar de paǵina
    };                          //precisa de um ID
}, [labels.length]);
    // para i = 1
    // 1 + 0 % 3 -> 1 % 3 = 1, pois 1/3 o quociente fica 0 e o resto será 1

    //TODO
    function handleSearchClick() {
        
    }

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

                <div className="flex flex-row gap-15 justify-between items-center">

                    <img src={hamburgerIcon} className="w-8 h-8 lg:hidden"></img>

                    <img src={textLogo} className="h-15 lg:hidden"></img>
                    <img src={ logoHeader} alt="eden-logo-heaeder" className="hidden lg:inline lg:w-10 lg:h-10" />

                    <div className="flex gap-4 items-center lg:hidden">
                            <a href="#"><img src={userIcon} alt="user-icon" className="h-6 w-auto object-contain"></img></a>
                            <a href="#"><img src={shoppingBag} alt="shopping-bag-icon" className="h-6 w-auto object-contain"></img></a>
                    </div>
                </div>

                <div className="flex gap-3 lg:flex lg:justify-center lg:items-center lg:gap-10">
                    <div className="search-input flex justify-center items-center border-b-1 p-2">
                        <form>
                            <input type="search" placeholder="Buscar" className="focus:outline-0" />
                        </form>
                        <button onClick={handleSearchClick}><img src={searchIcon} className="hover:cursor-pointer w-auto h-6 m"></img></button>
                    </div>

                   
                    <div className="hidden lg:flex lg:gap-4">
                        <a href="#"><img src={userIcon} alt="user-icon" className="h-6 w-auto object-contain"></img></a>
                        <a href="#"><img src={shoppingBag} alt="shopping-bag-icon" className="h-6 w-auto object-contain"></img></a>
                    </div>
                </div>
            </nav>
        </div>
    )
}