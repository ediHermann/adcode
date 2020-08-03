import React from 'react'
import RegisterForm from "../components/register/register-form";
import Title from "../components/mixt/Title";


const RegisterTalent = () =>
    <div className='absolute w-full h-full'>
        <div className='flex justify-center mt-10 flex-wrap'>
            <div className='bg-white px-4 py-4 rounded-window'
                style={{width: '600px'}}>
                <div className='flex justify-center align-middle py-10 '>
                    <Title>Înregistrare cont talent</Title>
                </div>
                <div className='bg-white px-4 pb-32 pt-10 bottom-rounded-window'>
                    <RegisterForm/>
                </div>
            </div>
        </div>
    </div>


export default RegisterTalent