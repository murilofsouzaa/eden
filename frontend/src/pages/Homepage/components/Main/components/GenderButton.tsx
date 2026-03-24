import {useState} from 'react'

export function GenderButton() {

    const [activeGender, setActiveGender] = useState<'female' | 'male'>('female');


    return(
        <div className="flex gap-2 m-2 lg:mt-10 lg:ml-0">
            <button
                className={`gender-btn ${activeGender === 'female' ? 'active' : ''}`}
                onClick={() => setActiveGender('female')}
            >
                Feminino
            </button>
            <button
                className={`gender-btn ${activeGender === 'male' ? 'active' : ''}`}
                onClick={() => setActiveGender('male')}
            >
                Masculino
            </button>

            
        </div>
    )
}