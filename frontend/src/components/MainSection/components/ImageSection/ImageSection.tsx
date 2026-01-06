import "./ImageSection.css"
import {useState, useEffect} from "react";

    export function ImageSection() {

        const imgUrls: string[] = [
            "/models/mahhtla-banner.jpg",
            "/models/vitin-banner.jpg"
        ]

        const [currentIndex, setCurrentIndex] = useState(0);

        useEffect(() => {
            const interval = setInterval(() => {
                setCurrentIndex((previousImage) =>{
                    return (previousImage + 1) % imgUrls.length;}
                )
            }, 5000);
            return () => {return clearInterval(interval)};
        }, []);

        return(
            <div>
                <div
                    className="image-banner"
                    style={{
                        backgroundImage: `url(${imgUrls[currentIndex]})`,
                }}
                >
                    <div className="show-products-btn">
                        <p>Ver Produtos</p>
                    </div>
                </div>
                
                </div>
        )
    }