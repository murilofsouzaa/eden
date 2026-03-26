type Gender = 'female' | 'male';

type GenderButtonProps = {
    gender: Gender;
    onChangeGender: (gender: Gender) => void;
};

export function GenderButton({ gender, onChangeGender }: GenderButtonProps) {
    return(
        <div className="flex gap-4 m-2 lg:ml-0">
            <button
                className={`gender-btn ${gender === 'female' ? 'active' : ''}`}
                onClick={() => onChangeGender('female')}
            >
                Feminino
            </button>
            <button
                className={`gender-btn ${gender === 'male' ? 'active' : ''}`}
                onClick={() => onChangeGender('male')}
            >
                Masculino
            </button>
        </div>
    )
}