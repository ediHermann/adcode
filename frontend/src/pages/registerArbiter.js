import React from 'react'
import RegisterForm from "../components/register/register-form";
import Title from "../components/mixt/Title";



const RegisterArbiter = () =>
    <div className='absolute w-full h-full'>
        <div className='absolute mt-5 bg-primary px-4 py-4 rounded-window'
             style={{
                 width: '600px',
                 left: '50%',
                 marginLeft: '-250px'
             }}>
            <div className='flex justify-center align-middle py-10 '>
                <Title>Înregistrare cont arbitru</Title>
            </div>
            <div className='bg-secondary px-4 pb-32 pt-10 bottom-rounded-window'>

                <RegisterForm/>

                <div className='mt-2 text-text text-center'>
                    <label>Tip media:</label><br/>
                    {/*de modificat aici tipurile*/}

                    <input id='voice' className='cursor-pointer mr-1' type='checkbox' name='choice' value='Voce'
                           onClick={() => console.log()}/>
                    <label className='cursor-pointer' htmlFor='voice'>TV</label>

                    <input id='face' className='ml-4 cursor-pointer mr-1' type='checkbox' name='choice' value='Fata'
                           onClick={() => console.log()}/>
                    <label className='cursor-pointer' htmlFor='face'>net</label>
                </div>
            </div>
        </div>
    </div>


export default RegisterArbiter