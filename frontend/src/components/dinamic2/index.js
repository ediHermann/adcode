import React, { useRef, useState } from "react";
import Editable from "./Editable";

const Table2 =() =>{
    const inputRef = useRef();
    const textareaRef = useRef();
    const [name, setName] = useState("");
    const [role, setRole] = useState("");
    const [observation, setObservation] = useState("");

    return (
        <div className="w-full max-w-md mx-auto">
            <form className="flex bg-white rounded px-8 py-8 pt-8">
                <div className="px-4 pb-4">
                    <Editable
                        text={name}
                        placeholder="Write a task name"
                        childRef={inputRef}
                        type="input"
                    >
                        <input
                            ref={inputRef}
                            type="text"
                            name="name"
                            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline border-blue-300"
                            placeholder="Write a task name"
                            value={name}
                            onChange={e => setName(e.target.value)}
                        />
                    </Editable>
                </div>
                <div className="px-4 pb-4">
                    <Editable
                        text={role}
                        placeholder="Write a task name"
                        childRef={inputRef}
                        type="input"
                    >
                        <input
                            ref={inputRef}
                            type="text"
                            name="role"
                            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline border-blue-300"
                            placeholder="Write a task name"
                            value={role}
                            onChange={e => setRole(e.target.value)}
                        />
                    </Editable>
                </div>
                <div className="px-4 pb-4">
                    <Editable
                        text={observation}
                        placeholder="Observations"
                        childRef={textareaRef}
                        type="textarea"
                    >
            <textarea
                ref={textareaRef}
                name="observation"
                className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline border-blue-300"
                placeholder="Observations"
                rows="1"
                value={observation}
                onChange={e => setObservation(e.target.value)}
            />
                    </Editable>
                </div>
            </form>
        </div>
    )
}

export default Table2