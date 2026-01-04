import { Card } from "./components/Cards/Card.tsx";
import type { Products } from "../../../../services/productService.ts";
import { getAllProducts } from "../../../../services/productService.ts" 
import { useState, useEffect, useRef} from "react";
import { motion } from 'framer-motion';
import "./Section.css";

interface SectionProps {
        title: string;
}

export function Section(props: SectionProps){

        const carrousel = useRef<HTMLDivElement>(null);
        const inner = useRef<HTMLDivElement>(null);
        const [width, setWidth] = useState(0);
        const [products, setProducts] = useState<Products[]>([]);

        useEffect(() => {
                getAllProducts().then(data => setProducts(data));
        }, []);

        useEffect(() => {
                if (inner.current && carrousel.current) {
                        const totalWidth = inner.current.scrollWidth - carrousel.current.offsetWidth;
                        setWidth(totalWidth);
                }
        }, [products]);

   return (
        <motion.div ref={carrousel} className="carrousel">
                <motion.div 
                        ref={inner}
                        className="inner"
                        drag="x"
                        dragConstraints={{ left: -width, right: 0 }}
                        whileTap={{ cursor: "grabbing" }}
                >
                        <motion.div className="section">
                                <h2
                                        className="section-title fs-1 mb-5 mt-5 mx-4"
                                        >{props.title}
                                </h2>
                                <motion.div className="cards-subsection d-flex">
                                        {products.slice(0,7).map(product =>{
                                        return <Card key={product.id} product={product}></Card>
                                        })}
                                </motion.div>
                        </motion.div>
                </motion.div>
        </motion.div>
        );
}