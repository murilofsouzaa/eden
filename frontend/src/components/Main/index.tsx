import "./Main.css"
import { Section } from "./Section/Section"
import { ImageSection } from "./Section/components/ImageSection/ImageSection"
import { VideoSection } from "./Section/components/VideoSection/VideoSection"


export function Main() {
    return(
        <div className="main-section">
            <ImageSection></ImageSection>
            
            <Section 
                title={"MAIS VENDIDOS"}
                variant={"best-seller"}>
            </Section>
            
            <Section 
                title={"CATEGORIAS"}
                gender={{masculine: "Masculino", feminine: "Feminino"}}
                variant={"category"}
                category={["shirts", "t_shirts", "regatta", "pants", "shorts", "set", "shoes", "caps", "sweatshirts", "legging"]}>
            </Section>

            <VideoSection></VideoSection>

            <div className="image-container">
                <div className="desc">
                    <h2>FRETES GRÁTIS</h2>
                    <h3>Frete grátis acima de R$299,90</h3>
                </div>
            </div>


        </div>
    );
}