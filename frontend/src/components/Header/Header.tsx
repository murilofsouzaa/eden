import "./Header.css";
import {HeaderTextSlider} from "./HeaderTextSlider/HeaderTextSlider";
 
export function Header(){
    return(
        <>
            <HeaderTextSlider></HeaderTextSlider>
            <header className="d-flex justify-content-between">
                    <img src="/logo/headerEdenLogo.png" alt="eden-header-logo"></img>
                    <div id="search-div" className="d-flex gap-3">
                        <img src="/icons/search.png" alt="search-icon"></img>
                        <div id="header-search-field">O que está procurando?</div>
                    </div>
                    
                    <div className="d-flex gap-3">
                        <img src="/icons/person.png" alt="profile-icon" />
                        <img src="/icons/shopping-bag.png" alt="shopping-bag-icon" />
                    </div>
            </header>
        </>
    )
}