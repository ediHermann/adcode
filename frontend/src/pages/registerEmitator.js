import React from 'react'
import RegisterForm from "../components/register/register-form";
import Title from "../components/mixt/Title";


const RegisterBroadcaster = () =>
    <div className='absolute w-full h-full'>
        <div className='flex justify-center mt-10 flex-wrap'>
            <div className=' bg-primary px-4 py-4 rounded-window'
                 style={{width: '600px'}}>
                <div className='flex justify-center align-middle py-10 '>
                    <Title>Înregistrare cont emițător</Title>
                </div>
                <div className='bg-secondary px-4 pb-32 pt-10 bottom-rounded-window'>

                    <RegisterForm/>

                    <div className='mt-2 text-text'>
                        <label>Tip Emitere:</label><br/>

                        <input id='radio' className='cursor-pointer mr-1' type='checkbox' name='choice' value='radio'
                               onClick={() => console.log()}/>
                        <label className='cursor-pointer uppercase' htmlFor='radio'>Radio</label>

                        <input id='internet' className='ml-4 cursor-pointer mr-1' type='checkbox' name='choice'
                               value='internet'
                               onClick={() => console.log()}/>
                        <label className='cursor-pointer uppercase' htmlFor='internet'>Internet</label>

                        <input id='cinema' className='ml-4 cursor-pointer mr-1' type='checkbox' name='choice'
                               value='cinema'
                               onClick={() => console.log()}/>
                        <label className='cursor-pointer uppercase' htmlFor='cinema'>Cinema</label>

                        <input id='tv' className='ml-4 cursor-pointer mr-1' type='checkbox' name='choice' value='tv'
                               onClick={() => console.log()}/>
                        <label className='cursor-pointer uppercase' htmlFor='tv'>TV</label>
                    </div>
                </div>
            </div>
        </div>
    </div>


export default RegisterBroadcaster