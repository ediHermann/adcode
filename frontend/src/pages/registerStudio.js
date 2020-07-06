import React from 'react'
import RegisterForm from "../components/register/register-form";
import Title from "../components/mixt/Title";



const RegisterStudio = () =>
    <div className='absolute w-full h-full'>
        <div className='absolute mt-5 bg-primary px-4 py-4 rounded-window'
             style={{
                 width: '600px',
                 left: '50%',
                 marginLeft: '-250px'
             }}>
            <div className='flex justify-center align-middle py-10 '>
                <Title>Înregistrare cont Producător</Title>
            </div>
            <div className='bg-secondary px-4 pb-48 pt-10 bottom-rounded-window'>

                <RegisterForm/>

            </div>
        </div>
    </div>


export default RegisterStudio