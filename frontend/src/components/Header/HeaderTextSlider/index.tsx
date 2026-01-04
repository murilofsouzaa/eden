import {useState, useEffect} from "react"
import "./HeaderTextSlider.css"

export function HeaderTextSlider(){
    const texts:string[]= [
        "FRETE GRÁTIS A PARTIR DE R$239,99",
        "COMPRA SEM MEDO, A PRIMEIRA TROCA É GRÁTIS",
        "PARCELE ATÉ 12x NO CARTÃO"
    ];

    const [currentIndex, setCurrentIndex] = useState(0);

    useEffect(() => {
        const interval = setInterval(() => {
            setCurrentIndex((currentIndex)=>{
                return (currentIndex + 1) % texts.length;
            })
        }, 3000);
        
        return () => clearInterval(interval);
    }, []);
    

    return (
        <>
            <p>{texts[currentIndex]}</p>
        </>
    )
}