import { Section } from "./Section/Section"
import { ImageSection } from "./Section/components/ImageSection/ImageSection"
import { VideoSection } from "./Section/components/VideoSection/VideoSection"
import { LogoSection } from "./Section/components/LogoSection/LogoSection"
import { AcessoriesSection } from "./Section/components/AcessoriesSection"

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

            <AcessoriesSection
                title={"ACESSÓRIOS"}
                variant={"acessories"}
                gender={{masculine: "Masculino", feminine: "Feminino"}}
                categories={["shirts", "t_shirts", "regatta", "pants", "shorts", "set", "shoes", "caps", "sweatshirts", "legging"]}>
                </AcessoriesSection>
            <LogoSection></LogoSection>
        </div>
    );
}