import * as Yup from 'yup'

const validationSchema = Yup.object().shape({
    name: Yup.string()
        .min(2, 'Your name should have at least 2 letters.')
        .max(64, 'Your name should not exceed 64 characters')
        .required(),
    email: Yup.string()
        .email().required()
        .max(150, 'Your email is too long'),
    message: Yup.string().required()
})

export default validationSchema