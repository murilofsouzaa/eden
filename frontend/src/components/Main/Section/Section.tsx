import { CategorySection } from "./components/CategorySection.tsx";
import { BestSellerSection } from "./components/BestSellerSection.tsx";

import type { Order } from "../../../services/orderService.ts";
import type { Products } from "../../../services/productService.ts";
import { getBestSellers, getAllProducts, getAllProductsByGender } from "../../../services/productService.ts";
import { getAllOrders } from "../../../services/orderService.ts";
import { useState, useEffect} from "react";
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

        const [products, setProducts] = useState<Products[]>([]);
        const [orders, setOrders] = useState<Order[]>([]);
        const [selectedGender, setSelectedGender] = useState<Gender>("masculine")

        useEffect(() => {
                const fetchOrders = async () => {
                        const data = await getAllOrders();
                        setOrders(data);
                };

                fetchOrders();
        }, []);

        useEffect(() => {
                const fetchProducts = async () => {
                        let data;
                        
                        if (props.variant === "best-seller") {
                                data = await getBestSellers();
                        } else if (props.gender) {
                                data = await getAllProductsByGender(selectedGender.toUpperCase());
                        } else {
                                data = await getAllProducts();
                        }
                        
                        setProducts(data);
                };

                fetchProducts();
        }, [selectedGender, props.gender, props.variant]);

        const uniqueCategories = Array.from(
                new Set(products.map(product => product.category))
        ) as (MasculineCategory | FeminineCategory)[];

        function handleGenderClick(gender: Gender): void {
                setSelectedGender(gender);
        }
        return (
                <>
                        {(() => {
                                switch (props.variant) {
                                        case "best-seller":
                                                return (
                                                        <BestSellerSection
                                                                title={props.title}
                                                                products={products}
                                                                orders={orders}
                                                                selectedGender={selectedGender}
                                                        />
                                                );
                                        case "category":
                                                return (
                                                        <CategorySection
                                                                title={props.title}
                                                                categories={uniqueCategories}
                                                                products={products}
                                                                selectedGender={selectedGender}
                                                                gender={props.gender}
                                                                onGenderClick={handleGenderClick}
                                                        />
                                                );
                                        default:
                                                return null;
                                }
                        })()}
                </>
        );
}
