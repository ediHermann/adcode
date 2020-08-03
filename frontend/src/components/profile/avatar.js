import React from 'react'
import AvatarEditor from "react-avatar-editor";
import PropTypes from "prop-types";

const ProfileAvatar = ({pic,name,setFValue}) => {
     console.log('pic1='+pic)
     const [img, setImg] = React.useState({
        className :'border rounded border-gray-800 my-4',
        image: "../imgs/avatar.png",
        allowzoomout: false,
        position: {x: 0.5, y: 0.5},
        scale: 1,
        rotate: 0,
        borderRadius: 1,
        border: 0,
        preview: null,
        width: 200,
        height: 200
    })

    const ref = React.useRef();

    const handleImageChange = e => {
        setImg({...img, image: e.target.files[0]});
        const canvas=document.getElementsByTagName("canvas")[0];
        let imgData=canvas.toDataURL();
        imgData=imgData.replace('data:image/png;base64,','');
        imgData=encodeURIComponent(imgData);
        setFValue(name, imgData);

    }
    const handleScale = e => {
        const scale = parseFloat(e.target.value)
        setImg({...img, scale});
        const canvas=document.getElementsByTagName("canvas")[0];
        let imgData=canvas.toDataURL();
        imgData=imgData.replace('data:image/png;base64,','');
        imgData=encodeURIComponent(imgData);
        setFValue(name, imgData);
    }
    const handlePositionChange = position => {
        setImg({...img, position});
        const canvas=document.getElementsByTagName("canvas")[0];
        let imgData=canvas.toDataURL();
        imgData=imgData.replace('data:image/png;base64,','');
        imgData=encodeURIComponent(imgData);
        setFValue(name, imgData);
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
            ref={ref}
        />
    </div>
}


ProfileAvatar.propTypes ={
    allowzoomout: PropTypes.bool
}
export default ProfileAvatar