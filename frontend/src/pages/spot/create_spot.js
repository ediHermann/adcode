import React, {Component} from "react";
import UidForm from "../../components/UID";

class CreateSpot extends Component {
    render() {
        return (
            <div className='absolute w-full h-full'>
                <div className='flex justify-center mt-10 flex-wrap'>
                    <div className='bg-primary px-4 py-4 rounded-window'
                         style={{width: '900px'}}>
                        <h1 className='flex justify-center text-white uppercase mt-20 pb-10 text-2xl md:text-5xl font-bold'>Creaza un
                            spot</h1>
                        <div className='bg-secondary px-4 pb-32 pt-10 bottom-rounded-window'>
                            <UidForm/>
                        </div>
                    </div>
                </div>
            </div>
        );
    }
}

export default CreateSpot;