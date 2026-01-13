import { Card } from "./Cards/Card";
import type { Products } from "../../../../services/productService";
import type { Order } from "../../../../services/orderService";
import { useRef } from "react";
import { motion } from "framer-motion";

interface BestSellerSectionProps {
  title: string;
  products: Products[];
  orders: Order[];
  selectedGender: string;
}

export function BestSellerSection({ title, products, orders, selectedGender }: BestSellerSectionProps) {
  const carrousel = useRef<HTMLDivElement>(null);
  const inner = useRef<HTMLDivElement>(null);

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
              {products.slice(0, 7).map((product) => {
                const relatedOrder = orders.find(order => 
                  order.items.some(item => item.productId === product.id)
                );
                return (
                  <Card
                    key={product.id}
                    product={product}
                    variant="best-seller"
                    gender={selectedGender}
                    order={relatedOrder}
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
