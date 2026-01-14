import { useState, useEffect} from "react";
import { getAllProductsByCategory} from "../../../../services/productService.ts"
import type { Products } from "../../../../services/productService.ts"
import { Card } from "./Cards/Card.tsx"

interface AcessoriesSectionProps {
    title: string,
    products: Products[],
    gender: string,
    categories: string[],
    variant: string
}

export function AcessoriesSection({title, products, gender, categories, variant}: AcessoriesSectionProps){
    return(
        <>
        </>
    )
}