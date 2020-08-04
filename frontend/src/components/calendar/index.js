// import React, {useState} from 'react';
// import DatePicker from 'react-datepicker'
// import { ro } from 'date-fns/locale'
// import "react-datepicker/dist/react-datepicker.css";
// import './styles.css'
//
// //local language will be changed with date-fns,
// // while the calendar will be used from the react-datepicker
//
// const CalendarComp = () => {
//     const [startDate, setStartDate] = useState(new Date())
//     return(
//        <DatePicker
//         selected={startDate}
//         onChange={ date => setStartDate(date)}
//         locale={ro}
//         dateFormat="dd MMM yyyy"
//
//        />
//     )
// }
//
// export default CalendarComp