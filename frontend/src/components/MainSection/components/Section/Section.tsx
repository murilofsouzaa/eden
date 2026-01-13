import { CategorySection } from "./components/CategorySection";
import { BestSellerSection } from "./components/BestSellerSection";
import type { Order } from "../../../../services/orderService.ts";
import type { Products } from "../../../../services/productService.ts";
import { getBestSellers, getAllProducts, getAllProductsByGender } from "../../../../services/productService.ts";
import { getAllOrders } from "../../../../services/orderService.ts";
import { useState, useEffect, useRef} from "react";
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

        // const carrousel = useRef<HTMLDivElement>(null);
        // const inner = useRef<HTMLDivElement>(null);
        // const [width, setWidth] = useState(0);
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

        // useEffect(() => {
        //         if (inner.current && carrousel.current) {
        //                 const totalWidth = inner.current.scrollWidth - carrousel.current.offsetWidth;
        //                 setWidth(totalWidth);
        //         }
        // }, [products]);

        // const handleGenderClick = (gender: string) => {
        //         setSelectedGender(gender.toLowerCase() as Gender);
        // };

        const uniqueCategories = Array.from(
                new Set(products.map(product => product.category))
        ) as (MasculineCategory | FeminineCategory)[];

   return (
                <>
                        {props.variant === "category" ? (
                                <CategorySection
                                        title={props.title}
                                        categories={uniqueCategories}
                                        products={products}
                                        selectedGender={selectedGender}
                                />
                        ) : (
                                <BestSellerSection
                                        title={props.title}
                                        products={products}
                                        orders={orders}
                                        selectedGender={selectedGender}
                                />
                        )}
                </>
        );
}
