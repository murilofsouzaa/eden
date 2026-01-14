import "./VideoSection.css"
export function VideoSection(){
    return(
        <div>
            <section className="video-container">
                <video autoPlay muted loop className="video-background">
                    <source
                    src="../../../../../public/video/vecteezy_athlete-runner-feet-running-on-road-jogging-concept-at_36272080.MOV"
                    type="video/mp4"></source>
                </video>
            </section>
            <div className="video-desc">
                <h2>COLEÇÃO DRY FIT</h2>
                <h3>Sofisticação, tecnologia e funcionalidade.</h3>
                <button>CONHEÇA</button>
            </div>
        </div>

    );
}