import { Card } from "./Cards/Card";
import type { Products } from "../../../../services/productService";
import { useRef } from "react";
import { motion } from "framer-motion";

interface CategorySectionProps {
  title: string;
  categories: string[];
  products: Products[];
  selectedGender: string;
}

export function CategorySection({ title, categories, products, selectedGender }: CategorySectionProps) {
  const carrousel = useRef<HTMLDivElement>(null);
  const inner = useRef<HTMLDivElement>(null);
  const uniqueCategories = Array.from(new Set(categories));

  return (
    <div className="section-root">
      <h2 className="section-title fs-4 mb-0 mt-5">{title}</h2>
      <div ref={carrousel} className="carrousel">
        <motion.div
          ref={inner}
          className="inner"
          drag="x"
          dragConstraints={{ left: -1000, right: 0 }}
          whileTap={{ cursor: "grabbing" }}
        >
          <div className="section">
            <div className="cards-subsection">
              {uniqueCategories.map((category) => {
                const foundProduct = products.find((product) => product.category === category);
                if (!foundProduct) return null;
                return (
                  <Card
                    key={category}
                    product={foundProduct}
                    variant="category"
                    gender={selectedGender}
                  />
                );
              })}
            </div>
          </div>
        </motion.div>
      </div>
    </div>
  );
}