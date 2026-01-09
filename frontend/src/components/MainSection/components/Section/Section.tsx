import { Card } from "./components/Cards/Card.tsx";
import type { Products } from "../../../../services/productService.ts";
import { getAllProducts } from "../../../../services/productService.ts";
import { getAllProductsByGender } from "../../../../services/productService.ts";
import { useState, useEffect, useRef} from "react";
import { motion } from 'framer-motion';
import "./Section.css";

type MasculineCategory =
  | "shirts"
  | "t_shirts"
  | "regatta"
  | "pants"
  | "shorts"
  | "set"
  | "shoes"
  | "caps"
  | "sweatshirts";


type FeminineCategory =
  | "shirts"
  | "t_shirts"
  | "regatta"
  | "pants"
  | "shorts"
  | "legging"
  | "set"
  | "shoes"
  | "caps"
  | "sweatshirts";

type Gender = "masculine" | "feminine";

export function Section(props){

        const carrousel = useRef<HTMLDivElement>(null);
        const inner = useRef<HTMLDivElement>(null);
        const [width, setWidth] = useState(0);
        const [products, setProducts] = useState<Products[]>([]);
        const [selectedGender, setSelectedGender] = useState<Gender>("masculine")

        useEffect(() => {
                if (props.gender) {
                        getAllProductsByGender(selectedGender.toUpperCase()).then(data => setProducts(data));
                } else {
                        getAllProducts().then(data => setProducts(data));
                }
        }, [selectedGender, props.gender]);

        useEffect(() => {
                if (inner.current && carrousel.current) {
                        const totalWidth = inner.current.scrollWidth - carrousel.current.offsetWidth;
                        setWidth(totalWidth);
                }
        }, [products]);

        const handleGenderClick = (gender: string) => {
                setSelectedGender(gender.toLowerCase() as Gender);
        };

        const uniqueCategories = Array.from(
                new Set(products.map(product => product.category))
        ) as (MasculineCategory | FeminineCategory)[];

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
                                                        className={`gender-btn ${selectedGender === 'masculine' ? 'active' : ''}`}
                                                        onClick={() => handleGenderClick('masculine')}
                                                        style={{ cursor: 'pointer' }}
                                                >
                                                        {props.gender.masculine}
                                                </button>
                                                <button 
                                                        className={`gender-btn ${selectedGender === 'feminine' ? 'active' : ''}`}
                                                        onClick={() => handleGenderClick('feminine')}
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
                                                                gender={selectedGender}
                                                        />
                                                );
                                        })
                                        : products.slice(0, 7).map((product) => (
                                                <Card
                                                        key={product.id}
                                                        product={product}
                                                        variant={props.variant}
                                                        gender={selectedGender}
                                                />
                                        ))}
                                </div>

                                
                        </div>
                </motion.div>
        </div>
        );
}
