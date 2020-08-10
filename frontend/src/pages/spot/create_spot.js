import React from "react";
import UidForm from "../../components/UID";

const CreateSpot = () => {
        return (
            <div className='max-w-screen-sm h-full self-center m-auto px-5'>
                <div className='flex justify-center uppercase mt-40 text-2xl md:text-5xl font-bold '>Creaza spot</div>
                <div className='flex justify-center mx-auto'>

                    <UidForm
                        uid=''
                    />

                </div>
            </div>
        )

}

export default CreateSpot;