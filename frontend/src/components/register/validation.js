import * as Yup from 'yup'

const validationSchema = Yup.object().shape({
    name: Yup.string()
        .min(2, 'Your name should have at least 2 letters.')
        .max(64, 'Your name should not exceed 64 characters')
        .required('Your name is required!'),
    contact: Yup.string()
        .required('This field is required'),
    companyName: Yup.string()
        .required('This field is required'),
    cui: Yup.string()
        .min(12, 'CUI should have 9 characters')
        .max(12, 'CUI should have 9 characters')
        .required('Your CUI is required!'),
    cnp: Yup.string()
        .min(12, 'CUI should have 13 characters')
        .max(12, 'CUI should have 13 characters')
        .required('Your CUI is required!'),
    address: Yup.string()
        .required('Your address is required!'),
    phone: Yup.string()
        .matches(/^07[0-9]{8}$/,
            'Phone number is not valid!')
        .required('Phone number required'),
    email: Yup.string()
        .email()
        .min(4, 'Your email is not valid!')
        .max(64, 'Your email is too long!')
        .required('Your email is required!'),
    password: Yup.string()
        .max(20, 'Your password should have max 16 characters.')
        .matches(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/,
            'Your password must contain at least 8 Characters, 1 uppercase, 1 number and 1 special case character')
        .required('Your password is required!'),
    confirmPassword: Yup.string()
        .oneOf([Yup.ref('password'), null], 'Password do not match!')
        .required('You have to confirm your password!'),

})

export default validationSchema