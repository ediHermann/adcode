import React from 'react'
import Tabs  from "../../components/mixt/tabs";
import EditProfile from "./edit_profile";
import EditAvatar from "./edit_avatar";
import EditPassword from "./edit_password";

const Profile = () => {

    const crtTabItems=[
        {
            title:"Date personale",
            Component:EditProfile
        },
        {
            title:"Avatar",
            Component:EditAvatar
        },

        {
            title:"Schimbare parola",
            Component:EditPassword
        },
    ];


    return (
        <div className='max-w-screen-sm h-full self-center m-auto p-10'>
            <div className='flex justify-center uppercase mt-40 text-2xl md:text-5xl font-bold '>Profilul meu</div>

            <Tabs
                tabItems={crtTabItems}
            />
        </div>
    )
};
export default Profile;