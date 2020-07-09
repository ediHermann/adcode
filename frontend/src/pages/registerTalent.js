import React from 'react'
import RegisterForm from "../components/register/register-form";
import Title from "../components/mixt/Title";


const RegisterTalent = () =>
    <div className='absolute w-full h-full'>
        <div className='flex justify-center mt-10 flex-wrap'>
            <div className='bg-primary px-4 py-4 rounded-window'
                style={{width: '600px'}}>
                <div className='flex justify-center align-middle py-10 '>
                    <Title>Înregistrare cont talent</Title>
                </div>
                <div className='bg-secondary px-4 pb-32 pt-10 bottom-rounded-window'>

                    <RegisterForm/>

                    <div className='mt-2 text-text'>
                        <label>Tipul talentului:</label><br/>

                        <input id='voice' className='cursor-pointer mr-1' type='checkbox' name='choice' value='Voce'
                               onClick={() => console.log()}/>
                        <label className='cursor-pointer' htmlFor='voice'>VOCE</label>

                        <input id='face' className='ml-4 mr-1 cursor-pointer' type='checkbox' name='choice' value='Fata'
                               onClick={() => console.log()}/>
                        <label className='cursor-pointer' htmlFor='face'>FAȚĂ</label>
                    </div>
                </div>
            </div>
        </div>
    </div>


export default RegisterTalent