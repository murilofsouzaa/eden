import "./ImageSection.css"
import {useState, useEffect} from "react";
import mahhtlaBanner from "../../../../assets/models/mahhtla-banner.jpg";
import vitinBanner from "../../../../assets/models/vitin-banner.jpg";

    export function ImageSection() {

        const imgUrls: string[] = [
            mahhtlaBanner,
            vitinBanner
        ]

        const [currentIndex, setCurrentIndex] = useState(0);

        useEffect(() => {
            const interval = setInterval(() => {
                setCurrentIndex((previousImage) =>{
                    return (previousImage + 1) % imgUrls.length;}
                )
            }, 2000);
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