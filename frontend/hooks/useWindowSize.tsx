import {useState, useEffect} from 'react'

const useWindowSize = () => {

    const [windowSize, setWindowSize] = useState(window.innerWidth);

    useEffect(() => {
            const handleResize = () => setWindowSize(window.innerWidth);
            window.addEventListener("resize",handleResize);

            return (
                window.removeEventListener("resize", handleResize)
            )
        }, []);

        const isMobileSmallScreen = windowSize <= 640;
        const isMobileNormalScreen = 640 < windowSize && windowSize <= 767;
        const isTabletScreen = 768 < windowSize && windowSize <= 1023;
        const isLaptopScreen = 1024 < windowSize && windowSize <= 1279;
        const isDesktopScreen = 1280 < windowSize && windowSize <= 1535;
        const isLargeScreen = windowSize > 1536;

    return ( 
        {
            width: windowSize,
            isMobileSmallScreen,
            isMobileNormalScreen,
            isTabletScreen,
            isLaptopScreen,
            isDesktopScreen,
            isLargeScreen

        }
     );
}
 
export default useWindowSize;