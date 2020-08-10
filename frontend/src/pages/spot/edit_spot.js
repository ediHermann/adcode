import React from "react";
import UidForm from "../../components/UID";

const EditSpot = () => {
    //const location=this.props.location;
    const uid=(window.location.href.substring(window.location.href.lastIndexOf('/') + 1));
    return (
        <div className='max-w-screen-sm h-full self-center m-auto px-5'>
            <div className='flex justify-center uppercase mt-40 text-2xl md:text-5xl font-bold '>Editeaza spot</div>
            <div className='flex justify-center mx-auto'>

                <UidForm
                    uid={uid}
                />

            </div>
        </div>
    )

}

export default EditSpot;