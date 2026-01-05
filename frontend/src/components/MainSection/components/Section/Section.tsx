import { Card } from "./components/Cards/Card.tsx";
import type { Products } from "../../../../services/productService.ts";
import { getAllProducts } from "../../../../services/productService.ts";
import { getAllProductsByGender } from "../../../../services/productService.ts";
import { useState, useEffect, useRef} from "react";
import { motion } from 'framer-motion';
import "./Section.css";

export function Section(props){

        const carrousel = useRef<HTMLDivElement>(null);
        const inner = useRef<HTMLDivElement>(null);
        const [width, setWidth] = useState(0);
        const [products, setProducts] = useState<Products[]>([]);
        const [selectedGender, setSelectedGender] = useState<string | null>(props.gender ? 'MASCULINE' : null);

        useEffect(() => {
                if (props.gender) {
                        getAllProductsByGender('masculine').then(data => setProducts(data));
                        return;
                }
                getAllProducts().then(data => setProducts(data));
        }, []);

        useEffect(() => {
                if (inner.current && carrousel.current) {
                        const totalWidth = inner.current.scrollWidth - carrousel.current.offsetWidth;
                        setWidth(totalWidth);
                }
        }, [products]);

        const handleGenderClick = (gender: string) => {
                setSelectedGender(gender);
                getAllProductsByGender(gender.toLowerCase()).then(data => setProducts(data));
        };

   return (
        <div ref={carrousel} className="carrousel">
                <motion.div 
                        ref={inner}
                        className="inner"
                        drag="x"
                        dragConstraints={{ left: -width + 20, right: 0 }}
                        whileTap={{ cursor: "grabbing" }}
                >
                        <div className="section">
                                <h2 className="section-title fs-1 mb-3 mt-5 mx-4">{props.title}</h2>
                                
                                {props.gender && (
                                        <div className="d-flex gap-4 mx-4 mb-4">
                                                <div 
                                                        className={`gender-btn ${selectedGender === 'MASCULINE' ? 'active' : ''}`}
                                                        onClick={() => handleGenderClick('MASCULINE')}
                                                        style={{ cursor: 'pointer' }}
                                                >
                                                        {props.gender.masculine}
                                                </div>
                                                <div 
                                                        className={`gender-btn ${selectedGender === 'FEMININE' ? 'active' : ''}`}
                                                        onClick={() => handleGenderClick('FEMININE')}
                                                        style={{ cursor: 'pointer' }}
                                                >
                                                        {props.gender.feminine}
                                                </div>
                                        </div>
                                )}
                                <div className="cards-subsection d-flex">
                                        {products.slice(0,7).map(product =>{
                                                return <Card key={product.id} product={product}></Card>
                                        })}
                                </div>
                                
                        </div>
                </motion.div>
        </div>
        );
}