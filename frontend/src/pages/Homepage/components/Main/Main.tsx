import {useCallback, useEffect, useMemo, useRef, useState} from 'react';
import { ChevronLeft, ChevronRight } from 'react-feather'
import './Main.css';
import {api} from '../../../../services/api.js';
import {GenderButton} from './components/GenderButton'

type ProductVariant = {
    id: number;
    price: number;
    defaultVariant: boolean;
    gender: string
};

type Product = {
    id: number;
    title: string;
    imageUrl: string;
    variants: ProductVariant[];
};

export function Main() {

    const [products, setProducts] = useState<Product[]>([]);

    const [gender, setGender] = useState<'female' | 'male'>('female');

    const [currentIndex, setCurrentIndex] = useState(0);
    // Guardamos métricas da vitrine para deslocar exatamente um produto por clique
    const [slideWidth, setSlideWidth] = useState(0);
    const [viewportWidth, setViewportWidth] = useState(0);
    const trackRef = useRef<HTMLDivElement | null>(null);
    const viewportRef = useRef<HTMLDivElement | null>(null);

    useEffect(() => {
        api.get("/products")
        .then((response) => {
            setProducts(response.data)
        })
        return () => {
            
        };
    }, []);

    const displayedProducts = products.slice(0, 7);
    const totalItems = displayedProducts.length;

    // Mede a largura do primeiro card (somando o gap) e o espaço visível atual
    const updateMetrics = useCallback(() => {
        const track = trackRef.current;
        const viewport = viewportRef.current;
        if (!track || !viewport) return;

        const firstSlide = track.querySelector<HTMLElement>('[data-slide="true"]');
        if (!firstSlide) return;

        const styles = globalThis.getComputedStyle(track);
        const gapValue = Number.parseFloat(styles.columnGap || styles.gap || '0') || 0;

        setSlideWidth(firstSlide.offsetWidth + gapValue);
        setViewportWidth(viewport.offsetWidth);
    }, []);

    useEffect(() => {
        updateMetrics();
        window.addEventListener('resize', updateMetrics);
        return () => window.removeEventListener('resize', updateMetrics);
    }, [updateMetrics, totalItems]);

    // Calcula quantos cards cabem de uma vez no viewport para limitar o índice máximo
    const slidesPerView = useMemo(() => {
        if (slideWidth === 0 || viewportWidth === 0) return 1;
        return Math.max(Math.floor(viewportWidth / slideWidth), 1);
    }, [slideWidth, viewportWidth]);

    const maxIndex = Math.max(totalItems - slidesPerView, 0);

    const next = () => {
        if (totalItems === 0) return;
        setCurrentIndex((currentIndex) => Math.min(currentIndex + 1, maxIndex));
    };
    
    const prev = () => {
        if (totalItems === 0) return;
        setCurrentIndex((currentIndex) => Math.max(currentIndex - 1, 0));
    };

    // Garante que nunca usamos um índice maior que o máximo calculado
    const safeIndex = Math.min(currentIndex, maxIndex);

    // Cada clique desloca exatamente a largura de um card (positivo para esquerda, por isso o sinal negativo)
    const translateValue = -(safeIndex * slideWidth);
    

    //Não colocar products na dependência pois o axios.get vai retornar um novo array na memória, o que a dependência
    //considera como mudança, então entraria em um loop de requests


        return(
		<section className="mx-4 mt-10 mb-10 lg:m-16">
            <h2 className="text-2xl font-semibold lg:mt-20 lg:text-[1.6rem]">Novidades: Power Elite</h2>

            <div className="relative">
                <div className="overflow-hidden" ref={viewportRef}>
                    <div
                        ref={trackRef}
                        className="flex flex-nowrap gap-5 transition-transform duration-500 ease-out"
                        style={{transform: `translateX(${translateValue}px)`}}
                    >
                        {displayedProducts.map((product:Product) => {
                            const variants = product.variants ?? [];
                            const defaultVariant = variants.find((variant) => variant.defaultVariant);
                            const variantToShow = defaultVariant ?? variants[0];
                            return (
                                <div key={product.id} data-slide="true">
									<div  className="shrink-0 w-64 sm:w-72 md:w-80">
                                            <a href="#"><img src={`http://localhost:8080/${product.imageUrl}`} alt={product.title} 
                                            className="product-image-catalog object-cover w-full h-[24rem] lg:h-[36rem]"></img></a>
                                        
                                            <p className="mt-6">{product.title}</p>
                                            {variantToShow?.price !== undefined && variantToShow?.price !== null && (
                                            <p className="text-md font-light">R$ {variantToShow.price.toFixed(2)}</p>
                                            )}
                                     </div>
                                    
                                </div>

                            );
                        })}
                    </div>
                </div>
                {totalItems > 0 && (
                    <div className="pointer-events-none absolute inset-0 flex items-center justify-between p-4">
                            <button onClick={prev} aria-label="Item anterior" className="pointer-events-auto p-3 rounded-full shadow bg-black hover:invert hover:cursor-pointer ">
                                <ChevronLeft className="invert w-auto h-5 duration-100 hover:scale-110"/>
                            </button>
                            <button onClick={next} aria-label="Próximo item" className="pointer-events-auto p-3 rounded-full shadow hover:invert bg-black hover:cursor-pointer ">
                                <ChevronRight className="invert w-auto h-5 duration-100 hover:scale-110"/>
                            </button>
                        </div>
                )}


            </div>
            <section className="mt-20">
                <h2 className="text-2xl font-bold mb-6">CONHEÇA AS CATEGORIAS</h2>
                <GenderButton gender={gender} onChangeGender={setGender} />

                <div className="flex flex-nowrap gap-5 mt-5 overflow-x-auto pb-2">
                    {(gender === 'male'
                        ? [
                            { id: 1, name: 'Camisetas', image: '/clothes/men/gymshark-black-oversized-masculine.jpeg' },
                            { id: 2, name: 'Calças', image: '/clothes/men/white-pants-masculine.jpeg' },
                            { id: 3, name: 'Shorts', image: '/clothes/men/gymshark-green-shorts-masculine.jpeg' },
                            { id: 4, name: 'Acessórios', image: '/acessories/gymshark-black-strap.jpeg' },
                          ]
                        : [
                            { id: 5, name: 'Leggings', image: '/clothes/women/gymshark-green-legging.jpeg' },
                            { id: 6, name: 'Conjuntos', image: '/clothes/women/gymshark-grey-set-women.jpeg' },
                            { id: 7, name: 'Oversized', image: '/clothes/women/gymshark-white-oversized-woman.jpeg' },
                            { id: 8, name: 'Tênis', image: '/shoes/nebula-runner-shoe.svg' },
                          ]
                    ).map((category) => (
                        <div key={category.id} className="shrink-0 w-64 sm:w-72 md:w-80">
                            <button className="flex flex-col justify-center w-full text-left hover:cursor-pointer">
                                <img
                                    src={category.image}
                                    alt={category.name}
                                    className="product-image-catalog object-cover w-full h-[24rem] lg:h-[36rem]"
                                />
                                <p className="text-xl font-light mt-4">{category.name}</p>
                            </button>
                        </div>
                    ))}
                </div>
            </section>

        </section>
    )
}