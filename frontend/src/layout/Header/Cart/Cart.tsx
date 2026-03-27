type Product = {
    id: number;
    title: string;
    imageUrl: string;
};

type CartProps = {
    products: Product[];
};

export function Cart({ products }: CartProps) {
    const hasProducts = products && products.length > 0;

    return (
        <div className="bg-gray-200">
            <div>
                <h2>Seu Carrinho</h2>
                <div className="bg-grey-300">
                    {hasProducts ? (
                        products.map((product) => (
                            <div key={product.id}>
                                <p>{product.title}</p>
                            </div>
                        ))
                    ) : (
                        <div>
                            <p>Seu carrinho está vazio</p>
                        </div>
                    )}
                </div>
            </div>
        </div>
    );
}