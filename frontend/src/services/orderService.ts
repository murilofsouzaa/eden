import { api } from "./api";

export interface OrderItem {
    id: number;
    productId: number;
    quantity: number;
    unitPrice: number;
}

export interface OrderAddress {
    id: number;
    userId: number;
    street: string;
    number: number;
    neighborhood: string;
    city: string;
    state: string;
    country: string;
    zipCode: string;
}

export interface Order {
    id: number;
    userId: number;
    createdAt: string;
    status: "CREATED" | "DELIVERED" | "SHIPPED" | "CANCELLED";
    orderAddress: OrderAddress;
    items: OrderItem[];
    shoppingCartId?: number;
}

export const getAllOrders = async (): Promise<Order[]> => {
    const response = await api.get("/order");
    return response.data;
};