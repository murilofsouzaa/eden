import { Section } from "./components/Section/Section"
import { ImageSection } from "./components/ImageSection/ImageSection"
export function Main() {
    return(
        <div className="main-section">
            <ImageSection></ImageSection>
            <Section title={"MAIS VENDIDOS"}></Section>
        </div>
    );
}