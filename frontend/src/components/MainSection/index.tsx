import { Section } from "./components/Section/Section"
import { ImageSection } from "./components/ImageSection/ImageSection"
import { VideoSection } from "./components/VideoSection/VideoSection"
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
                gender={
                    {masculine: "Masculino", feminine: "Feminino"}
                }
                variant={"category"}
                category={["shirts", "t_shirts", "pants", "shoes", "caps"]}>
            </Section>
            <VideoSection></VideoSection>
        </div>
    );
}