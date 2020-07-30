import React from 'react'
import AvatarEditor from "react-avatar-editor";
import {allowTouchMove} from "react-select/src/internal/ScrollLock/utils";


const ProfileAvatar = () => {

    const [img, setImg] = React.useState({
        image: 'imgs/avatar.png',
        allowZoomOut: false,
        position: {x: 0.5, y: 0.5},
        scale: 1,
        rotate: 0,
        borderRadius: 6,
        border: 25,
        preview: null,
        width: 200,
        height: 200
    })

    const handleImageChange = e => {
        setImg({...img, image: e.target.files[0]})
    }
    const handleScale = e => {
        const scale = parseFloat(e.target.value)
        setImg({...img, scale})
    }
    const handlePositionChange = position => {
        setImg({...img, position})
    }

    return <div>
        <AvatarEditor
            {...img}
            onPositionChange={handlePositionChange}
        />
        <input type="file" onChange={handleImageChange}/>
        <br/>
        <input
            name='scale'
            type='range'
            onChange={handleScale}
            min='1'
            max='2'
            step='0.1'
            defaultValue='1'
        />
    </div>
}


export default ProfileAvatar