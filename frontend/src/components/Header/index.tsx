import "./Header.css";
import {HeaderTextSlider} from "./HeaderTextSlider/";
import headerEdenLogo from "../../assets/logo/headerEdenLogo.png";
import searchIcon from "../../assets/icons/search.png";
import userIcon from "../../assets/icons/person.png";
import bagIcon from "../../assets/icons/shopping-bag.png";
 
export function Header(){
    return(
        <>
            <HeaderTextSlider></HeaderTextSlider>
            <header className="d-flex justify-content-between">
                    <img src={headerEdenLogo}alt="eden-header-logo"></img>
                    <div id="search-div" className="d-flex gap-3">
                        <img src={searchIcon} alt="search-icon"></img>
                        <div id="header-search-field">O que está procurando?</div>
                    </div>
                    
                    <div className="d-flex gap-3">
                        <img src={userIcon} alt="profile-icon" />
                        <img src={bagIcon} alt="shopping-bag-icon" />
                    </div>
            </header>
        </>
    )
}