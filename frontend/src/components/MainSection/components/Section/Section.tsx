import { Card } from "./components/Cards/Card.tsx";
import type { Products } from "../../../../services/productService.ts";
import { getAllProducts } from "../../../../services/productService.ts";
import { getAllProductsByGender } from "../../../../services/productService.ts";
import { useState, useEffect, useRef} from "react";
import { motion } from 'framer-motion';
import "./Section.css";

type Category =
  | "shirts"
  | "t_shirts"
  | "pants"
  | "shorts"
  | "shoes"
  | "caps";

export function Section(props){

        const carrousel = useRef<HTMLDivElement>(null);
        const inner = useRef<HTMLDivElement>(null);
        const [width, setWidth] = useState(0);
        const [products, setProducts] = useState<Products[]>([]);
        const [selectedGender, setSelectedGender] = useState("MASCULINE")

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

        const uniqueCategories: Category[]= Array.from(
                new Set(products.map(product => product.category))
        ) as Category[];

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
                                <h2 className="section-title fs-4 mb-0 mt-5 mx-4">{props.title}</h2>
                                {props.gender && (
                                        <div className="d-flex gap-4 mt-4 mx-4 mb-3">
                                                <button
                                                        className={`gender-btn ${selectedGender === 'MASCULINE' ? 'active' : ''}`}
                                                        onClick={() => handleGenderClick('MASCULINE')}
                                                        style={{ cursor: 'pointer' }}
                                                >
                                                        {props.gender.masculine}
                                                </button>
                                                <button 
                                                        className={`gender-btn ${selectedGender === 'FEMININE' ? 'active' : ''}`}
                                                        onClick={() => handleGenderClick('FEMININE')}
                                                        style={{ cursor: 'pointer' }}
                                                >
                                                        {props.gender.feminine}
                                                </button>
                                        </div>
                                )}
                                <div className="cards-subsection d-flex">
                                        {props.variant === "category"
                                        ? uniqueCategories.map((category) => {
                                                const foundProduct = products.find(
                                                (product) => product.category === category
                                                );
                                                if (!foundProduct) return null;
                                                return (
                                                <Card
                                                        key={category}
                                                        product={foundProduct}
                                                        variant={props.variant}
                                                />
                                                );
                                        })
                                        : products.slice(0, 7).map((product) => (
                                                <Card
                                                key={product.id}
                                                product={product}
                                                variant={props.variant}
                                                />
                                        ))}
                                </div>

                                
                        </div>
                </motion.div>
        </div>
        );
}
