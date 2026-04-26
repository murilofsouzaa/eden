import { ChevronLeft, ChevronRight } from 'react-feather';
import {useState, useEffect} from 'react';

type SliderProps = {
    readonly images: string[];
};

export function Slider({ images }: SliderProps) {
    const slides = images;
    const [currentIndex, setCurrentIndex] = useState(0);

    const prev = () =>
        setCurrentIndex((current) => (current === 0 ? slides.length - 1 : current - 1)); // Se tiver no começo, vai para o final, senão volta um

    const next = () =>
        setCurrentIndex((current) => (current === slides.length - 1 ? 0 : current + 1)); // Se tiver no final, volta pro começo, senão avança um

    useEffect(() => {
        if (slides.length === 0) return;
        const interval = setInterval(() => {
            setCurrentIndex((prevIndex) => (prevIndex + 1) % slides.length);
        }, 8000);
        return () => {
            clearInterval(interval);
        };
    }, [slides.length]);
	
    return (
        <div className="">
            <div className="h-80 w-full overflow-hidden relative lg:h-170">
                <div className="flex h-full w-full object-cover lg:object[60%_30%]">
                    <div
                        className="flex transition-transform ease-out duration-1000"
                        style={{transform: `translateX(-${currentIndex * 100}%)`}}
                        // Cada slide ocupa 100% da tela, então conforme o índice: 0 -> -0% ; 1 -> -100%
                    >
                        {slides.map((image) => (
                            <div
                                key={image}
                                className="h-full w-full flex shrink-0 justify-between items-center"
                            >
                                <img src={image} alt="Banner de destaque" className="object-cover w-full h-full" />
                            </div>
                        ))}
                    </div>
                </div>
                <div className="absolute inset-0 flex items-center justify-between p-4">
                    <button onClick={prev} className="p-3 rounded-full shadow bg-black hover:invert hover:cursor-pointer ">
                        <ChevronLeft className="invert w-auto h-5 duration-100 hover:scale-110" />
                    </button>
                    <button onClick={next} className="p-3 rounded-full shadow hover:invert bg-black hover:cursor-pointer ">
                        <ChevronRight className="invert w-auto h-5 duration-100 hover:scale-110" />
                    </button>

                    <div className="absolute bottom-4 right-0 left-0">
                        <div className="flex justify-center items-center gap-2">
                            {slides.map((image, i) => (
                                <div
                                    key={`${image}-${i}`}
                                    className={`w-1 h-1 bg-white rounded-full 
                                        ${currentIndex === i ? 'p-1' : 'bg-opacity-20'}`}
                                >

                                </div>
                            ))}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
}