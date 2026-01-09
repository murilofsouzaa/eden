import {api} from "./api";

export interface Products{      
    id: number,
    title: string,
    description: string,
    price: number,
    stock: number,
    productCategory: string,
    productStatus: string,
    category: string,
    createdAt: Date,
    imgUrl: string
}

export const getAllProducts = async () =>{
  const response = await api.get("/products");
  return response.data
} 

export const getAllProductsByGender = async (gender: string) =>{
  const response = await api.get(`/products/gender/${gender}`);
  return response.data
} 

export const getBestSellers = async ()=>{
  const response = await api.get("products/best-sellers?status=DELIVERED");
  return response.data;
}