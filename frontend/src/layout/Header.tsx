import {useState, useEffect} from 'react';

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
        <>
            <div className="bg-gray-200 p-2 text-center">{labels[currentIndex]}</div>
            <div></div>
        </>
    )
}