import {useState, useEffect} from 'react';
import './Header.css';
import {Cart} from './Cart/Cart';
import logoHeader from '../../../public/logo/logo.png';
import userIcon from '../../../public/icons/user.png';
import shoppingBag from '../../../public/icons/shopping-bag.png';
import textLogo from '../../../public/logo/text.png';
import hamburgerIcon from '../../../public/icons/hamburguer.png';
import searchIcon from '../../../public/icons/search.png';

import type { Product } from '../../context/ProductContext';

type HeaderProps = {
    readonly products: Product[];
};

const labels : string[] = [
    "FRETE GRÁTIS ACIMA DE R$299,90",
    "COMPRE SEM MEDO, A PRIMEIRA TROCA É GRÁTIS",
    "PARCELE ATÉ 12x NO CARTÃO"
];

export function Header({ products }: HeaderProps){
    
    const [currentIndex, setCurrentIndex] = useState(0);
    const [active, setActive] = useState(false);
    
    
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

    function handleShoppingBagClick(){
        setActive((prev) => (!prev))
    }

    return (
        <div className="fixed z-101 w-full bg-white border-b-2 border-b-black/10">
            <div className="flex flex-col m-0 p-0">
                <div className="bg-gray-200 p-2 text-center">{labels[currentIndex]}</div>
                <nav className="flex flex-col gap-3 justify-between items-center m-4 p-4 
                    lg:flex lg:flex-row lg:justify-between lg:items-center lg:m-4 lg:p-4">
                    <ul className="hidden 
                        lg:visible lg:flex lg:gap-7">
                        <li><a href="#">Mulheres</a></li>
                        <li><a href="#">Homens</a></li>
                        <li><a href="#">Acessórios</a></li>
                        <li><a href="#">Explorar</a></li>
                    </ul>
                    
                    <img src={ logoHeader} alt="eden-logo-heaeder" className="hidden lg:inline lg:w-13 lg:h-13" />

                        <div className="flex gap-3 lg:flex lg:justify-center lg:items-center lg:gap-10">
                            <div className="search-input flex justify-center items-center border-b p-2">
                                <form>
                                    <input type="search" placeholder="Buscar" className="focus:outline-0 w-[300px]" />
                                </form>
                                <button onClick={handleShoppingBagClick} className="cursor-pointer">
                                    <img src={searchIcon} className="w-auto h-6"></img>
                                </button>
                            </div>
                            <div className="hidden lg:flex lg:gap-4">
                                <a href="#" className="hover:translate-y-[-10px] ease-in-out duration-300 py-5">
                                    <img src={userIcon} alt="user-icon" className="h-6 w-auto object-contain"></img>
                                </a>
                                <button onClick={handleShoppingBagClick} className="cursor-pointer py-5
                                hover:translate-y-[-10px] ease-in-out duration-300">
                                    <img src={shoppingBag} alt="shopping-bag-icon" className="h-6 w-auto object-contain"></img>
                                </button>
                            </div>
                        </div>
                    
                        <div className="lg:hidden flex flex-col gap-10 justify-around items-center w-100">
                            <div className="flex flex-row justify-between items-center gap-5">
                                <img src={hamburgerIcon} className="w-8 h-8 lg:hidden"></img>
                                <div className="flex flex-row items-center justify-center">
                                    <img src={textLogo} className="h-14 lg:hidden"></img>
                                    <img src={logoHeader} alt="eden-logo-header" className="h-14 w-auto lg:hidden"/>
                                </div>
                            </div>
                        </div>
                </nav>
            </div>
            <div className="">
                {active === true && (
                    <Cart products={products} onClose={() => setActive(false)}/>
                )}
            </div>
        </div>
    )
}