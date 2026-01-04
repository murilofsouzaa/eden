import {api} from "./api";

export interface Products{      
    id: number,
    title: string,
    description: string,
    price: number,
    stock: number,
    productCategory: string,
    productStatus: string,
    createdAt: Date,
    imgUrl: string
}

export const getAllProducts = async () =>{
  const response = await api.get("/products");
  return response.data
} 