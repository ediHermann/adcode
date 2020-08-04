import React, {useState} from 'react'


const Tabs = ({tabItems, ...rest}) => {

    const [active, setActive] = useState(0)

    const SelectedComponent = tabItems[active].Component

    return <div className='tabs'>
        <ul className="tab-controller">
            {tabItems.map( (tab, idx) =>
                <li key={idx}
                    onClick={() => {
                        setActive(idx)}}
                    className={idx === active ? 'tab-active' : ''}>
                    {tab.title}
                </li>
                )}
        </ul>
        <div className="tab-content">
            <SelectedComponent {...rest}/>
        </div>
    </div>
}

export default Tabs