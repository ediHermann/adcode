import React from 'react'
import AvatarEditor from "react-avatar-editor";
import PropTypes from "prop-types";
import loadImageFile from "react-avatar-editor/src/utils/load-image-file";

let firstTime=true;
const ProfileAvatar = ({pic,name,setFValue}) => {
     const [img, setImg] = React.useState({
        className :'border rounded border-gray-800 my-4',
        image: pic,
        allowzoomout: false,
        position: {x: 0.5, y: 0.5},
        scale: 1,
        rotate: 0,
        borderRadius: 1,
        border: 0,
        preview: null,
        width: 150,
        height: 150
    })

    const ref = React.useRef();



    const LoadInitImage = (img) => {
            if(img.length>200 && firstTime ) {

                const canvas = document.getElementsByTagName("canvas")[0];
                const ctx = canvas.getContext("2d");
                const image = new Image();
                image.onload = function () {
                     ctx.drawImage(image, 0, 0);

                 };
            image.src = img;
        }
    }

    const handleImageChange = e => {
        firstTime=false;
        setImg({...img, image: e.target.files[0]});
        const canvas=document.getElementsByTagName("canvas")[0];
        let imgData=canvas.toDataURL();
        imgData=imgData.replace('data:image/png;base64,','');
        imgData=encodeURIComponent(imgData);
        setFValue(name, imgData);


    }


    const handleScale = e => {
        firstTime=false;
        const scale = parseFloat(e.target.value)
        setImg({...img, scale})
        const canvas=document.getElementsByTagName("canvas")[0];
        let imgData=canvas.toDataURL();
        imgData=imgData.replace('data:image/png;base64,','');
        imgData=encodeURIComponent(imgData);
        setFValue(name, imgData);
    }
    const handlePositionChange = position => {
        firstTime=false;
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
            onImageReady={LoadInitImage(pic)}


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