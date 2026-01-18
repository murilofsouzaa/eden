import { Section } from "./Section/Section"
import { ImageSection } from "./Section/components/ImageSection/ImageSection"
import { VideoSection } from "./Section/components/VideoSection/VideoSection"
import { LogoSection } from "./Section/components/LogoSection/LogoSection"


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

            {/* Removido AcessoriesSection */}
            <LogoSection></LogoSection>
        </div>
    );
}