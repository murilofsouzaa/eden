import { Card } from "./Cards/Card.tsx";
import type { Products } from "../../../../services/productService.ts";
import { useRef } from "react";
import { motion } from "framer-motion";

interface CategorySectionProps {
  title: string;
  categories: string[];
  products: Products[];
  selectedGender: string;
  gender?: { masculine: string; feminine: string };
  onGenderClick: (gender?: string) => void;
}

export function CategorySection({ title, categories, products, selectedGender, gender, onGenderClick }: CategorySectionProps) {
  const carrousel = useRef<HTMLDivElement>(null);
  const inner = useRef<HTMLDivElement>(null);
  const uniqueCategories = Array.from(new Set(categories));

  return (
    <div className="section-root">
      <h2 className="section-title fs-4 mb-0 mt-5">{title}</h2>
      {gender && (
        <div className="d-flex gap-4 mt-4 mb-3">
          <button
            className={`gender-btn ${selectedGender === 'masculine' ? 'active' : ''}`}
            onClick={() => onGenderClick?.('masculine')}
            style={{ cursor: 'pointer' }}
          >
            {gender.masculine}
          </button>
          <button
            className={`gender-btn ${selectedGender === 'feminine' ? 'active' : ''}`}
            onClick={() => onGenderClick?.('feminine')}
            style={{ cursor: 'pointer' }}
          >
            {gender.feminine}
          </button>
        </div>
      )}
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